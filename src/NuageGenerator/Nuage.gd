extends Sprite

var speed := 0

func _ready():
	self.frame = randi() % 3

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()

func _process(delta: float)-> void:
	self.global_position.x += speed * delta
