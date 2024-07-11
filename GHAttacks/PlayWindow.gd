extends Control


signal show_menu
signal change_active_deck(in_name)
signal drop_on_deck
signal show_curse
signal show_bless
signal show_active(count, max_count)


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


const DRAG_NONE = 0
const DRAG_DECK = 1
const DRAG_DISCARD = 2
const DRAG_DISCARD_EDGE = 3

const ANIMATE_NONE = 0
const ANIMATE_FLIP = 1
const ANIMATE_SLIDE_OFF = 2
const ANIMATE_SLIDE_ON = 3
const ANIMATE_RETURN_DECK = 4
const ANIMATE_RETURN_DISCARD = 5
const ANIMATE_RETURN_EDGE = 6


var button_scene : PackedScene = preload("res://DeckButton.tscn")

var deck : Deck = null
var active_deck = null
var discard_index = 0
var deck_list = null
var buttons = []
var char_data: CharData = null
var class_icon = null

var animating = ANIMATE_NONE
var animation_progress = 0.0

var dropping = false
var drop_progress = 0.0
var drop_end_pos = Vector2( 0, 0 )
var drop_velocity = Vector2( 0, 0 )

var dragging = DRAG_NONE
var drag_offset = Vector2( 0, 0 )
var drag_index = -1

var tap_to_draw = false


# Called when the node enters the scene tree for the first time.
func _ready():
	for _i in range(10):
		var button = button_scene.instance()
		$"PlayContainer/PlayMenuBar/DeckIconGrid".add_child(button)
		button.connect("icon_pressed", self, "_on_DeckButton_deck_pressed")
		button.hide()
		buttons.append(button)


func _input(event):
	if not visible:
		return
	if event is InputEventMouseButton:
		if dragging == DRAG_DECK:
			if (event.button_index == BUTTON_LEFT) and (not event.pressed):
				do_deck_flip(event)
				accept_event()
		elif dragging == DRAG_DISCARD:
			if (event.button_index == BUTTON_LEFT) and (not event.pressed):
				do_discard_drop(event)
				accept_event()
		elif dragging == DRAG_DISCARD_EDGE:
			if (event.button_index == BUTTON_LEFT) and (not event.pressed):
				do_discard_edge_drop(event)
				accept_event()
		elif (event.button_index == BUTTON_LEFT) and event.pressed:
			check_for_drag(event)
	elif event is InputEventMouseMotion:
		if dragging != DRAG_NONE:
			var event_in = make_input_local(event)
			$"DragCard".set_global_position(event_in.get_position() + drag_offset)
			accept_event()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dropping:
		var next_progress = drop_progress - delta
		if (next_progress <= 0.0):
			dropping = false
			$"DragCard".set_global_position(drop_end_pos)
			drop_progress = 0.0
			if (animating != ANIMATE_FLIP):
				clean_up_animation()
		else:
			$"DragCard".set_global_position($"DragCard".get_global_position() + \
				delta * drop_velocity)
			drop_progress = next_progress
	
	if (animating == ANIMATE_FLIP):
		var progress = animation_progress - delta
		if (progress <= 0.0):
			$"DragCard".set_global_position(drop_end_pos)
			clean_up_animation()
		else:
			$"DragCard/DragFace".rect_scale = Vector2( 1.0, 1.0 - 4 * progress )
			$"DragCard/DragBack".rect_scale = Vector2( 1.0, 4 * progress - 1.0 )
			if progress <= 0.25 and animation_progress > 0.25:
				$"DragCard/DragBack".hide()
				$"DragCard/DragFace".show()
			animation_progress = progress


func _on_MenuButton_pressed():
	emit_signal("show_menu")


func set_deck(deck_in: Deck):
	deck = deck_in


func set_deck_list(list_in, in_data : CharData):
	char_data = in_data
	var char_name
	deck_list = list_in
	for i in range(10):
		if i < deck_list.size():
			char_name = deck_list[i]
			buttons[i].set_deck(char_name, char_data.get_texture(char_name))
			buttons[i].show()
		else:
			buttons[i].hide()
	if (deck_list.size() < 2):
		$"PlayContainer/PlayMenuBar/DeckIconGrid".columns = 1
	elif (deck_list.size() > 4):
		$"PlayContainer/PlayMenuBar/DeckIconGrid".columns = 5
	else :
		$"PlayContainer/PlayMenuBar/DeckIconGrid".columns = deck_list.size()


