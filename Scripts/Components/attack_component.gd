class_name AttackComponent
extends Area2D

@export var ATTACK_DAMAGE: float = 20.0

signal damage_dealt

func _on_area_entered(area: Area2D) -> void:
	if area is not HitboxComponent:
		return
	var hitbox: HitboxComponent = area
	var knockback_direction: Vector2 = (area.global_position - global_position).normalized()
	hitbox.damage(ATTACK_DAMAGE, knockback_direction)
	damage_dealt.emit()
	
