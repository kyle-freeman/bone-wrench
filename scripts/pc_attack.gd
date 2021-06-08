extends Node

export var attack_name = ""
export (String, MULTILINE) var description = ""
export var energy_cost = 0
export (int, "Attack", "Heal", "Buff", "Debuff") var effect_type = 0
export var effect_value = 0
export (int, "Power", "Brains", "Finess") var effect_scaler = 0
export var scale_amount = 0.5
export (String, "PCBattleAgent", "ENBattleAgent") var attack_target_type 
export var number_of_targets = 1
