extends VBoxContainer

signal do_add(left, main, right)
signal cancel_add


var deck_data : DeckData = null
var left = -1
var main = 6
var right = -1


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AddCard_pressed():
	emit_signal("do_add", left, main, right)


func _on_Cancel_pressed():
	emit_signal("cancel_add")


func update_card():
	if left < 0:
		$"DownBar/DownLeft".disabled = true
		$"BuildCard/BuildLeft".visible = false
	else:
		$"DownBar/DownLeft".disabled = false
		$"BuildCard/BuildLeft".visible = true
		$"BuildCard/BuildLeft".texture = deck_data.get_side_texture(left)
	if (left >= DeckData.LEFT_MAX):
		$"UpBar/UpLeft".disabled = true
	else:
		$"UpBar/UpLeft".disabled = false
		
	if right < 0:
		$"DownBar/DownRight".disabled = true
		$"BuildCard/BuildRight".visible = false
	else:
		$"DownBar/DownRight".disabled = false
		$"BuildCard/BuildRight".visible = true
		$"BuildCard/BuildRight".texture = deck_data.get_side_texture(right)
	if (right >= DeckData.RIGHT_MAX):
		$"UpBar/UpRight".disabled = true
	else:
		$"UpBar/UpRight".disabled = false
	
	if main <= DeckData.MAIN_MIN:
		$"DownBar/DownMain".disabled = true
	else:
		$"DownBar/DownMain".disabled = false
	if (main >= DeckData.MAIN_MAX):
		$"UpBar/UpMain".disabled = true
	else:
		$"UpBar/UpMain".disabled = false
	$"BuildCard/BuildMain".texture = deck_data.get_card_texture(main)


func set_deck(data_in, icon_texture):
	deck_data = data_in
	left = -1
	right = -1
	main = 6
	$"BuildCard/BuildIcon".texture = icon_texture
	update_card()


func _on_UpLeft_pressed():
	left += 1
	if (left == DeckData.LEFT_SKIP):
		left += 1
	if (left > DeckData.LEFT_MAX):
		left = DeckData.LEFT_MAX
	elif left < DeckData.LEFT_MIN:
		left = DeckData.LEFT_MIN
	update_card()


func _on_UpMain_pressed():
	main += 1
	if (main == DeckData.MAIN_SKIP):
		main += 1
	if (main > DeckData.MAIN_MAX):
		main = DeckData.MAIN_MAX
	update_card()


func _on_UpRight_pressed():
	right += 1
	if (right > DeckData.RIGHT_MAX):
		right = DeckData.RIGHT_MAX
	elif right < DeckData.RIGHT_MIN:
		right = DeckData.RIGHT_MIN
	update_card()


func _on_DownLeft_pressed():
	left -= 1
	if (left == DeckData.LEFT_SKIP):
		left -= 1
	if (left < DeckData.LEFT_MIN):
		left = -1
	update_card()


func _on_DownMain_pressed():
	main -= 1
	if (main == DeckData.MAIN_SKIP):
		main -= 1
	if (main < DeckData.MAIN_MIN):
		main = DeckData.MAIN_MIN
	update_card()


func _on_DownRight_pressed():
	right -= 1
	if (right < DeckData.RIGHT_MIN):
		right = -1
	update_card()


func test_tick(rando_in):
	var choice = rando_in.randi_range(0, 7)
	if (choice == 1):
		print("AddCardWindow: up left")
		_on_UpLeft_pressed()
	elif (choice == 2):
		print("AddCardWindow: up main")
		_on_UpMain_pressed()
	elif (choice == 3):
		print("AddCardWindow: up right")
		_on_UpRight_pressed()
	elif (choice == 4):
		print("AddCardWindow: down left")
		_on_DownLeft_pressed()
	elif (choice == 5):
		print("AddCardWindow: down main")
		_on_DownMain_pressed()
	elif (choice == 6):
		print("AddCardWindow: down right")
		_on_DownRight_pressed()
	elif (choice == 7):
		print("AddCardWindow: Add Card")
		_on_AddCard_pressed()
	else:
		print("AddCardWindow: Cancel")
		_on_Cancel_pressed()

