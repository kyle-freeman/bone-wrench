extends KinematicBody

const WALK_SPEED = 800.0

var battle_scene = preload("res://battle_scene.tscn")
var input_vec = Vector3.ZERO

signal start_battle

func _ready():
	$Detector.connect('body_entered', self, 'on_Detector_body_entered');
	$Detector.connect('body_exited', self, 'on_Detector_body_exited')
	$Detector.connect('area_entered', self, 'on_Detector_area_entered')
	$Detector.connect('area_exited', self, 'on_Detector_area_exited')


func _physics_process(delta):
	if input_vec.length() > 0:
		var dir = input_vec
		if input_vec.length() > 1:
			dir = input_vec.normalized()
		move_and_slide(dir * WALK_SPEED * delta)


func _unhandled_key_input(event):
	# pressed
	if event.is_action_pressed("ui_left"):
		input_vec.x -= 1
	if event.is_action_pressed("ui_right"):
		input_vec.x += 1
	if event.is_action_pressed("ui_up"):
		input_vec.z -= 1
	if event.is_action_pressed("ui_down"):
		input_vec.z += 1
	#released
	if event.is_action_released("ui_left"):
		input_vec.x += 1
	if event.is_action_released("ui_right"):
		input_vec.x -= 1
	if event.is_action_released("ui_up"):
		input_vec.z += 1
	if event.is_action_released("ui_down"):
		input_vec.z -= 1


func on_Detector_body_entered(_node):
	#print_debug('node entered %s' % node.name)
	pass


func on_Detector_body_exited(_node):
	#print_debug('node exited %s' % node.name)
	pass


func on_Detector_area_entered(node):
	if node.is_class('EnemyEngageArea'):
		if node.is_hostile:
			print_debug('hostile found')
			get_tree().change_scene_to(battle_scene)


func on_Detector_area_exited(_node):
	#print_debug('area exited: %s' % node.name)
	pass
