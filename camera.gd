extends Camera2D

@export var max_offset: int = 50
var velocity: int = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction := Input.get_axis("camera_up", "camera_down")
	if direction:
		velocity = move_toward(velocity, max_offset * direction, 4)
	else:
		velocity = move_toward(velocity, 0, 6)
	offset.y = move_toward(offset.y, velocity, 4)
	
