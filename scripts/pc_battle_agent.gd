class_name PCBattleAgent
extends KinematicBody
const CLASS_NAME = 'PCBattleAgent'

# weird hack to get around class_name not actually replacing the class name in get_class/is_class
func is_class(type): return type == CLASS_NAME or .is_class(type)
func get_class(): return CLASS_NAME


var ba_status

signal selected

func set_ba_status(status_ref):
    ba_status = status_ref

func _input_event(camera, event, click_position, click_normal, shape_idx):
    if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
        emit_signal('selected', self)
