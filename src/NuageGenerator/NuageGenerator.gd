extends Position2D

const Nuage = preload("res://src/NuageGenerator/Nuage.tscn")

onready var timer = $Timer
onready var end_gen_position = $EndPosition
onready var nuage_list = $NuageList

export (int) var gen_range = 50
export (int) var nuage_speed = 100 setget set_nuage_speed
export (float) var nuage_delay = 1

#func _process(delta: float) -> void:
#	if nuage_list.get_child_count() > 0:
#		for nuage in nuage_list.get_children():
#			nuage.global_position.x += nuage_speed * delta

func _ready()->void:
	Stats.nuage_generator = self

func generate_nuage():
	var rand_position = Vector2(
		-200,
		rand_range(self.global_position.y, end_gen_position.global_position.y)
	)
	var nuage = Nuage.instance()
	var rand_scale = rand_range(0.4, 1.3)
	nuage.scale = Vector2(rand_scale, rand_scale)
	nuage.global_position = rand_position
	nuage.speed = nuage_speed
	nuage_list.add_child(nuage)


func _on_Timer_timeout() -> void:
	generate_nuage()
	var new_delay = nuage_delay + rand_range(0.1, 0.4)
	timer.start(new_delay)
	print(new_delay)

func set_nuage_speed(new_speed: int):
	nuage_speed = new_speed
	if get_node_or_null("NuageList") == null:
		return
	for nuage in $NuageList.get_children():
		nuage.speed = new_speed
