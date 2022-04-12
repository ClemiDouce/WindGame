extends Node2D

const ItemLine = preload("res://src/ItemLine/ItemLine.tscn")

onready var shop_panel = $Control/ShopInterface
onready var shop_title_label = $Control/ShopInterface/ShopTitle
onready var item_container = $Control/ShopInterface/ItemContainer



func _ready() -> void:
	for shop in $Control.get_children():
		if shop.name.begins_with("Shop_"):
			shop.connect("shop_pressed", self, "on_shop_pressed")
			
		
func on_shop_pressed(title, items):
	for item in item_container.get_children():
		item.queue_free()
	shop_title_label.text = title
	for item in items:
		item_container.add_child(item)
	
	shop_panel.visible = true

func _on_ShopQuit_pressed() -> void:
	shop_panel.visible = false

func _on_item_purchased(title, price):
	pass
