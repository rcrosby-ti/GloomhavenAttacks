extends TextureRect
class_name CardBack


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func set_deck_icon(icon_texture : Texture):
	$DeckIcon.texture = icon_texture


func get_deck_icon():
	return $DeckIcon.texture

