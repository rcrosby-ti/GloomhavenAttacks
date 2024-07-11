extends PanelContainer

signal choose_decks
signal edit_deck
signal cancel_top
signal preferences
signal end_of_round


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ChooseDecks_pressed():
	emit_signal("choose_decks")


func _on_EditDeck_pressed():
	emit_signal("edit_deck")


func _on_CancelTop_pressed():
	emit_signal("cancel_top")


func _on_Preferences_pressed():
	emit_signal("preferences")


func _on_EndButton_pressed():
	emit_signal("end_of_round")


func test_tick(rando_in):
	var choice = rando_in.randi_range(0, 4)
	if (choice == 1):
		print("TopMenu: Choose Decks")
		_on_ChooseDecks_pressed()
	elif (choice == 2):
		print("TopMenu: Edit Deck")
		_on_EditDeck_pressed()
	elif (choice == 3):
		print("TopMenu: Cancel")
		_on_CancelTop_pressed()
	elif (choice == 4):
		print("TopMenu: Preferences")
		_on_Preferences_pressed()
	else:
		print("TopMenu: End of Round")
		_on_EndButton_pressed()

