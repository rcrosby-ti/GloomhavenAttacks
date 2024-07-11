extends HBoxContainer


signal change_count(index, inc)


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var index
var count


# Called when the node enters the scene tree for the first time.
func _ready():
	$CardFace.make_small_icons()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func set_card(index_in, card_data, deck_data, class_icon):
	index = index_in
	count = card_data[0]
	if count < 0:
		count = -1
		card_data[0] = -1
		$CardCount.text = "0"
		$"CardFace/DeleteLabel".show()
	else:
		$CardCount.text = str(count)
		$"CardFace/DeleteLabel".hide()
	$CardFace.set_card(card_data, deck_data)
	$CardFace.set_class_icon(class_icon)


func get_card_count():
	return count


func _on_MinusButton_pressed():
	emit_signal("change_count", index, -1)


func _on_PlusButton_pressed():
	emit_signal("change_count", index, 1)
