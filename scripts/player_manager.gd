extends Node

onready var pc_party = []
var inventory = []


func set_pc_party(party):
	if party:
		for n in pc_party:
			n.queue_free()
		pc_party = party


func add_to_pc_party(pc_agent_scene, pc_agent_status):
	var status_dup = pc_agent_status.duplicate(15)
	add_child(status_dup)
	pc_party.append([pc_agent_scene, status_dup])

