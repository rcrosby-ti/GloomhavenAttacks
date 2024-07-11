extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


const DRAG_NONE = 0
const DRAG_CHECK = 1
const DRAG_IN_PROGESS = 2
const DRAG_FINISH = 3
const DRAG_UNDO = 4


var char_data : CharData

var deck_data : DeckData = null
var deck_list : Array = []
var active_deck = null
var deck : Deck = null
var swap_decks = false
var tap_to_draw = false
var use_fh_icons = false
var use_fh_perks = false

var active_shuffle = false
var shuffle_index = 0

var shuffle_to_do = []
var hold_active_deck = null

var perks_data : PerksData = null
var perks : Perks = null

var test_running = false


# Called when the node enters the scene tree for the first time.
func _ready():
	char_data = CharData.new()
	char_data.fill_in_textures()
	deck_data = DeckData.new()
	deck_data.fill_in_decks()
	deck_data.fill_in_textures()
	deck = Deck.new()
	deck.set_data(deck_data)
	$PlayWindow.set_deck(deck)
	perks_data = PerksData.new()
	perks = Perks.new()
	perks.set_data(perks_data)
	perks.set_deck_data(deck_data)
	$PerksWindow.set_perks(perks)
	load_config()
	update_decks()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func load_config():
	var config = ConfigFile.new()
	var err = config.load("user://gh_attacks.cfg")
	if err != OK:
		deck_list = []
		active_deck = null
		return
	
	deck_list = config.get_value("Decks", "deck_list", [])
	active_deck = config.get_value("Decks", "active_deck", null)
	tap_to_draw = config.get_value("Decks", "tap_to_draw", false)
	$PlayWindow.set_tap_to_draw(tap_to_draw)
	
	var do_swap = config.get_value("Decks", "swap", false)
	if (do_swap != swap_decks):
		swap_decks = do_swap
		$PlayWindow.swap_decks(swap_decks)
	
	var do_fh_icons = config.get_value("Decks", "fh_icons", false)
	if (do_fh_icons != use_fh_icons):
		use_fh_icons = do_fh_icons
		deck_data.swap_fh_icons(use_fh_icons)
		perks.set_fh_icons(use_fh_icons)
	
	var do_fh_perks = config.get_value("Decks", "fh_perks", false)
	if (do_fh_perks != use_fh_perks):
		use_fh_perks = do_fh_perks
		deck_data.swap_fh_perks(use_fh_perks)
		perks.swap_fh_perks(use_fh_perks)


func save_config():
	var config = ConfigFile.new()
	config.set_value("Decks", "version", 2)
	config.set_value("Decks", "deck_list", deck_list)
	config.set_value("Decks", "active_deck", active_deck)
	config.set_value("Decks", "swap", swap_decks)
	config.set_value("Decks", "tap_to_draw", tap_to_draw)
	config.set_value("Decks", "fh_icons", use_fh_icons)
	config.set_value("Decks", "fh_perks", use_fh_perks)
	config.save("user://gh_attacks.cfg")


func update_active_deck():
	var icon_texture = null
	if not deck_list.has(active_deck):
		if (deck_list.size() > 0):
			active_deck = deck_list[0]
			icon_texture = char_data.get_texture(active_deck)
		else:
			active_deck = null
	else:
		icon_texture = char_data.get_texture(active_deck)
	$PlayWindow.set_active_deck(active_deck, icon_texture)
	$ActiveWindow.set_class_icon(icon_texture)
	perks.init_perks(active_deck)


func update_decks():
	$PlayWindow.set_deck_list(deck_list, char_data)
	update_active_deck()


func _on_PlayWindow_show_menu():
	$PlayWindow.hide()
	$TopMenu.show()


func _on_TopMenu_choose_decks():
	$TopMenu.hide()
	$ChooseWindow.set_char_list(char_data)
	$ChooseWindow.set_deck_list(deck_list, deck_data)
	$ChooseWindow.show()


