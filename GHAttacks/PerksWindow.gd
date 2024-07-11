extends VBoxContainer


signal perks_done(perks_deck)
signal perks_cancel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var perks_scene : PackedScene = preload("res://PerksSelector.tscn")

var perks : Perks = null
var perks_data : PerksData = null
var perks_entries = []
var total_checks = 0

var num_array = [ "zero", "one", "two", "three", "four", "five", "six" ]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Done_pressed():
	var perks_checks = get_perks_checks()
	var equip_checks = get_equip_checks()
	perks.set_checks(perks_checks, equip_checks)
	perks.set_card_counts()
	var perks_deck = perks.get_perks_deck()
	emit_signal("perks_done", perks_deck)


func _on_Cancel_pressed():
	emit_signal("perks_cancel")


func set_perks(perks_in):
	perks = perks_in
	perks_data = perks.get_data()


func init_perks(in_name, icon_texture):
	$"PerksContainer/PerksScrollBox/PerksList/ClassIcon".set_deck(in_name, icon_texture)
	fill_in_entries()
	fill_in_checks()


func fill_in_entries():
	var char_data = perks.get_char_perks_data()
	var char_size = char_data.size()
	var equip_data = perks_data.get_equip_perks_data()
	var equip_size = perks_data.get_equip_size()
	var old_size = perks_entries.size()
	var new_size = char_size + equip_size
	var entry
	if (old_size > 0):
		for i in range(old_size):
			if (i < new_size):
				perks_entries[i].show()
			else:
				perks_entries[i].hide()
	if (new_size > old_size):
		for i in range(new_size - old_size):
			entry = perks_scene.instance()
			$"PerksContainer/PerksScrollBox/PerksList".add_child(entry)
			entry.show()
			perks_entries.append(entry)
	
	var entry_data
	var entry_text
	for i in range(char_size):
		entry_data = char_data[i]
		entry_text = build_entry_text(entry_data)
		perks_entries[i].set_perk_text(entry_text)
	for i in range(equip_size):
		entry_data = equip_data[i]
		entry_text = build_entry_text(entry_data)
		perks_entries[i + char_size].set_perk_text(entry_text)


func build_entry_text(entry_data):
	if (entry_data == null):
		return ""
	var card_code
	var last_code = 0
	var card_count = 0
	var entry_text = ""
	var skip_and = true
	for i in range(1, entry_data.size()):
		card_code = entry_data[i]
		if (last_code == 0) || (card_code == last_code):
			card_count += 1
		else:
			entry_text = process_perk_card(entry_text, last_code, card_count, skip_and)
			skip_and = perks_data.no_after_and(last_code)
			card_count = 1
		last_code = card_code
	if (card_count > 0):
		entry_text = process_perk_card(entry_text, last_code, card_count, skip_and)
	return entry_text


func process_perk_card(entry_text, card_code, card_count, skip_and):
	if (card_code >= PerksData.PERKS_EXTRA):
		if (entry_text != "") && (!skip_and):
			entry_text += "; "
		entry_text += perks.get_perks_text(card_code)
		return entry_text
	if (card_count >= num_array.size()):
		card_count = num_array.size() - 1
	if (entry_text == "") || (skip_and):
		if (card_code < 0):
			entry_text += "Remove " + num_array[card_count] + " "
		else:
			entry_text += "Add " + num_array[card_count] + " "
	else:
		if (card_code < 0):
			entry_text += " and remove " + num_array[card_count] + " "
		else:
			entry_text += " and add " + num_array[card_count] + " "
	entry_text += perks.get_perks_text(card_code)
	if (card_count == 1):
		entry_text += " card"
	else:
		entry_text += " cards"
	return entry_text


func fill_in_checks():
	var char_data = perks.get_char_perks_data()
	var char_size = char_data.size()
	var equip_data = perks_data.get_equip_perks_data()
	var equip_size = perks_data.get_equip_size()
	var entry_data
	var perks_checks = perks.get_perks_checks()
	var equip_checks = perks.get_equip_checks()
	total_checks = 0
	for i in range(char_size):
		entry_data = char_data[i]
		perks_entries[i].set_checkbox_count(entry_data[0], perks_checks[i])
		total_checks += entry_data[0]
	for i in range(equip_size):
		entry_data = equip_data[i]
		perks_entries[i + char_size].set_checkbox_count(entry_data[0], equip_checks[i])
		total_checks += entry_data[0]


func get_perks_checks():
	var perks_checks = perks.get_perks_checks()
	var entry
	for i in range(perks_checks.size()):
		entry = perks_entries[i]
		perks_checks[i] = entry.get_checkbox_count()
	return perks_checks


func get_equip_checks():
	var equip_checks = perks.get_equip_checks()
	var perks_checks = perks.get_perks_checks()
	var perks_size = perks_checks.size()
	var entry
	for i in range(equip_checks.size()):
		entry = perks_entries[i + perks_size]
		equip_checks[i] = entry.get_checkbox_count()
	return equip_checks


func test_tick(rando_in):
	var count = total_checks + 2
	var choice = rando_in.randi_range(0, count - 1)
	if (choice == 0):
		print("PerksWindow: Set Cards")
		_on_Done_pressed()
	elif (choice == 1):
		print("PerksWindow: Cancel")
		_on_Cancel_pressed()
	else:
		choice -= 2
		var char_data = perks.get_char_perks_data()
		var char_size = char_data.size()
		var equip_data = perks_data.get_equip_perks_data()
		var equip_size = perks_data.get_equip_size()
		var entry_data
		var new_state
		var perk_count = 0
		for i in range(char_size):
			entry_data = char_data[i]
			if (choice < entry_data[0]):
				print("PerksWindow: check :", perk_count, " , ", choice)
				new_state = perks_entries[i].toggle_check(choice)
				return
			choice -= entry_data[0]
			perk_count += 1
		for i in range(equip_size):
			entry_data = equip_data[i]
			if (choice < entry_data[0]):
				print("PerksWindow: check :", perk_count, " , ", choice)
				new_state = perks_entries[i + char_size].toggle_check(choice)
				return
			choice -= entry_data[0]
			perk_count += 1
		print("PerksWindow: <error> ", choice)


