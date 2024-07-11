extends Reference
class_name Deck


var name = null
var deck = []
var remaining = []
var discards = []

# end is the very top
var tops = []

# end is the very bottom
var bottoms = []

var draw_counts = []
var deck_data = null
var active_count = 0
var max_active = 0

var rando = null


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func set_data(data : DeckData):
	rando = RandomNumberGenerator.new()
	rando.randomize()
	deck_data = data


func get_data():
	return deck_data


func load_config(icon_name):
	name = icon_name
	
	var config = ConfigFile.new()
	var err = config.load("user://" + name + ".cfg")
	if err != OK:
		deck = deck_data.make_default_deck(name)
		active_count = 0
		shuffle(0)
		save_config()
		return
	
	deck = config.get_value("DeckInfo", "deck", [])
	discards = config.get_value("DeckInfo", "discards", [])
	remaining = config.get_value("DeckInfo", "remaining", [])
	tops = config.get_value("DeckInfo", "tops", [])
	bottoms = config.get_value("DeckInfo", "bottoms", [])
	active_count = config.get_value("DeckInfo", "actives", 0)
	calc_draw_counts()
	calc_max_active()


func save_config():
	if name == null:
		return
		
	var config = ConfigFile.new()
	config.set_value("DeckInfo", "version", 2)
	config.set_value("DeckInfo", "deck", deck)
	config.set_value("DeckInfo", "discards", discards)
	config.set_value("DeckInfo", "remaining", remaining)
	config.set_value("DeckInfo", "tops", tops)
	config.set_value("DeckInfo", "bottoms", bottoms)
	config.set_value("DeckInfo", "actives", active_count)
	config.save("user://" + name + ".cfg")


func needs_shuffle_file(icon_name):
	var config = ConfigFile.new()
	var err = config.load("user://" + icon_name + ".cfg")
	if err != OK:
		return false
	else:
		var dis = config.get_value("DeckInfo", "discards", [])
		return dis.has(DeckData.NULL) || dis.has(DeckData.DOUBLE)


func put_on_top(index : int):
	var count = discards.size()
	if (index > 0) && (index <= count):
		var card_id = discards.pop_at(index - 1)
		tops.append(card_id)
		draw_counts[card_id] += 1
		if (deck_data.is_active(deck[card_id][1])):
			max_active -= 1
			if (active_count > 0):
				active_count -= 1


func put_on_bottom(index : int):
	var count = discards.size()
	if (index > 0) && (index <= count):
		var card_id = discards.pop_at(index - 1)
		bottoms.append(card_id)
		draw_counts[card_id] += 1
		if (deck_data.is_active(deck[card_id][1])):
			max_active -= 1
			if (active_count > 0):
				active_count -= 1


func shuffle(index : int):
	tops.resize(0)
	bottoms.resize(0)
	remaining.resize(deck.size())
	for i in range(deck.size()):
		remaining[i] = deck[i][0]
	var count = discards.size()
	if (index < 1) || (index >= count):
		discards.resize(0)
	else:
		discards = discards.slice(index, count)
		for i in range(discards.size()):
			remaining[discards[i]] -= 1
	calc_draw_counts()
	calc_max_active()
	if (active_count > max_active):
		for i in range(active_count - max_active):
			for j in range(deck.size()):
				if (draw_counts[j] > 0) && (deck_data.is_active(deck[j][1])):
					draw_counts[j] -= 1
					remaining[j] -= 1
					discards.insert(0, j)
					max_active += 1
					break


func get_deck_name():
	return name


func get_discards():
	return discards


func get_remaining_count():
	var sum = 0
	for i in range(remaining.size()):
		sum += remaining[i]
	return sum


func get_draw_count():
	var sum = get_remaining_count() + tops.size() + bottoms.size()
	return sum


func get_card(index):
	if (index < 0) || (index >= deck.size()):
		return null
	else:
		return deck[index]