func put_up_edit_deck():
	var icon_texture = char_data.get_texture(active_deck)
	$EditWindow.init_edit_deck(deck, deck_data, icon_texture)
	$EditWindow.show()


func _on_TopMenu_edit_deck():
	if active_deck != null:
		$TopMenu.hide()
		put_up_edit_deck()


func _on_TopMenu_preferences():
	$PrefsWindow.set_swap(swap_decks)
	$PrefsWindow.set_tap_to_draw(tap_to_draw)
	$PrefsWindow.set_fh_icons(use_fh_icons)
	$PrefsWindow.set_fh_perks(use_fh_perks)
	$TopMenu.hide()
	$PrefsWindow.show()


func _on_TopMenu_cancel_top():
	$TopMenu.hide()
	$PlayWindow.show()


func _on_ChooseWindow_choose_done(new_list):
	$ChooseWindow.hide()
	deck_list = new_list
	save_config()
	update_decks()
	$PlayWindow.check_active()
	$PlayWindow.show()


func _on_EditWindow_add_card():
	var icon_texture = char_data.get_texture(active_deck)
	$AddCardWindow.set_deck(deck_data, icon_texture)
	$EditWindow.hide()
	$AddCardWindow.show()


func _on_EditWindow_reset():
	$EditWindow.hide()
	$ResetWindow.set_reset_deck(active_deck, char_data)
	$ResetWindow.show()


func _on_EditWindow_edit_done(new_deck):
	deck.reconcile_decks(new_deck)
	deck.save_config()
	$PlayWindow.set_decks(0)
	$EditWindow.hide()
	$PlayWindow.show()


func _on_AddCardWindow_cancel_add():
	$AddCardWindow.hide()
	$EditWindow.show()


func _on_AddCardWindow_do_add(left, main, right):
	$EditWindow.add_new_card(left, main, right)
	$AddCardWindow.hide()
	$EditWindow.show()


func _on_PlayWindow_change_active_deck(in_name):
	if in_name != active_deck:
		active_deck = in_name
		var icon_texture = char_data.get_texture(active_deck)
		$ActiveWindow.set_class_icon(icon_texture)
		save_config()
		perks.init_perks(active_deck)


func _on_PlayWindow_drop_on_deck():
	$PlayWindow.hide()
	$ShuffleMenu.show()


func shuffle_action():
	if deck.get_discard_count() > 0:
		if (deck.has_active(0)):
			var count = deck.get_active_count()
			var max_count = deck.get_max_active()
			$ActiveWindow.init_active_window(count, max_count, deck_data)
			$ActiveWindow.show()
			active_shuffle = true
			shuffle_index = 0
		else:
			active_shuffle = false
			deck.shuffle(0)
			deck.save_config()
			$PlayWindow.set_decks(0)


func _on_ShuffleMenu_shuffle():
	$ShuffleMenu.hide()
	hold_active_deck = active_deck
	shuffle_action()
	if (active_shuffle == false):
		$PlayWindow.show()


func _on_ShuffleMenu_undo_discard():
	if deck.get_discard_count() > 0:
		deck.undo_discard()
		deck.save_config()
		$PlayWindow.set_decks(0)
	$ShuffleMenu.hide()
	$PlayWindow.show()


func _on_ShuffleMenu_cancel_shuffle():
	$ShuffleMenu.hide()
	$PlayWindow.show()


func _on_ShuffleMenu_shuffle_partial():
	$ShuffleMenu.hide()
	hold_active_deck = active_deck
	if deck.get_discard_count() > 0:
		var index = $PlayWindow.get_drag_index()
		if (deck.has_active(index)):
			var count = deck.get_active_count()
			var max_count = deck.get_max_active()
			$ActiveWindow.init_active_window(count, max_count, deck_data)
			$ActiveWindow.show()
			active_shuffle = true
			shuffle_index = index
			return
		else:
			deck.shuffle(index)
			deck.save_config()
			$PlayWindow.set_decks(0)
	$PlayWindow.show()


