extends PanelContainer


signal fail_done


func set_card(card_data, deck_data : DeckData, icon_texture):
	$"MarginContainer/PerksFailContainer/CardFace".set_card(card_data, deck_data)
	$"MarginContainer/PerksFailContainer/CardFace".set_class_icon(icon_texture)


func _on_OKButton_pressed():
	emit_signal("fail_done")


func test_tick(rando_in):
	print("PerksFailWindow: OK")
	_on_OKButton_pressed()

