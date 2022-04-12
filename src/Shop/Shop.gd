extends Control

const ItemLine = preload("res://src/ItemLine/ItemLine.tscn")

onready var shop_build = $ShopBuild
signal shop_pressed(shop_title, items)

enum SHOP_CATEGORY {CHARACTER, POWER, BUILD, SKINS}

export (SHOP_CATEGORY) var category = SHOP_CATEGORY.CHARACTER
export (String) var shop_title: String
export (Array, Resource) var shop_items
var items_line = []

func _ready() -> void:
	for item in shop_items:
		if !item.purchased:
			var line_instance = ItemLine.instance()._initiate(item.title, item.description, item.price)
			print(line_instance.title)
			items_line.append(line_instance)

func _on_ShopBuild_pressed():
	emit_signal("shop_pressed", shop_title, items_line)

