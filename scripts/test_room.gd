extends Spatial


func _ready():
	var pc_overworld = get_node("Player")
	if pc_overworld:
		PlayerManager.add_to_pc_party(pc_overworld.battle_agent_scene, pc_overworld.battle_agent_status)
