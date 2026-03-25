class_name Entity


# Info
var name: String
var sprite: AnimatedSprite2D # source file
var side: int # 0: Ally, 1: Enemy

# Stats
var hp: int
var max_hp: int
var charge: int = 0
var max_charge: int = 0
var spd: int
var atk: int
var def: int
var atk_range: int = 80
var crit_rate: int = 20
var prio_action: int = 2  # block

var is_blocking: bool = false
var is_stunned: bool = false

var rng = RandomNumberGenerator.new()
var alive: bool = true

var effect_text = ''

# Functions
func do_idle():
	if alive:
		sprite.play("idle")
	is_blocking = false

func take_damage(dmg: int, crit: int) -> void:
	var received_dmg = max(1, dmg - def) if is_blocking else dmg
	if rng.randi_range(1, 100) <= crit:
		received_dmg *= 2
		effect_text = ', CRITICAL HIT!'
	hp = max(hp - received_dmg, 0)
	sprite.play("hurt")
	
	if hp <= 0:
		taken_down()
	
func get_healed() -> void:
	hp = min(hp + 20, max_hp) # limit healing accd. to max hp of receiver
	

func do_block():
	is_blocking = true
	sprite.play("block")
	
func do_attack():
	sprite.play("attack")

func update_charge(to_add):
	assert(charge + to_add >= 0)
	charge = min(charge + to_add, max_charge)

func taken_down() -> void:
	alive = false
	sprite.play("hurt")
	if side/1 == 1:
		sprite.rotation_degrees=70
	else:
		sprite.rotation_degrees=-70
	
func is_dead() -> bool:
	return (hp == 0)
	
func get_stunned():
	is_stunned = true
	sprite.play("hurt")
	
func do_special():
	sprite.play("special")