func _on_ShuffleMenu_put_on_top():
	if deck.get_discard_count() > 0:
		var index = $PlayWindow.get_drag_index()
		deck.put_on_top(index)
		deck.save_config()
		if (index > 1):
			index -= 1
		$PlayWindow.set_decks(index)
	$ShuffleMenu.hide()
	$PlayWindow.show()


func _on_ShuffleMenu_put_on_bottom():
	if deck.get_discard_count() > 0:
		var index = $PlayWindow.get_drag_index()
		deck.put_on_bottom(index)
		deck.save_config()
		if (index > 1):
			index -= 1
		$PlayWindow.set_decks(index)
	$ShuffleMenu.hide()
	$PlayWindow.show()


func _on_PlayWindow_show_curse():
	if (active_deck != null):
		$PlayWindow.hide()
		$CurseWindow.show()


func _on_PlayWindow_show_bless():
	if (active_deck != null):
		$PlayWindow.hide()
		$BlessWindow.show()


func _on_PlayWindow_show_active(count, max_count):
	$ActiveWindow.init_active_window(count, max_count, deck_data)
	$PlayWindow.hide()
	$ActiveWindow.show()
	active_shuffle = false


func _on_CurseWindow_curse_yes():
	deck.add_card(0)
	deck.save_config()
	$PlayWindow.set_decks(0)
	$CurseWindow.hide()
	$PlayWindow.show()


func _on_CurseWindow_curse_no():
	$CurseWindow.hide()
	$PlayWindow.show()


func _on_CurseWindow_curse_sixth():
	deck.add_card_top_sixth(0)
	deck.save_config()
	$PlayWindow.set_decks(0)
	$CurseWindow.hide()
	$PlayWindow.show()


func _on_BlessWindow_bless_yes():
	deck.add_card(1)
	deck.save_config()
	$PlayWindow.set_decks(0)
	$BlessWindow.hide()
	$PlayWindow.show()


func _on_BlessWindow_bless_no():
	$BlessWindow.hide()
	$PlayWindow.show()


func _on_ResetWindow_reset_yes():
	deck.load_default()
	$PlayWindow.set_decks(0)
	perks.reset_perks()
	$ResetWindow.hide()
	put_up_edit_deck()


func _on_ResetWindow_reset_no():
	$ResetWindow.hide()
	$EditWindow.show()


func _on_PrefsWindow_prefs_done():
	var last_swap = swap_decks
	var last_tap = tap_to_draw
	var last_icons = use_fh_icons
	var last_perks = use_fh_perks
	var dirty = false
	swap_decks = $PrefsWindow.get_swap()
	if (swap_decks != last_swap):
		$PlayWindow.swap_decks(swap_decks)
		dirty = true
	tap_to_draw = $PrefsWindow.get_tap_to_draw()
	if (tap_to_draw != last_tap):
		$PlayWindow.set_tap_to_draw(tap_to_draw)
		dirty = true
	use_fh_icons = $PrefsWindow.get_fh_icons()
	if (use_fh_icons != last_icons):
		deck_data.swap_fh_icons(use_fh_icons)
		perks.set_fh_icons(use_fh_icons)
		$PlayWindow.redraw_icons()
		dirty = true
	use_fh_perks = $PrefsWindow.get_fh_perks()
	if (use_fh_perks != last_perks):
		deck_data.swap_fh_perks(use_fh_perks)
		perks.swap_fh_perks(use_fh_perks)
		perks.init_perks(active_deck)
		dirty = true
	if (dirty):
		save_config()
	$PrefsWindow.hide()
	$PlayWindow.show()


func _on_ActiveWindow_active_done(count):
	$ActiveWindow.hide()
	$PlayWindow.set_active_count(count)
	if (active_shuffle):
		deck.shuffle(shuffle_index)
		deck.save_config()
		$PlayWindow.set_decks(0)
		shuffle_handler()
	else:
		$PlayWindow.show()


