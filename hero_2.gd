extends Node2D

var entity: Entity = Entity.new()
var actions: Array = []

@onready var healthbar = $"HPBar"
@onready var hp_label = $"HPBar/Label"

func _ready() -> void:
	# info
	entity.name = "Alice"
	entity.sprite = $"AnimSprite"
	entity.side = 0

	# stats
	entity.hp = 100
	entity.max_hp = 100
	entity.charge = 2
	entity.max_charge = 4
	entity.spd = 11
	entity.atk = 30
	entity.def = 5
	entity.prio_action = 1

	healthbar.global_position = entity.sprite.global_position + Vector2(-30, -90)
	healthbar.max_value = entity.max_hp
	healthbar.value = entity.hp
	hp_label.text = "%s/%s" % [entity.hp, entity.max_hp]

	var punch = Action.new()
	punch.name = "Punch"
	punch.target = 1
	punch.charge_cost = 0
	punch.charge_gain = 1
	punch.description = "Punches an enemy."
	actions.push_back(punch)

	var block = Action.new()
	block.name = "Block"
	block.target = 2
	block.charge_cost = 0
	block.charge_gain = 2
	block.description = "Blocks incoming attack."
	actions.push_back(block)

	var super_punch = Action.new()
	super_punch.name = "Super Punch"
	super_punch.target = 1
	super_punch.charge_cost = 3
	super_punch.charge_gain = 0
	super_punch.description = "Heavy punch that stuns."
	actions.push_back(super_punch)

	var meteor = Action.new()
	meteor.name = "Meteor Shower"
	meteor.target = 4
	meteor.charge_cost = 2
	meteor.charge_gain = 0
	meteor.description = "Damages all enemies."
	actions.push_back(meteor)

	entity.do_idle()

func _process(delta: float) -> void:
	healthbar.value = entity.hp
	hp_label.text = "%s/%s" % [entity.hp, entity.max_hp]
