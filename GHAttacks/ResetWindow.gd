extends PanelContainer


signal reset_yes
signal reset_no


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var button_scene : PackedScene = preload("res://DeckButton.tscn")
var reset_button = null


# Called when the node enters the scene tree for the first time.
func _ready():
	reset_button = button_scene.instance()
	$"Margins/ResetContainer/ResetIcon".add_child(reset_button)


func set_reset_deck(in_name, in_data : CharData):
	reset_button.set_deck(in_name, in_data.get_texture(in_name))


func _on_YesButton_pressed():
	emit_signal("reset_yes")


func _on_NoButton_pressed():
	emit_signal("reset_no")


func test_tick(rando_in):
	var choice = rando_in.randi_range(0, 1)
	if (choice == 1):
		print("ResetWindow: Yes")
		_on_YesButton_pressed()
	else:
		print("ResetWindow: No")
		_on_NoButton_pressed()