func _on_TopMenu_end_of_round():
	$TopMenu.hide()
	var to_do = []
	for i in range(deck_list.size()):
		if (deck.needs_shuffle_file(deck_list[i])):
			to_do.append(deck_list[i])
	if (to_do.size() == 0):
		$NoneEndWindow.show()
	else:
		$EndRoundWindow.init_decks(to_do, char_data)
		$EndRoundWindow.show()


func _on_NoneEndWindow_none_end():
	$NoneEndWindow.hide()
	$PlayWindow.show()


func shuffle_handler():
	while (shuffle_to_do.size() > 0):
		active_deck = shuffle_to_do.pop_back()
		update_active_deck()
		shuffle_action()
		if (active_shuffle):
			return
	active_deck = hold_active_deck
	update_active_deck()
	$PlayWindow.show()


func _on_EndRoundWindow_end_round(to_do : Array):
	$EndRoundWindow.hide()
	hold_active_deck = active_deck
	shuffle_to_do = to_do
	shuffle_handler()


func _on_EndRoundWindow_cancel_round():
	$EndRoundWindow.hide()
	$PlayWindow.show()


func _on_EditWindow_perks_list():
	if (active_deck == "monsters"):
		return
	$EditWindow.hide()
	var icon_texture = char_data.get_texture(active_deck)
	$PerksWindow.init_perks(active_deck, icon_texture)
	$PerksWindow.show()


func _on_PerksWindow_perks_cancel():
	$PerksWindow.hide()
	$EditWindow.show()


func _on_PerksWindow_perks_done(perks_deck : Deck):
	$PerksWindow.hide()
	var card_data
	var icon_texture = char_data.get_texture(active_deck)
	for i in range(perks_deck.get_card_data_count()):
		card_data = perks_deck.get_card(i)
		if (card_data[0] < 0):
			$PerksFailWindow.set_card(card_data, deck_data, icon_texture)
			$PerksFailWindow.show()
			return
	perks.save_config()
	$EditWindow.copy_curse_bless(perks_deck)
	deck.copy_deck(perks_deck)
	deck.shuffle(0)
	deck.save_config()
	$PlayWindow.set_decks(0)
	$EditWindow.init_edit_deck(deck, deck_data, icon_texture)
	$EditWindow.show()


func _on_PerksFailWindow_fail_done():
	$PerksFailWindow.hide()
	perks.reset_deck()
	$PerksWindow.show()


func _on_TestWindow_test_tick(rando_in):
	test_running = true
	if ($PlayWindow.is_visible()):
		$PlayWindow.test_tick(rando_in)
	elif ($ChooseWindow.is_visible()):
		$ChooseWindow.test_tick(rando_in)
	elif ($EditWindow.is_visible()):
		$EditWindow.test_tick(rando_in)
	elif ($AddCardWindow.is_visible()):
		$AddCardWindow.test_tick(rando_in)
	elif ($TopMenu.is_visible()):
		$TopMenu.test_tick(rando_in)
	elif ($ShuffleMenu.is_visible()):
		$ShuffleMenu.test_tick(rando_in)
	elif ($CurseWindow.is_visible()):
		$CurseWindow.test_tick(rando_in)
	elif ($BlessWindow.is_visible()):
		$BlessWindow.test_tick(rando_in)
	elif ($ResetWindow.is_visible()):
		$ResetWindow.test_tick(rando_in)
	elif ($PrefsWindow.is_visible()):
		$PrefsWindow.test_tick(rando_in)
	elif ($ActiveWindow.is_visible()):
		$ActiveWindow.test_tick(rando_in)
	elif ($NoneEndWindow.is_visible()):
		$NoneEndWindow.test_tick(rando_in)
	elif ($EndRoundWindow.is_visible()):
		$EndRoundWindow.test_tick(rando_in)
	elif ($PerksWindow.is_visible()):
		$PerksWindow.test_tick(rando_in)
	elif ($PerksFailWindow.is_visible()):
		$PerksFailWindow.test_tick(rando_in)
	test_running = false

