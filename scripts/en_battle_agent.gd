class_name ENBattleAgent
extends KinematicBody

const CLASS_NAME = 'ENBattleAgent'

# weird hack to get around class_name not actually replacing the class name in get_class/is_class
func is_class(type): return type == CLASS_NAME or .is_class(type)
func get_class(): return CLASS_NAME


onready var ba_status = $battle_status

signal selected


func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		emit_signal("selected", self)