func get_discard_card(discard_index):
	if (discard_index < 1) || (discard_index > discards.size()):
		return null
	var card_index = discards[discard_index - 1]
	return deck[card_index]


func get_discard_count():
	return discards.size()


func undo_discard():
	var card_id = discards.pop_back()
	if (card_id == null):
		return
	var count = get_draw_count()
	count = rando.randi_range(0, count)
	if (count < tops.size()):
		tops.insert(count, card_id)
	else:
		count -= tops.size()
		if (count < bottoms.size()):
			bottoms.insert(count, card_id)
		else:
			remaining[card_id] += 1
	draw_counts[card_id] += 1
	if (card_id < 2):
		deck[card_id][0] += 1
	if (deck_data.is_active(deck[card_id][1])):
		max_active -= 1
		if (active_count > 0):
			active_count -= 1


func choose_remaining_card():
	var count = get_remaining_count()
	if count > 0:
		count = rando.randi_range(1, count)
		for i in range(remaining.size()):
			if (count > remaining[i]):
				count -= remaining[i]
			else:
				return i
	return -1


func draw_remaining_card():
	var card_id = choose_remaining_card()
	if (card_id < 0):
		return
	remaining[card_id] -= 1
	draw_counts[card_id] -= 1
	discards.append(card_id)
	if card_id < 2:
		deck[card_id][0] -= 1


func draw_card():
	var count = get_remaining_count()
	if (tops.size() > 0):
		var top_card = tops.pop_back()
		draw_counts[top_card] -= 1
		discards.append(top_card)
		if (top_card < 2):
			deck[top_card][0] -= 1
	elif (count > 0):
		draw_remaining_card()
	elif (bottoms.size() > 0):
		var bottom_card = bottoms.pop_front()
		draw_counts[bottom_card] -= 1
		discards.append(bottom_card)
		if (bottom_card < 2):
			deck[bottom_card][0] -= 1
	else:
		return
	var card_id = discards.back()
	if (deck_data.is_active(deck[card_id][1])):
		max_active += 1
		active_count += 1


func add_card(card_id):
	if (card_id < 0) || (card_id >= deck.size()):
		return
	deck[card_id][0] += 1
	remaining[card_id] += 1
	draw_counts[card_id] += 1


func add_card_top_sixth(card_id : int):
	var count = get_remaining_count() + tops.size()
	if (count < 5):
		count = 5 - count
		if (count > bottoms.size()):
			count = bottoms.size()
		add_card(card_id)
		remaining[card_id] -= 1
		bottoms.insert(count, card_id)
	else:
		var draw_id
		while (tops.size() < 5):
			draw_id = choose_remaining_card()
			if (draw_id < 0):
				break
			remaining[draw_id] -= 1
			tops.insert(0, draw_id)
		add_card(card_id)
		remaining[card_id] -= 1
		tops.insert(0, card_id)


func copy_deck(deck_in: Deck):
	deck.resize(0)
	var card
	var card_in
	for i in range(deck_in.deck.size()):
		card_in = deck_in.deck[i]
		card = [ card_in[0], card_in[1], card_in[2], card_in[3] ]
		deck.append(card)


func get_card_data_count():
	return deck.size()


