extends CanvasLayer

@export var player: Player
var max_health: float

@onready var hp_bar: HpBar = $Control/HPBar
@onready var death_label: Label = $DeathLabel
@onready var win_label: Label = $WinLabel
@onready var npc: NPC = $"../NPC"


func _ready() -> void:
	if player:
		player.connect("health_changed", update)
		max_health = player.get_max_health()
	#death_label.visible = false
	if npc: 
		npc.connect("win", _win)
			

func _win():
	win_label.visible = true

func update(hp: float):
	hp_bar.update(hp/ max_health)
	if hp == 0:
		death_label.visible = true
