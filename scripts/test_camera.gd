extends Spatial

export (NodePath) var t_node_path
export (Vector3) var offset = Vector3(0,5,5)
var target_node
var cam
var room_min_pos
var room_max_pos

func _ready():
	cam = $Camera
	if t_node_path:
		target_node = get_node(t_node_path)
	

func _process(_delta):
	if target_node:
		var new_position = lerp(global_transform.origin, target_node.global_transform.origin, 0.2)
		
		if room_min_pos:
			new_position.x = room_min_pos.x if new_position.x  < room_min_pos.x else new_position.x
			new_position.y = room_min_pos.y if new_position.y  < room_min_pos.y else new_position.y
			new_position.z = room_min_pos.z if new_position.z  < room_min_pos.z else new_position.z
		
		if room_min_pos:
			new_position.x = room_max_pos.x if new_position.x  < room_max_pos.x else new_position.x
			new_position.y = room_max_pos.y if new_position.y  < room_max_pos.y else new_position.y
			new_position.z = room_max_pos.z if new_position.z  < room_max_pos.z else new_position.z
		
		global_transform.origin = new_position