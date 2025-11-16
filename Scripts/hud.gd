extends CanvasLayer

@export var player: Player
var max_health: float
@onready var hpBar: ColorRect = $Control/HPBar/hp

func _ready() -> void:
	if player:
		player.connect("health_changed", update)
		max_health = player.get_max_health()

func update(hp: float):
	hpBar.scale.x = hp/ max_health
