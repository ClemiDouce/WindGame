extends Node2D

onready var pale_sprite = $Pales
onready var wind_speed_label = $Control/WindSpeed
onready var camera = $Camera2D

var wind_speed = 0
var wind_win = 20
var wind_loose = 15
var wind_max = 340


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		wind_speed = min(wind_max, wind_speed + wind_win)
	
	pale_sprite.rotation_degrees += wind_speed * delta
	
	if wind_speed > 0:
		wind_speed -= wind_loose * delta
	wind_speed_label.text = str(round(wind_speed))
