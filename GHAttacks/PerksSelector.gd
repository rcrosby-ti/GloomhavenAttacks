extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func set_perk_text(text_in):
	$"TextMargins/PerksText".clear()
	$"TextMargins/PerksText".append_bbcode("[center]")
	#$"TextMargins/PerksText".append_bbcode("[center][img]res://spacer.png[/img]")
	var pieces = text_in.split("[")
	var bits
	var texture
	for i in range(pieces.size()):
		if (i == 0):
			$"TextMargins/PerksText".add_text(pieces[i])
		elif pieces[i].begins_with("img"):
			bits = pieces[i].split("]")
			texture = load(bits[1])
			$"TextMargins/PerksText".add_image(texture, 0, 64, RichTextLabel.INLINE_ALIGN_CENTER)
		else:
			bits = pieces[i].split("]")
			$"TextMargins/PerksText".add_text(bits[1])


func set_checkbox_count(count_in, count_checked):
	var check_box
	while ($"ChecksMargins/PerksChecks".get_child_count() < count_in):
		check_box = CheckBox.new()
		$"ChecksMargins/PerksChecks".add_child(check_box)
	for i in range($"ChecksMargins/PerksChecks".get_child_count()):
		check_box = $"ChecksMargins/PerksChecks".get_child(i)
		if (i < count_in):
			check_box.show()
			check_box.set_pressed_no_signal(i < count_checked)
		else:
			check_box.hide()
			check_box.set_pressed_no_signal(false)
	if (count_in == 4):
		$"ChecksMargins/PerksChecks".set_columns(2)
	else:
		$"ChecksMargins/PerksChecks".set_columns(3)


func get_checkbox_count():
	var check_box
	var count_out = 0
	for i in range($"ChecksMargins/PerksChecks".get_child_count()):
		check_box = $"ChecksMargins/PerksChecks".get_child(i)
		if (check_box.is_pressed()):
			count_out += 1
	return count_out


func toggle_check(index):
	var check_box = $"ChecksMargins/PerksChecks".get_child(index)
	var new_state = !check_box.is_pressed()
	check_box.set_pressed_no_signal(new_state)
	return new_state

