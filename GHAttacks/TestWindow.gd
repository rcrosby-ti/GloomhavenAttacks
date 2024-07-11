extends MarginContainer


signal test_tick(rando_in)


const TICK_TIME = 2.0


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var rando = null
var running = false
var tick = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	rando = RandomNumberGenerator.new()
	rando.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!running):
		return
	tick += delta
	if (tick > TICK_TIME):
		tick = 0
		emit_signal("test_tick", rando)


func _on_Button_pressed():
	running = !running
	if (running):
		$"Button".set_text("Go")
		$"Button".add_color_override("font_color", Color(0, 1, 0))
		$"Button".add_color_override("font_color_focus", Color(0, 1, 0))
	else:
		$"Button".set_text("Stop")
		$"Button".add_color_override("font_color", Color(1, 0, 0))
		$"Button".add_color_override("font_color_focus", Color(1, 0, 0))
