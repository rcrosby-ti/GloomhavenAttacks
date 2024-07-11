extends PanelContainer


signal end_round
signal cancel_round


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var button_scene : PackedScene = preload("res://DeckButton.tscn")
var buttons = []

var deck_names = []


# Called when the node enters the scene tree for the first time.
func _ready():
	for _i in range(10):
		var button = button_scene.instance()
		$"MarginContainer/EndRoundContainer/DeckGrid".add_child(button)
		button.hide()
		buttons.append(button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func init_decks(to_do : Array, char_data : CharData):
	deck_names = to_do
	var count = to_do.size()
	for i in range(10):
		if (i < count):
			buttons[i].set_deck(to_do[i], char_data.get_texture(to_do[i]))
			buttons[i].show()
		else:
			buttons[i].hide()
	if (count < 5):
		$"MarginContainer/EndRoundContainer/DeckGrid".columns = count
	else:
		$"MarginContainer/EndRoundContainer/DeckGrid".columns = 5


func _on_YesButton_pressed():
	emit_signal("end_round", deck_names)


func _on_NoButton_pressed():
	emit_signal("cancel_round")


func test_tick(rando_in):
	var choice = rando_in.randi_range(0, 1)
	if (choice == 1):
		print("EndRoundWindow: Yes")
		_on_YesButton_pressed()
	else:
		print("EndRoundWindow: No")
		_on_NoButton_pressed()

