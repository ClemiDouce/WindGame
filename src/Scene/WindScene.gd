extends Node2D

onready var pale_sprite = $Pales
onready var pale_ombre_sprite = $OmbrePale
onready var wind_speed_label = $Control/WindSpeed
onready var wind_timer = $WindDelay

var can_touch = true
var wind_speed = 0

#func _ready() -> void:
#	Stats.connect("money_changed", self, "_on_money_changed")

func _unhandled_input(event: InputEvent) -> void:
	if (event is InputEventMouseButton and can_touch 
		and Stats.actual_scene == self and event.is_action_pressed("click", false)):
		generate_wind()

func _process(delta: float) -> void:
	pale_sprite.rotation_degrees += wind_speed * delta
	pale_ombre_sprite.rotation_degrees = -pale_sprite.rotation_degrees
	
	if wind_speed > 0:
		wind_speed -= Stats.wind_loose * delta
	wind_speed_label.text = str(round(wind_speed))
	Stats.set_nuage_generation_stats(wind_speed)

func generate_wind():
	wind_speed = min(Stats.wind_max, wind_speed + Stats.wind_win)
	wind_timer.start(Stats.wind_delay)
	can_touch = false

func _on_WindDelay_timeout() -> void:
	can_touch = true

func upgrade_eolienne() -> void:
	pale_sprite.frame += 1
	pale_ombre_sprite.frame += 1


func _on_ResourceDelay_timeout() -> void:
	if wind_speed <= 0:
		return
	var resource = floor(wind_speed * 0.1)
	Stats.money += resource
	$Control/Money.text = str(Stats.money)
