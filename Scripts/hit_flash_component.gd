extends Node2D

@export var sprite : Sprite2D
@export var healthComponent: HealthComponent
@onready var flash_timer: Timer = $FlashTimer

func _ready() -> void:
	if healthComponent:
		healthComponent.connect("hp_changed", flash)

func flash(dmg: float):
	if not sprite: 
		return
	sprite.material.set_shader_parameter("enabled", true)
	flash_timer.start()
	


func _on_flash_timer_timeout() -> void:
	sprite.material.set_shader_parameter("enabled", false)
