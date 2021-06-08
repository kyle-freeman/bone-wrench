class_name EnemyEngageArea
extends Area
const CLASS_NAME = 'EnemyEngageArea'

# weird hack to get around class_name not actually replacing the class name in get_class/is_class
func is_class(type): return type == CLASS_NAME or .is_class(type)
func get_class(): return CLASS_NAME

export var is_hostile = true
export (Array, PackedScene) var enemy_party = []

func get_enemy_party():
    return enemy_party