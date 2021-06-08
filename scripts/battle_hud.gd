extends Control

var pc_status_panels_map 
var en_status_panels_map
onready var state_machine = get_node("../../BattleStateMachine")
onready var console_text = get_node('console_panel/RichTextLabel')
onready var action_panel = get_node("action_panel")
onready var attacks_panel = get_node("attacks_panel")
onready var items_panel = get_node("items_panel")
onready var cancel_panel = get_node("cancel_panel")
onready var confirm_panel = get_node("confirm_panel")

signal action_selected


func init_hud(pc_agents, en_agents):
	pc_status_panels_map = {}
	en_status_panels_map = {}
	var pc_status_panels = $pc_status_panels.get_children()
	var en_status_panels = $en_status_panels.get_children()
	map_pc_panels(pc_status_panels, pc_agents)
	map_en_panels(en_status_panels, en_agents)


func map_pc_panels(panels, pcs):
	for n in panels:
		n.visible = false
	
	for i in pcs.size():
		panels[i].get_node('name').bbcode_text = pcs[i].ba_status.char_name
		panels[i].get_node('hp').bbcode_text = str(pcs[i].ba_status.maximum_hp)
		panels[i].get_node('cp').bbcode_text = str(pcs[i].ba_status.maximum_ep)
		panels[i].visible = true
		pc_status_panels_map[pcs[i]] = panels[i]

		
func map_en_panels(panels, ens):
	for n in panels:
		n.visible = false
	
	for i in ens.size():
		panels[i].get_node('name').bbcode_text = ens[i].ba_status.char_name
		panels[i].get_node('hp').bbcode_text = str(ens[i].ba_status.maximum_hp)
		panels[i].get_node('cp').bbcode_text = str(ens[i].ba_status.maximum_ep)
		panels[i].visible = true
		en_status_panels_map[ens[i]] = panels[i]
	

func set_console(msg):
	console_text.bbcode_text = msg


func open_action_panel():
	action_panel.visible = true


func close_action_panel():
	action_panel.visible = false


func populate_action_panels(agent):
	for n in $attacks_panel/ScrollContainer/VBoxContainer.get_children():
		if n.name != "AttackContainerTemplate":
			n.queue_free()

	var moves = agent.get_node('moves').get_children()
	var template = $attacks_panel/ScrollContainer/VBoxContainer/AttackContainerTemplate

	for n in moves:
		var move_button = template.duplicate(15)
		move_button.name = n.attack_name + "_button"
		move_button.attack_ref = n
		$attacks_panel/ScrollContainer/VBoxContainer.add_child(move_button)
		move_button.visible = true
		move_button.connect('attack_selected', state_machine.pc_attack_action_state, 'on_Attack_selected')


func update_pc_status_panel(pc, vals):
	pass


func update_en_status_panel(en, vals):
	pass


func _gui_input(event):
	if event is InputEventMouseButton:
		print_debug("from battle_hud: %s" % event)