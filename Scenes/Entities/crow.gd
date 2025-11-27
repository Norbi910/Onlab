extends CharacterBody2D

var target: Area2D
var direction: Vector2
var is_alive: bool = true
@export var speed: float = 200.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_alive: return
	animation_handler()
	if not target: 
		velocity += get_gravity() * delta
	else:
		if Engine.get_process_frames() % 30 == 0:
			direction = (target.global_position - global_position).normalized()
		velocity = velocity.move_toward(direction * speed, 10) 
		$DebugDirection.target_position = direction * speed
	move_and_slide()


func _on_player_finder_area_entered(area: Node2D) -> void:
	target = area
	direction = (target.global_position - global_position).normalized()


func _on_player_finder_area_exited(area: Node2D) -> void:
	if area == target:
		target = null
		
func animation_handler():
	sprite_2d.flip_h = velocity.x >= 0
	if not target and is_on_floor():
		animation_player.play("idle")
	else: 
		animation_player.play("attack") 
		


func _on_health_component_hp_changed(hp: float) -> void:
	if hp <= 0:
		_die()

func _die():
	is_alive = false
	$HealthComponent.queue_free()
	$HitBoxComponent.queue_free()
	$AttackComponent.queue_free()
	animation_player.play("death")
