class_name HitboxComponent
extends Area2D
@export var health_component: HealthComponent

@export var invincibility_time: float = 0.5
@onready var invincibilty_timer: Timer = $InvincibiltyTimer

signal on_knockback(force: Vector2)

func _ready() -> void:
	invincibilty_timer.wait_time = invincibility_time

func damage(dmg: float, direction: Vector2):
	if not health_component:
		return
	if invincibilty_timer.time_left >0: 
		return
	health_component.damage(dmg)
	var force := maxf(400, dmg * 10)
	on_knockback.emit(direction * force)
	invincibilty_timer.start()
	
	