func set_active_deck(deck_name, icon_texture : Texture):
	if deck_name == active_deck:
		return
	
	class_icon = icon_texture
	if (deck_name == null):
		active_deck = null
		deck.load_empty_deck()
		clear_decks()
	else:
		active_deck = deck_name
		$"PlayContainer/DeckPile/TopDeck".set_deck_icon(icon_texture)
		$"PlayContainer/DeckPile/TopDeck".show()
		deck.load_config(active_deck)
		set_decks(0)


func clear_decks():
	$"PlayContainer/DeckPile/TopDeck".hide()
	$"PlayContainer/DeckPile/NeedShuffle".hide()
	$"PlayContainer/DiscardPile/TopDiscard".hide()
	$"PlayContainer/DeckPile/DeckStatsBar/DeckCurses".text = "0"
	$"PlayContainer/DeckPile/DeckStatsBar/DeckRemaining".text = "0"
	$"PlayContainer/DeckPile/DeckStatsBar/DeckBlesses".text = "0"
	$"PlayContainer/DiscardPile/DiscardStatsBar/DiscardCount".text = "0 of 0"
	$"PlayContainer/DiscardPile/SideDiscard".hide()
	$"PlayContainer/DiscardPile/DiscardPull".hide()
	$"PlayContainer/DiscardPile/DiscardPush".hide()


func set_decks(index : int):
	discard_index = deck.get_discard_count()
	if (index > 0) && (index < discard_index):
		discard_index = index
	check_deck()
	check_discards()
	check_need_shuffle()
	check_active()


func adjust_discards(inc):
	discard_index += inc
	check_discards()


func check_deck():
	var remaining: Array = deck.get_draw_counts()
	$"PlayContainer/DeckPile/DeckStatsBar/DeckCurses".text = str(remaining[DeckData.NULL_CURSE])
	$"PlayContainer/DeckPile/DeckStatsBar/DeckBlesses".text = str(remaining[DeckData.DOUBLE_BLESS])
	$"PlayContainer/DeckPile/DeckStatsBar/DeckRemaining".text = str(deck.get_draw_count())


func check_discards():
	var count = deck.get_discard_count()
	if (tap_to_draw):
		$"PlayContainer/DiscardPile/DiscardHint".hide()
	else:
		$"PlayContainer/DiscardPile/DiscardHint".show()
	if count > 0:
		if (discard_index < 1) || (discard_index > count):
			discard_index = count
		var card_data = deck.get_discard_card(discard_index)
		$"PlayContainer/DiscardPile/DiscardStatsBar/DiscardCount".text = str(discard_index) + " of " + str(count)
		$"PlayContainer/DiscardPile/TopDiscard".set_card(card_data, deck.get_data())
		$"PlayContainer/DiscardPile/TopDiscard".set_class_icon(class_icon)
		$"PlayContainer/DiscardPile/TopDiscard".show()
		if (discard_index == count):
			$"PlayContainer/DiscardPile/SideDiscard".hide()
		else:
			card_data = deck.get_discard_card(discard_index + 1)
			$"PlayContainer/DiscardPile/SideDiscard".set_card(card_data, deck.get_data())
			$"PlayContainer/DiscardPile/SideDiscard".set_class_icon(class_icon)
			$"PlayContainer/DiscardPile/SideDiscard".show()
		if (tap_to_draw):
			if (discard_index > 1):
				$"PlayContainer/DiscardPile/DiscardPush".show()
			else:
				$"PlayContainer/DiscardPile/DiscardPush".hide()
			if (discard_index < count):
				$"PlayContainer/DiscardPile/DiscardPull".show()
			else:
				$"PlayContainer/DiscardPile/DiscardPull".hide()
		else:
			$"PlayContainer/DiscardPile/DiscardPull".hide()
			$"PlayContainer/DiscardPile/DiscardPush".hide()
	else:
		$"PlayContainer/DiscardPile/DiscardStatsBar/DiscardCount".text = "0 of 0"
		$"PlayContainer/DiscardPile/TopDiscard".hide()
		$"PlayContainer/DiscardPile/SideDiscard".hide()
		$"PlayContainer/DiscardPile/DiscardPull".hide()
		$"PlayContainer/DiscardPile/DiscardPush".hide()


