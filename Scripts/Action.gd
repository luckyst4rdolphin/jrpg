class_name Action

#Info
var name: String
var target: int #0: Indiv Ally, 1: Indiv Enemy, 2: Self/Block, 3: AoE to ally 4: AoE to enemy
var charge_cost: int = 0
var charge_gain: int
var description: String

# prio
const PRIO_VAL: int = 3 # prio value when an entity has that target priority
var prio: int

# need to: determine priority of a single action
func calculate_prio(characters: Node2D, doer: Entity, entity_prio: int, can_cast: bool):
	if not can_cast:
		prio = -100
		return
		
	prio = 0
	if entity_prio == target:
		prio += PRIO_VAL
	
	if target == 2:
		if doer.hp == doer.max_hp:
			prio -= 10
		for character in characters.get_children():
			if character.entity.side == doer.side:
				continue
			if character.entity.max_charge > 0 and character.entity.charge == character.entity.max_charge:
				prio += 1
	
	elif target == 0 or target == 1:
		for character in characters.get_children():
			if character.entity.side == doer.side:
				continue
			if character.entity.hp >= ceil(character.entity.max_hp/2):
				prio += 1
	
	elif target == 3 or target == 4:
		if name == "Healing Light":
			for character in characters.get_children():
				if character.entity.hp < ceil(character.entity.max_hp/2):
					prio += 3
		else:
			# braindead solution
			prio = 20
