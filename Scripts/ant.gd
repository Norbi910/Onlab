extends CharacterBody2D

@export var speed: float = 20

var direction: int = 1
@onready var ray_cast_ahead: RayCast2D = $%RayCastAhead
@onready var animated_sprite: AnimatedSprite2D = $%AnimatedSprite2D
@onready var ray_cast_down: RayCast2D = $%RayCastDown
@onready var pivot: Node2D = $pivot

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if ray_cast_ahead.is_colliding() or not ray_cast_down.is_colliding():
		turn_around()
		
	velocity.x = direction * speed 
	
	var ground_following_rotation: float= get_real_velocity().angle_to(Vector2(direction, 0)) * -direction
	animated_sprite.rotation = move_toward(animated_sprite.rotation, ground_following_rotation, 0.1)
	move_and_slide()

func turn_around():
	direction *= -1
	pivot.scale.x = direction

func _on_health_changed(hp: float) -> void:
	if hp <= 0:
		queue_free()
