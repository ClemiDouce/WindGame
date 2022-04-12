extends Node2D

onready var wind_scene = $WindScene
onready var city_scene = $CityScene
onready var camera = $Camera2D
var swipe_start = null
var minimum_drag = 200

func _ready() -> void:
	Stats.camera = camera
	Stats.actual_scene = wind_scene


func _unhandled_input(event):
	detect_swipe(event)

func detect_swipe(event):
	if event.is_action_pressed("click"):
		swipe_start = get_global_mouse_position()
	if event.is_action_released("click"):
		_calculate_swipe(get_global_mouse_position())
		
func _calculate_swipe(swipe_end):
	if swipe_start == null: 
		return
	var swipe = swipe_end - swipe_start
	if abs(swipe.y) > minimum_drag:
		if swipe.y > 0 and Stats.actual_scene == city_scene:
			Stats.actual_scene = wind_scene
		elif swipe.y < 0 and Stats.actual_scene == wind_scene:
			Stats.actual_scene = city_scene
