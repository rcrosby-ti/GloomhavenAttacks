extends VBoxContainer


signal edit_done(new_deck)
signal add_card
signal reset
signal perks_list


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var card_scene : PackedScene = preload("res://CardSelector.tscn")

var deck : Deck = null
var deck_data : DeckData = null
var cards = []
var class_icon = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func init_edit_deck(deck_in: Deck, data_in: DeckData, icon_in):
	class_icon = icon_in
	if (deck == null):
		deck_data = data_in
		deck = Deck.new()
		deck.set_data(deck_data)
	deck.copy_deck(deck_in)
	
	var card_data
	var card
	var max_cards = deck.get_card_data_count()
	for i in range(cards.size()):
		if (i < max_cards):
			card_data = deck.get_card(i)
			cards[i].set_card(i, card_data, deck_data, class_icon)
			cards[i].show()
		else:
			cards[i].hide()
	
	for i in range(cards.size(), max_cards):
		card_data = deck.get_card(i)
		card = card_scene.instance()
		$"EditPanel/EditScrollBox/EditList".add_child(card)
		card.connect("change_count", self, "_on_CardSelector_change_count")
		card.set_card(i, card_data, deck_data, class_icon)
		cards.append(card)


func add_new_card(left, main, right):
	var max_cards = deck.get_card_data_count()
	var card_data
	for i in range(max_cards):
		card_data = deck.get_card(i)
		if (main == card_data[1]) && (left == card_data[2]) && (right == card_data[3]):
			if (card_data[0] < 0):
				card_data[0] = 0
			return
	
	card_data = [0, main, left, right]
	deck.add_new_card(card_data)
	if (max_cards >= cards.size()):
		var card = card_scene.instance()
		$"EditPanel/EditScrollBox/EditList".add_child(card)
		card.connect("change_count", self, "_on_CardSelector_change_count")
		card.set_card(max_cards, card_data, deck_data, class_icon)
		cards.append(card)
	else:
		cards[max_cards].set_card(max_cards, card_data, deck_data, class_icon)
		cards[max_cards].show()


func copy_curse_bless(deck_out : Deck):
	if (deck_out != null):
		var card_out = deck_out.get_card(DeckData.NULL_CURSE)
		var card_in = deck.get_card(DeckData.NULL_CURSE)
		card_out[0] = card_in[0]
		card_out = deck_out.get_card(DeckData.DOUBLE_BLESS)
		card_in = deck.get_card(DeckData.DOUBLE_BLESS)
		card_out[0] = card_in[0]


func _on_CardSelector_change_count(index, inc):
	var card_data = deck.get_card(index)
	var count = card_data[0] + inc
	if (count >= 0) || (index > 8):
		card_data[0] = count
		cards[index].set_card(index, card_data, deck_data, class_icon)


func _on_AddNewCard_pressed():
	emit_signal("add_card")


func _on_Done_pressed():
	emit_signal("edit_done", deck)


func _on_Reset_pressed():
	emit_signal("reset")


func _on_PerksList_pressed():
	emit_signal("perks_list")


func test_tick(rando_in):
	var count = deck.get_card_data_count() * 2 + 4
	var choice = rando_in.randi_range(0, count - 1)
	if (choice == 0):
		print("EditWindow: Add New Card")
		_on_AddNewCard_pressed()
	elif (choice == 1):
		print("EditWindow: Done")
		_on_Done_pressed()
	elif (choice == 2):
		print("EditWindow: Reset")
		_on_Reset_pressed()
	elif (choice == 3):
		print("EditWindow: Perks List")
		_on_PerksList_pressed()
	else:
		var index = (choice - 4) / 2
		var inc = ((choice & 1) * 2) - 1
		print("EditWindow: card ", index, ": ", inc)
		_on_CardSelector_change_count(index, inc)

