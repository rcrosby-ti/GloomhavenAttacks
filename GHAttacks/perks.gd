extends Reference
class_name Perks


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var perks_data : PerksData = null
var char_name = null
var char_perks_data = []
var deck_data : DeckData = null
var perks_deck : Deck = null
var use_fh_icons = false
var use_fh_perks = false

var perks_checks : Array = []
var equip_checks : Array = []

var default_deck_counts = [ 0, 0, 1, 1, 1, 5, 6, 5, 1 ]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func set_data(in_data : PerksData):
	perks_data = in_data
	equip_checks.resize(perks_data.get_equip_size())


func set_deck_data(in_data : DeckData):
	deck_data = in_data
	perks_deck = Deck.new()
	perks_deck.set_data(deck_data)


func set_fh_icons(do_fh):
	use_fh_icons = do_fh


func swap_fh_perks(do_fh):
	use_fh_perks = do_fh


func get_data():
	return perks_data


func load_config():
	var config = ConfigFile.new()
	var err = config.load("user://" + char_name + "_perks.cfg")
	if err != OK:
		perks_checks.fill(0)
		equip_checks.fill(0)
		return
	
	var perks_checks_in = config.get_value("Perks", "perks_checks", [])
	if (perks_checks_in.size() == perks_checks.size()):
		perks_checks = perks_checks_in
	else:
		perks_checks.fill(0)
	
	var equip_checks_in = config.get_value("Perks", "equip_checks", [])
	if (equip_checks_in.size() == equip_checks.size()):
		equip_checks = equip_checks_in
	else:
		equip_checks.fill(0)


func save_config():
	var config = ConfigFile.new()
	config.set_value("Decks", "version", 1)
	config.set_value("Perks", "perks_checks", perks_checks)
	config.set_value("Perks", "equip_checks", equip_checks)
	config.save("user://" + char_name + "_perks.cfg")


func init_perks(in_name):
	if (in_name == null):
		char_name = in_name
		return
	if (use_fh_perks) && (perks_data.has_fh(in_name)):
		char_name = "fh_" + in_name
	else:
		char_name = in_name
	char_perks_data = perks_data.get_char_perks_data(char_name)
	perks_checks.resize(char_perks_data.size())
	perks_deck.set_deck_default(char_name)
	load_config()


func reset_deck():
	perks_deck.set_deck_default(char_name)


func set_checks(perks_in, equip_in):
	perks_checks = perks_in
	equip_checks = equip_in


func get_perks_checks():
	return perks_checks


func get_equip_checks():
	return equip_checks


func get_perks_deck():
	return perks_deck


func get_perks_text(card_code):
	if (card_code >= PerksData.PERKS_EXTRA):
		return perks_data.get_perks_text(card_code, use_fh_icons)
	if (card_code < 0):
		card_code = -card_code
	var card_text = ""
	var card_data = perks_deck.get_card(card_code)
	if (card_data == null):
		return card_text
	if (card_data[2] > -1):
		card_text += perks_data.get_perks_text(card_data[2], use_fh_icons) + " "
	card_text += perks_data.get_perks_text(card_data[1], use_fh_icons)
	if (card_data[3] > -1):
		card_text += " " + perks_data.get_perks_text(card_data[3], use_fh_icons)
	return card_text


func set_card_counts():
	var perks_entry
	var card_id
	var mult
	var card_data
	for i in range(default_deck_counts.size()):
		card_data = perks_deck.get_card(i)
		if (card_data != null):
			card_data[0] = default_deck_counts[i]
	for i in range(perks_checks.size()):
		perks_entry = char_perks_data[i]
		for j in range(1, perks_entry.size()):
			card_id = perks_entry[j]
			if (card_id < 0):
				card_id = -card_id
				mult = -1
			else:
				mult = 1
			if (card_id < PerksData.PERKS_EXTRA):
				card_data = perks_deck.get_card(card_id)
				if (card_data != null):
					card_data[0] += mult * perks_checks[i]
	var equip_perks_data = perks_data.get_equip_perks_data()
	for i in range(equip_checks.size()):
		perks_entry = equip_perks_data[i]
		for j in range(1, perks_entry.size()):
			card_id = perks_entry[j]
			if (card_id < 0):
				card_id = -card_id
				mult = -1
			else:
				mult = 1
			if (card_id < PerksData.PERKS_EXTRA):
				card_data = perks_deck.get_card(card_id)
				if (card_data != null):
					card_data[0] += mult * equip_checks[i]


func reset_perks():
	perks_checks.fill(0)
	equip_checks.fill(0)
	save_config()


func get_char_perks_data():
	return perks_data.get_char_perks_data(char_name)

