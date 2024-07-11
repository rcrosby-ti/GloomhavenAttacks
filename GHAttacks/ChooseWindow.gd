extends VBoxContainer


signal choose_done


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var button_scene : PackedScene = preload("res://DeckButton.tscn")

var char_data: CharData = null
var deck_data: DeckData = null
var deck_list: Array = []
var buttons: Array = []


# Called when the node enters the scene tree for the first time.
func _ready():
	for _i in range(10):
		var button = button_scene.instance()
		$ChosenGrid.add_child(button)
		button.hide()
		buttons.append(button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Done_pressed():
	emit_signal("choose_done", deck_list)


func _on_ClearAll_pressed():
	deck_list = []
	show_chosen()


func set_deck_list(list_in, data_in : DeckData):
	deck_data = data_in
	deck_list = list_in
	show_chosen()


func set_char_list(data_in : CharData):
	var button
	var char_name
	if char_data == null:
		char_data = data_in
		for i in range(CharData.ICONS.size()):
			button = button_scene.instance()
			$"DeckPanel/DeckGrid".add_child(button)
			char_name = CharData.ICONS[i]
			button.set_deck(char_name, char_data.get_texture(char_name))
			button.connect("icon_pressed", self, "_on_DeckButton_deck_pressed")


func show_chosen():
	for i in range(10):
		if (i < deck_list.size()):
			buttons[i].set_deck(deck_list[i], char_data.get_texture(deck_list[i]))
			buttons[i].show()
		else:
			buttons[i].hide()


func _on_DeckButton_deck_pressed(char_name):
	var index = deck_list.size()
	if index > 9:
		return
	if char_name == null:
		return
	if deck_list.has(char_name):
		return
	deck_list.append(char_name)
	buttons[index].set_deck(char_name, char_data.get_texture(char_name))
	buttons[index].show()


func test_tick(rando_in):
	var count = CharData.ICONS.size() + 2
	var choice = rando_in.randi_range(0, count - 1)
	if (choice == 0):
		print("ChooseWindow : Done")
		_on_Done_pressed()
	elif (choice == 1):
		print("ChooseWindow : Clear All")
		_on_ClearAll_pressed()
	else:
		choice -= 2
		var use_name = CharData.ICONS[choice]
		print("ChooseWindow : ", use_name)
		_on_DeckButton_deck_pressed(use_name)

