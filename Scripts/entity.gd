class_name Entity
extends CharacterBody2D

@export var MAX_HEALTH: float = 100.0
var health: float
@export var ATTACK_DAMAGE: float = 20.0

# Alignments mostly correspond to 
#	NEUTRAL -	NON-Hostile NPCs
#	ENEMY -		Hostile NPCs
#	ALLY - 		Player (or other battle support characters)
enum Alignment {NEUTRAL, ENEMY, ALLY}
@export var alignment: Alignment = Alignment.NEUTRAL

@export var attack_collision: CollisionShape2D

func _init():
	health = MAX_HEALTH
	if attack_collision:
		%AttackArea.add_child(attack_collision)

func damage(dmg: int): 
	health -= dmg
	if health <= 0:
		_die()

func _die():
	queue_free()


func _on_attack_area_entered(body: Node2D) -> void:
	print("attack")
	if body is Entity:
		
		
		var entity := body 
		if entity.alignment == Alignment.NEUTRAL:
			return
		if alignment != entity.alignment:
			entity.damage(ATTACK_DAMAGE)
			

		