func reconcile_decks(edited_deck: Deck):
	var new_card_data
	var card_data
	var card_counts = []
	var new_card_id = []
	var removed
	var card_id = 0
	var next_id_to_use
	var count
	var to_index
	
	# array to map old card id to new card id
	# this is needed after cards are deleted leaving empty spots
	new_card_id.resize(edited_deck.deck.size())
	removed = 0
	next_id_to_use = 0
	for i in range(edited_deck.deck.size()):
		if (edited_deck.deck[i][0] == -1):
			new_card_id[i] = -1
			removed += 1
		else:
			new_card_id[i] = next_id_to_use
			next_id_to_use += 1
	
	# go through draw pile and reduce counts to match new card counts
	for i in range(edited_deck.deck.size()):
		new_card_data = edited_deck.deck[i]
		if (i >= deck.size()):
			card_data = [new_card_data[0], new_card_data[1], new_card_data[2], new_card_data[3]]
			deck.append(card_data)
			remaining.append(card_data[0])
			card_counts.append(0)
		else:
			card_data = deck[i]
			card_data[0] = new_card_data[0]
			count = card_data[0]
			if (remaining[i] > count):
				remaining[i] = count
				count = 0
			else:
				count -= remaining[i]
			card_counts.append(count)
	
	# count down and remove cards
	for i in range(tops.size()):
		card_id = tops[i]
		if card_counts[card_id] < 1:
			tops[i] = -1
		else:
			card_counts[card_id] -= 1
	
	# count down and remove cards
	for i in range(bottoms.size()):
		card_id = bottoms[i]
		if card_counts[card_id] < 1:
			bottoms[i] = -1
		else:
			card_counts[card_id] -= 1
	
	# count down and remove cards
	for i in range(discards.size()):
		card_id = discards[i]
		if card_counts[card_id] < 1:
			discards[i] = -1
		else:
			card_counts[card_id] -= 1
	
	# add any extra card counts to draw pile
	for i in range(card_counts.size()):
		remaining[i] += card_counts[i]
	
	# shift card indexes down to take the space of deleted cards
	var new_size = deck.size() - removed
	for i in range(deck.size()):
		if (new_card_id[i] > -1):
			deck[new_card_id[i]] = deck[i]
			remaining[new_card_id[i]] = remaining[i]
	deck.resize(new_size)
	remaining.resize(new_size)
	
	# adjust old card id to new card id
	# reuse space of removed cards
	to_index = 0
	for i in range(tops.size()):
		card_id = tops[i]
		if card_id >= 0:
			tops[to_index] = new_card_id[card_id]
			to_index += 1
	tops.resize(to_index)
	
	# adjust old card id to new card id
	# reuse space of removed cards
	to_index = 0
	for i in range(bottoms.size()):
		card_id = bottoms[i]
		if card_id >= 0:
			bottoms[to_index] = new_card_id[card_id]
			to_index += 1
	bottoms.resize(to_index)
	
	# adjust old card id to new card id
	# reuse space of removed cards
	to_index = 0
	for i in range(discards.size()):
		card_id = discards[i]
		if card_id >= 0:
			discards[to_index] = new_card_id[card_id]
			to_index += 1
	discards.resize(to_index)
	
	calc_draw_counts()
	calc_max_active()
	if (active_count > max_active):
		active_count = max_active


func add_new_card(card_data):
	deck.append(card_data)
	remaining.append(card_data[0])
	draw_counts.append(card_data[0])


func get_draw_counts():
	return draw_counts


func calc_draw_counts():
	draw_counts.resize(remaining.size())
	for i in range(remaining.size()):
		draw_counts[i] = remaining[i]
	for i in range(tops.size()):
		draw_counts[tops[i]] += 1
	for i in range(bottoms.size()):
		draw_counts[bottoms[i]] += 1


func load_default():
	deck = deck_data.make_default_deck(name)
	shuffle(0)
	save_config()


func load_empty_deck():
	name = null
	deck = deck_data.make_default_deck(name)
	shuffle(0)


func set_deck_default(in_name):
	name = in_name
	deck = deck_data.make_default_deck(name)


func calc_max_active():
	max_active = 0
	for i in range(discards.size()):
		if (deck_data.is_active(deck[discards[i]][1])):
			max_active += 1


func get_active_count():
	return active_count


func get_max_active():
	return max_active


func set_active_count(count):
	if (count > max_active):
		count = max_active
	if (count != active_count):
		active_count = count
		save_config()


func has_active(index):
	if (index < 1):
		return (active_count > 0)
	var count = 0
	for i in range(index):
		if (deck_data.is_active(deck[discards[i]][1])):
			count += 1
	return (active_count > (max_active - count))

