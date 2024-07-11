extends PanelContainer


signal active_done(count)


const CARD_DATA = [ 1, DeckData.ACTIVE, -1, -1 ]


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var max_active = 0
var active_count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$"MarginContainer/ActiveContainer/CardFace".make_small_icons()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func init_active_window(count : int, max_count : int, deck_data : DeckData):
	$"MarginContainer/ActiveContainer/CardFace".set_card(CARD_DATA, deck_data)
	max_active = max_count
	active_count = count
	if (active_count > max_active):
		active_count = max_active
	$"MarginContainer/ActiveContainer/CountBg/CountContainer/CardCount".text = str(active_count)


func _on_MinusButton_pressed():
	if (active_count > 0):
		active_count -= 1
		$"MarginContainer/ActiveContainer/CountBg/CountContainer/CardCount".text = str(active_count)


func _on_PlusButton_pressed():
	if (active_count < max_active):
		active_count += 1
		$"MarginContainer/ActiveContainer/CountBg/CountContainer/CardCount".text = str(active_count)


func _on_DoneButton_pressed():
	emit_signal("active_done", active_count)


func set_class_icon(icon_texture):
	$"MarginContainer/ActiveContainer/CardFace".set_class_icon(icon_texture)


func test_tick(rando_in):
	var choice = rando_in.randi_range(0, 2)
	if (choice == 1):
		print("ActiveWindow : minus")
		_on_MinusButton_pressed()
	elif (choice == 2):
		print("ActiveWindow : plus")
		_on_PlusButton_pressed()
	else:
		print("ActiveWindow : Done")
		_on_DoneButton_pressed()