func check_need_shuffle():
	var discards: Array = deck.get_discards()
	if discards.has(DeckData.NULL) || discards.has(DeckData.DOUBLE):
		$"PlayContainer/DeckPile/NeedShuffle".show()
	else:
		$"PlayContainer/DeckPile/NeedShuffle".hide()


func _on_DeckButton_deck_pressed(in_name):
	var texture = null
	if in_name != null:
		texture = char_data.get_texture(in_name)
	set_active_deck(in_name, texture)
	emit_signal("change_active_deck", in_name)


func _on_DeckCurses_pressed():
	emit_signal("show_curse")


func _on_DeckBlesses_pressed():
	emit_signal("show_bless")


func set_drop_velocity(start_pos : Vector2):
	dropping = true
	var dist = drop_end_pos.distance_to(start_pos)
	drop_progress = dist / 1600.0
	drop_velocity = (drop_end_pos - start_pos) / drop_progress


func do_deck_flip(event_in):
	var event = make_input_local(event_in)
	var pos = event.get_position()
	var start_pos = pos + drag_offset
	var rect1 = $"PlayContainer/DiscardPile/TopDiscard".get_global_rect()
	if (dragging == DRAG_NONE) || (rect1.has_point(pos)):
		deck.draw_card()
		deck.save_config()
		animating = ANIMATE_FLIP
		animation_progress = 0.5
		drop_end_pos = rect1.position
		var card = deck.get_discard_card(deck.get_discard_count())
		$"DragCard/DragFace".set_card(card, deck.get_data())
		$"DragCard/DragFace".set_class_icon(class_icon)
		check_active()
	else:
		animating = ANIMATE_RETURN_DECK
		drop_end_pos = $"PlayContainer/DeckPile".get_global_position()
	dragging = DRAG_NONE
	set_drop_velocity(start_pos)


func do_discard_drop(event_in):
	var event = make_input_local(event_in)
	var pos = event.get_position()
	var start_pos = pos + drag_offset
	var rect1 = $"PlayContainer/DeckPile".get_global_rect()
	var rect2 = $"PlayContainer/DiscardPile/SideDiscard".get_global_rect()
	if (dragging == DRAG_NONE) || (rect1.has_point(pos)):
		check_discards()
		$"DragCard".hide()
		emit_signal("drop_on_deck")
	elif rect2.has_point(pos) and discard_index > 1:
		animating = ANIMATE_SLIDE_OFF
		drop_end_pos = rect2.position
	else:
		animating = ANIMATE_RETURN_DISCARD
		drop_end_pos = $"PlayContainer/DiscardPile/TopDiscard".get_global_position()
	dragging = DRAG_NONE
	set_drop_velocity(start_pos)


func do_discard_edge_drop(event_in):
	var event = make_input_local(event_in)
	dragging = DRAG_NONE
	var pos = event.get_position()
	var start_pos = pos + drag_offset
	var rect1 = $"PlayContainer/DeckPile".get_global_rect()
	var rect2 = $"PlayContainer/DiscardPile/SideDiscard".get_global_rect()
	var rect3 = $"PlayContainer/DiscardPile/TopDiscard".get_global_rect()
	if rect1.has_point(pos):
		check_discards()
		$"DragCard".hide()
		emit_signal("drop_on_deck")
	elif rect3.has_point(pos) and not rect2.has_point(pos):
		animating = ANIMATE_SLIDE_ON
		drop_end_pos = rect3.position
	else:
		animating = ANIMATE_RETURN_EDGE
		drop_end_pos = rect2.position
	set_drop_velocity(start_pos)


