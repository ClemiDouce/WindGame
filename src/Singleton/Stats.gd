extends Node

signal money_changed

export (int) var wind_win = 10
export (int) var wind_loose = 2
var wind_max = 200
export (float) var wind_delay = 1
var money = 0 setget set_money

var camera : Camera2D = null
var nuage_generator = null

var actual_scene = null setget set_actual_scene

func set_actual_scene(new_scene):
	actual_scene = new_scene
	camera.position.y = actual_scene.position.y

func set_nuage_generation_stats(wind_speed):
	nuage_generator.nuage_speed = range_lerp(wind_speed, 0, wind_max, 20, 500)
	nuage_generator.nuage_delay = range_lerp(wind_speed, 0, wind_max, 6, 0.2)

func set_money(new_value):
	money = new_value
	emit_signal("money_changed", money)
