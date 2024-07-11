extends PanelContainer

signal shuffle
signal undo_discard
signal cancel_shuffle
signal shuffle_partial
signal put_on_top
signal put_on_bottom


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ShuffleDeck_pressed():
	emit_signal("shuffle")


func _on_UndoCard_pressed():
	emit_signal("undo_discard")


func _on_CancelShuffle_pressed():
	emit_signal("cancel_shuffle")


func _on_PartialButton_pressed():
	emit_signal("shuffle_partial")


func _on_PutOnTop_pressed():
	emit_signal("put_on_top")


func _on_PutOnBottom_pressed():
	emit_signal("put_on_bottom")


func test_tick(rando_in):
	var choice = rando_in.randi_range(0, 5)
	if (choice == 1):
		print("ShuffleMenu: Shuffle")
		_on_ShuffleDeck_pressed()
	elif (choice == 2):
		print("ShuffleMenu: Undo Draw")
		_on_UndoCard_pressed()
	elif (choice == 3):
		print("ShuffleMenu: Cancel")
		_on_CancelShuffle_pressed()
	elif (choice == 4):
		print("ShuffleMenu: Shuffle (partial)")
		_on_PartialButton_pressed()
	elif (choice == 5):
		print("ShuffleMenu: Put on Top")
		_on_PutOnTop_pressed()
	else:
		print("ShuffleMenu: Put on Bottom")
		_on_PutOnBottom_pressed()

