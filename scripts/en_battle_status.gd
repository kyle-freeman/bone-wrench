extends Node

# Character metadata

export var char_name = ''
export var char_desc = ''
export var level = 5
export var cur_exp = 0
export var exp_to_lvl = 999

# Character basic stats ----------------------------------------

export var current_hp = 0 setget set_current_hp
export var maximum_hp = 1 setget set_maximum_hp
export var current_ep = 0 setget set_current_ep
export var maximum_ep = 1 setget set_maximum_ep
export var power = 5
export var speed = 5
export var toughness = 2
export var brains = 3
export var finess = 3

# setters ------------------------------------------------------
func set_current_hp(val):
	if val < 0:
		val = 0
	if val > maximum_hp:
		val = maximum_hp
	current_hp = val

func set_current_ep(val):
	if val < 0:
		val = 0
	if val > maximum_ep:
		val = maximum_ep
	current_ep = val

func set_maximum_hp(val):
	if val < 0:
		val = 1
	if val > 999:
		val = 999
	maximum_hp = val

func set_maximum_ep(val):
	if val < 0:
		val = 1
	if val > 999:
		val = 999
	maximum_ep = val
