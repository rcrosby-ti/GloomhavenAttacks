extends Control
class_name CardFace


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func copy_card(card_in : CardFace):
	$CardMain.texture = card_in.get_node("CardMain").texture
	$CardLeft.texture = card_in.get_node("CardLeft").texture
	$CardRight.texture = card_in.get_node("CardRight").texture
	$CardSymbol.texture = card_in.get_node("CardSymbol").texture


func set_card(card_data, deck_data : DeckData):
	$CardMain.texture = deck_data.get_card_texture(card_data[1])
	$CardLeft.texture = deck_data.get_side_texture(card_data[2])
	$CardRight.texture = deck_data.get_side_texture(card_data[3])


func set_class_icon(icon_texture):
	$CardSymbol.texture = icon_texture


func make_small_icons():
	pass


func make_dumb_small_icons():
	$CardLeft.offset_top = -32
	$CardLeft.offset_left = -32
	$CardLeft.offset_bottom = 32
	$CardLeft.offset_right = 32
	$CardRight.offset_top = -32
	$CardRight.offset_left = -32
	$CardRight.offset_bottom = 32
	$CardRight.offset_right = 32
	$CardBlank.offset_top = -13
	$CardBlank.offset_left = -13
	$CardBlank.offset_bottom = 13
	$CardBlank.offset_right = 13
	$CardSymbol.offset_top = -9
	$CardSymbol.offset_left = -9
	$CardSymbol.offset_bottom = 9
	$CardSymbol.offset_right = 9

