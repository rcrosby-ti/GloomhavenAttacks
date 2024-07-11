extends TextureButton


signal icon_pressed(in_name)


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var deck_name = "monsters"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func set_deck(in_name, texture):
	deck_name = in_name
	$DeckSymbol.set_texture(texture)


func get_deck():
	return deck_name


func get_texture():
	return $DeckSymbol.get_texture()


func _on_DeckButton_pressed():
	emit_signal("icon_pressed", deck_name)

