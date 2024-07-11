extends PanelContainer


signal prefs_done


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func get_swap():
	return $"MarginContainer/VBoxContainer/SwapDecks".is_pressed()


func get_tap_to_draw():
	return $"MarginContainer/VBoxContainer/TapToDraw".is_pressed()


func get_fh_icons():
	return $"MarginContainer/VBoxContainer/UseFHIcons".is_pressed()


func get_fh_perks():
	return $"MarginContainer/VBoxContainer/UseFHPerks".is_pressed()


func set_swap(do_swap):
	$"MarginContainer/VBoxContainer/SwapDecks".set_pressed_no_signal(do_swap)


func set_tap_to_draw(do_tap):
	$"MarginContainer/VBoxContainer/TapToDraw".set_pressed_no_signal(do_tap)


func set_fh_icons(do_fh):
	$"MarginContainer/VBoxContainer/UseFHIcons".set_pressed_no_signal(do_fh)


func set_fh_perks(do_fh):
	$"MarginContainer/VBoxContainer/UseFHPerks".set_pressed_no_signal(do_fh)


func _on_DoneButton_pressed():
	emit_signal("prefs_done")


func test_tick(rando_in):
	var choice = rando_in.randi_range(0, 3)
	var new_state
	if (choice == 1):
		new_state = !$"MarginContainer/VBoxContainer/SwapDecks".is_pressed()
		print("PrefsWindow: Swap ", new_state)
		$"MarginContainer/VBoxContainer/SwapDecks".set_pressed_no_signal(new_state)
	elif (choice == 2):
		new_state = !$"MarginContainer/VBoxContainer/UseFHIcons".is_pressed()
		print("PrefsWindow: FH Icons ", new_state)
		$"MarginContainer/VBoxContainer/UseFHIcons".set_pressed_no_signal(new_state)
	elif (choice == 3):
		new_state = !$"MarginContainer/VBoxContainer/UseFHPerks".is_pressed()
		print("PrefsWindow: FH Perks ", new_state)
		$"MarginContainer/VBoxContainer/UseFHPerks".set_pressed_no_signal(new_state)
	else:
		print("PrefsWindow: Done")
		_on_DoneButton_pressed()

