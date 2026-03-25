extends Node2D

var entity: Entity = Entity.new()
var actions: Array

@onready var healthbar = $"HPBar"
@onready var hp_label = $"HPBar/Label"

func _ready() -> void:
	# Info
	entity.name = "Skeleton"
	entity.sprite = $AnimSprite
	entity.side = 1
	
	# Stats
	entity.hp = 100
	entity.max_hp = 100
	entity.spd = 10
	entity.atk = 20
	entity.def = 4
	entity.prio_action = 0
	
	healthbar.global_position = entity.sprite.global_position + Vector2(-30, 40)
	healthbar.max_value = entity.max_hp
	healthbar.value = entity.hp
	hp_label.text = "%s/%s" % [entity.hp, entity.max_hp]
	
	# Actions
	var atk_action = Action.new()
	atk_action.name = "Slash"
	atk_action.target = 0
	atk_action.description = "Slashes an enemy."
	actions.push_back(atk_action)
	
	var block_action = Action.new()
	block_action.name = "Shield Block"
	block_action.target = 2
	block_action.charge_cost = 0
	block_action.charge_gain = 2
	block_action.description = "Blocks incoming attack."
	actions.push_back(block_action)
	
	entity.do_idle()
	
func _process(delta: float) -> void:
	healthbar.value = entity.hp
	hp_label.text = "%s/%s" % [entity.hp, entity.max_hp]
