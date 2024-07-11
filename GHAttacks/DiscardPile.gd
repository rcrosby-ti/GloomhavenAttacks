extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var deck_scene : PackedScene = preload("res://CardFace.tscn")

var deck = null
var top_index = 0
var do_slide_left = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func set_deck(deck_in):
	deck = deck_in


func set_top_index(index):
	top_index = index


func sliding_left():
	return do_slide_left


func _get_drag_data(position):
	if not $TopDiscard.visible:
		return "noop"
	var min_x = rect_size.x * 0.2
	var max_x = rect_size.x * 0.8
	if (position.x < min_x) or (position.x > max_x):
		if top_index >= deck.get_discard_count():
			return "noop"
		var card = deck_scene.instance()
		card.size = Vector2( 576, 390 )
		card.rect_scale = Vector2( 0.7, 0.7 )
		card.set_card(deck.get_discard_card(top_index + 1), deck.get_data())
		set_drag_preview(card)
		if (position.x < min_x):
			do_slide_left = true
		else:
			do_slide_left = false
		return "discard_edge"
	else:
		if top_index < 1:
			return "noop"
		var card = deck_scene.instance()
		card.size = Vector2( 576, 390 )
		card.rect_scale = Vector2( 0.7, 0.7 )
		card.copy_card($TopDiscard)
		set_drag_preview(card)
		return "discard"


func _can_drop_data(position, data):
	if data == "deck":
		return true
	var min_x = rect_size.x * 0.2
	var max_x = rect_size.x * 0.8
	if (position.x < min_x) or (position.x > max_x):
		return (data == "discard") && (top_index > 1)
	else:
		return (data == "discard_edge")


func _drop_data(position, data):
	if data == "deck":
		emit_signal("drop_on_discard")
	else:
		var min_x = rect_size.x * 0.2
		var max_x = rect_size.x * 0.8
		if (position.x < min_x):
			do_slide_left = true
		elif (position.x > max_x):
			do_slide_left = false
		emit_signal("slide_discard", data)

