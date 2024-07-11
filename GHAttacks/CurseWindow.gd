extends PanelContainer


signal curse_yes
signal curse_no
signal curse_sixth


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_YesButton_pressed():
	emit_signal("curse_yes")
	pass # Replace with function body.


func _on_NoButton_pressed():
	emit_signal("curse_no")


func _on_SixthButton_pressed():
	emit_signal("curse_sixth")


func test_tick(rando_in):
	var choice = rando_in.randi_range(0, 2)
	if (choice == 1):
		print("CurseWindow: Yes")
		_on_YesButton_pressed()
	elif (choice == 2):
		print("CurseWindow: No")
		_on_NoButton_pressed()
	else:
		print("CurseWindow: sixth")
		_on_SixthButton_pressed()

