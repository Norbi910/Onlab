class_name HealthComponent
extends Node2D

@export var MAX_HEALTH: float = 10.0
var health: float:
	set(value):
		health = clamp(value, 0, MAX_HEALTH)
		

@onready var hp: ColorRect = $HPBar/hp

signal hp_changed(hp: float)

func _ready() -> void:
	health = MAX_HEALTH

func damage(dmg: float):
	health -= dmg
	updateBar()
	hp_changed.emit(health)

func heal(hp: float):
	health += hp
	updateBar()
	hp_changed.emit(health)

func updateBar():
	hp.scale.x = health/ MAX_HEALTH

	
