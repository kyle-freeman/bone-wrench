extends Node

const BATTLE_SCENE = 'res://battle_scene.tscn'

var player_party
var enemy_party
var cur_state

func _ready():
	pass


func init_battle(player, enemy):
	player_party = player
	enemy_party = enemy
	var result = get_tree().change_scene(BATTLE_SCENE)
	print_debug('scene change result: %s ' % result)