func check_for_drag(event_in):
	if active_deck == null:
		return
	
	var event = make_input_local(event_in)
	var pos = event.get_position()
	var rect1
	
	if ($"PlayContainer/DiscardPile/DiscardStatsBar/ActiveCount".visible):
		rect1 = $"PlayContainer/DiscardPile/DiscardStatsBar/ActiveCount".get_global_rect()
		if rect1.has_point(pos):
			return
	
	if ($"PlayContainer/DiscardPile/DiscardPush".visible):
		rect1 = $"PlayContainer/DiscardPile/DiscardPush".get_global_rect()
		if rect1.has_point(pos):
			return
	
	if ($"PlayContainer/DiscardPile/DiscardPull".visible):
		rect1 = $"PlayContainer/DiscardPile/DiscardPull".get_global_rect()
		if rect1.has_point(pos):
			return
	
	rect1 = $"PlayContainer/DiscardPile/SideDiscard".get_global_rect()
	if $"PlayContainer/DiscardPile/SideDiscard".visible and rect1.has_point(pos):
		start_edge_drag(pos, rect1)
		return
	
	rect1 = $"PlayContainer/DiscardPile".get_global_rect()
	if discard_index > 0 and rect1.has_point(pos):
		start_discard_drag(pos, rect1)
		if (tap_to_draw):
			dragging = DRAG_NONE
			do_discard_drop(event_in)
		return
	
	rect1 = $"PlayContainer/DeckPile/DeckStatsBar".get_global_rect()
	if rect1.has_point(pos):
		return
	
	rect1 = $"PlayContainer/DeckPile".get_global_rect()
	if deck.get_draw_count() > 0 and rect1.has_point(pos):
		start_deck_drag(pos, rect1)
		if (tap_to_draw):
			dragging = DRAG_NONE
			do_deck_flip(event_in)
		return


func start_deck_drag(pos, rect1):
	clean_up_animation()
	dragging = DRAG_DECK
	drag_offset = rect1.position - pos
	$"DragCard/DragBack".set_deck_icon($"PlayContainer/DeckPile/TopDeck".get_deck_icon())
	$"DragCard/DragBack".show()
	$"DragCard/DragFace".hide()
	$"DragCard".set_global_position(rect1.position)
	$"DragCard".show()
	accept_event()


func start_discard_drag(pos, rect1):
	clean_up_animation()
	dragging = DRAG_DISCARD
	drag_offset = rect1.position - pos
	drag_index = discard_index
	var card = deck.get_discard_card(discard_index)
	$"DragCard/DragFace".set_card(card, deck.get_data())
	$"DragCard/DragFace".set_class_icon(class_icon)
	if (discard_index > 1):
		card = deck.get_discard_card(discard_index - 1)
		$"PlayContainer/DiscardPile/TopDiscard".set_card(card, deck.get_data())
		$"PlayContainer/DiscardPile/TopDiscard".set_class_icon(class_icon)
	else:
		$"PlayContainer/DiscardPile/TopDiscard".hide()
	$"PlayContainer/DiscardPile/DiscardStatsBar/DiscardCount".text = str(discard_index - 1) + " of " + str(deck.get_discard_count())
	$"DragCard/DragBack".hide()
	$"DragCard/DragFace".show()
	$"DragCard".set_global_position(rect1.position)
	$"DragCard".show()
	accept_event()


func start_edge_drag(pos, rect1):
	clean_up_animation()
	dragging = DRAG_DISCARD_EDGE
	drag_offset = rect1.position - pos
	drag_index = discard_index + 1
	var card = deck.get_discard_card(discard_index + 1)
	$"DragCard/DragFace".set_card(card, deck.get_data())
	$"DragCard/DragFace".set_class_icon(class_icon)
	if discard_index < (deck.get_discard_count() - 1):
		card = deck.get_discard_card(discard_index + 2)
		$"PlayContainer/DiscardPile/SideDiscard".set_card(card, deck.get_data())
		$"PlayContainer/DiscardPile/SideDiscard".set_class_icon(class_icon)
	else:
		$"PlayContainer/DiscardPile/SideDiscard".hide()
	$"DragCard/DragBack".hide()
	$"DragCard/DragFace".show()
	$"DragCard".set_global_position(rect1.position)
	$"DragCard".show()
	accept_event()


func clean_up_animation():
	$"DragCard".hide()
	if animating == ANIMATE_FLIP:
		$"DragCard/DragFace".rect_scale = Vector2( 1.0, 1.0 )
		$"DragCard/DragBack".rect_scale = Vector2( 1.0, 1.0 )
		set_decks(0)
	elif animating == ANIMATE_SLIDE_OFF:
		adjust_discards(-1)
	elif animating == ANIMATE_SLIDE_ON:
		adjust_discards(1)
	elif animating != ANIMATE_RETURN_DECK:
		check_discards()
	animating = ANIMATE_NONE


func swap_decks(do_swap):
	var deck_pile = $"PlayContainer/DeckPile"
	var discard_pile = $"PlayContainer/DiscardPile"
	if (do_swap):
		$"PlayContainer".move_child(discard_pile, 1)
		$"PlayContainer".move_child(deck_pile, 3)
	else:
		$"PlayContainer".move_child(deck_pile, 1)
		$"PlayContainer".move_child(discard_pile, 3)


