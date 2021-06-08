extends Node

const BATTLE_SCENE = 'res://scenes/battle_scene.tscn'

var en_party setget set_en_party
var cur_state

func _ready():
	pass

func on_enter_enemy_engage_area(enemy_ref):
	print_debug('begin battle')
	en_party = enemy_ref.get_enemy_party()
	var change_scene = get_tree().change_scene(BATTLE_SCENE)
	print_debug(change_scene)
		
func set_en_party(val):
	en_party = []
	if typeof(val) == TYPE_ARRAY:
		en_party.append_array(val)
