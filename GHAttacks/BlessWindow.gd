extends PanelContainer


signal bless_yes
signal bless_no


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
	emit_signal("bless_yes")


func _on_NoButton_pressed():
	emit_signal("bless_no")


func test_tick(rando_in):
	var choice = rando_in.randi_range(0, 1)
	if (choice == 1):
		print("BlessWindow: Yes")
		_on_YesButton_pressed()
	else:
		print("BlessWindow: No")
		_on_NoButton_pressed()