func browsing_discards():
	var count = deck.get_discard_count()
	return (discard_index < count)


func get_drag_index():
	return drag_index


func set_tap_to_draw(do_tap):
	tap_to_draw = do_tap
	check_discards()


func redraw_icons():
	check_discards()


func check_active():
	var count = deck.get_active_count()
	$"PlayContainer/DiscardPile/DiscardStatsBar/ActiveCount".text = str(count)
	var max_count = deck.get_max_active()
	if (max_count > 0):
		$"PlayContainer/DiscardPile/DiscardStatsBar/UnusedActive".hide()
		$"PlayContainer/DiscardPile/DiscardStatsBar/ActiveCount".show()
	else:
		$"PlayContainer/DiscardPile/DiscardStatsBar/ActiveCount".hide()
		$"PlayContainer/DiscardPile/DiscardStatsBar/UnusedActive".show()


func _on_ActiveCount_pressed():
	emit_signal("show_active", deck.get_active_count(), deck.get_max_active())


func set_active_count(count):
	deck.set_active_count(count)
	check_active()


func _on_DiscardPush_pressed():
	var rect1 = $"PlayContainer/DiscardPile".get_global_rect()
	var pos = rect1.position
	start_discard_drag(pos, rect1)
	dragging = DRAG_NONE
	animating = ANIMATE_SLIDE_OFF
	var rect2 = $"PlayContainer/DiscardPile/SideDiscard".get_global_rect()
	drop_end_pos = rect2.position
	set_drop_velocity(pos)
	if (discard_index < 3):
		$"PlayContainer/DiscardPile/DiscardPush".hide()


func _on_DiscardPull_pressed():
	var rect1 = $"PlayContainer/DiscardPile/SideDiscard".get_global_rect()
	var pos = rect1.position
	start_edge_drag(pos, rect1)
	dragging = DRAG_NONE
	animating = ANIMATE_SLIDE_ON
	var rect3 = $"PlayContainer/DiscardPile/TopDiscard".get_global_rect()
	drop_end_pos = rect3.position
	set_drop_velocity(pos)
	if ((deck.get_discard_count() - discard_index) < 2):
		$"PlayContainer/DiscardPile/DiscardPull".hide()


func test_tick(rando_in):
	var count = 13 + deck_list.size()
	var choice = rando_in.randi_range(0, count - 1)
	if (choice == 0):
		if ($"PlayContainer/DiscardPile/DiscardPush".is_visible()):
			print("PlayWindow: discard push")
			_on_DiscardPush_pressed()
	elif (choice == 1):
		if ($"PlayContainer/DiscardPile/DiscardPull".is_visible()):
			print("PlayWindow: discard pull")
			_on_DiscardPull_pressed()
	elif (choice == 2):
		if ($"PlayContainer/DiscardPile/DiscardStatsBar/ActiveCount".is_visible()):
			print("PlayWindow: active count")
			_on_ActiveCount_pressed()
	elif (choice == 3):
		print("PlayWindow: curses")
		_on_DeckCurses_pressed()
	elif (choice == 4):
		print("PlayWindow: blesses")
		_on_DeckBlesses_pressed()
	elif (choice == 5):
		print("PlayWindow: menu")
		_on_MenuButton_pressed()
	elif (choice < 12):
		var event = InputEventMouseButton.new()
		event.button_index = BUTTON_LEFT
		event.pressed = true
		var rect = $"PlayContainer/DeckPile".get_global_rect()
		event.position = Vector2(rect.position.x + rect.size.x / 2,
			rect.position.y + rect.size.y / 2)
		event.global_position = event.position
		print("PlayWindow: draw card")
		_input(event)
	elif (choice == 12):
		var event = InputEventMouseButton.new()
		event.button_index = BUTTON_LEFT
		event.pressed = true
		var rect = $"PlayContainer/DiscardPile".get_global_rect()
		event.position = Vector2(rect.position.x + rect.size.x / 2,
			rect.position.y + rect.size.y / 2)
		event.global_position = event.position
		print("PlayWindow: discards")
		_input(event)
	else:
		choice -= 13
		var use_name = buttons[choice].get_deck()
		print("PlayWindow: deck: ", use_name)
		_on_DeckButton_deck_pressed(use_name)

