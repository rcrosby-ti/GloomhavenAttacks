extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var deck_scene : PackedScene = preload("res://CardBack.tscn")

var deck = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func set_deck(deck_in):
	deck = deck_in


func _get_drag_data(_position):
	if $TopDeck.visible and (deck.get_draw_count() > 0):
		var card = deck_scene.instance()
		card.rect_scale = Vector2( 0.7, 0.7 )
		card.set_deck_icon($TopDeck.get_deck_icon())
		set_drag_preview(card)
		return "deck"
	else:
		return "noop"


func _can_drop_data(_position, data):
	return data == "discard"


func _drop_data(_position, data):
	if data == "discard":
		emit_signal("drop_on_deck")

