extends Node2D

onready var wind_scene = $WindScene
onready var city_scene = $CityScene
onready var camera = $Camera2D

func _ready() -> void:
	pass


func _on_ButtonDown_pressed() -> void:
	camera.position.y = city_scene.position.y


func _on_ButtonUp_pressed() -> void:
	camera.position.y = wind_scene.position.y
