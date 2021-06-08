extends Node

signal turn_order
signal setup_hud

onready var order = []
onready var state_machine = get_node('../../../BattleStateMachine')
onready var pc_agents = get_node('../../pc_agents')
onready var en_agents = get_node('../../en_agents')
onready var pc_agent_positions = get_node('../../pc_agent_positions').get_children()
onready var en_agent_positions = get_node('../../en_agent_positions').get_children()

func enter_state(_params):
	order = []
	load_agents()
	connect_agent_events()
	position_agents()
	emit_signal('setup_hud', pc_agents.get_children(), en_agents.get_children())
	determine_turn_order()
	state_machine.start_next_turn()


func execute(_params):
	pass

	
func exit_state(_params):
	pass


func load_agents():
	state_machine.combatants = []
	for n in PlayerManager.pc_party:
		var pc_ba = n[0].instance()
		pc_ba.set_ba_status(n[1])
		pc_agents.add_child(pc_ba)
		state_machine.combatants.append(pc_ba)
		order.append(pc_ba)

	for n in BattleManager.en_party:
		var en_ba = n.instance()
		en_agents.add_child(en_ba)
		state_machine.combatants.append(en_ba)
		order.append(en_ba)

func connect_agent_events():
	for agent in state_machine.combatants:
		agent.connect("selected", state_machine.pc_target_select_state, "on_Target_selected")
	


func determine_turn_order():
	order.sort_custom(self, 'sort_by_speed')
	emit_signal('turn_order', order)
	print_debug('set turn order:')
	for n in order:
		print_debug('name: %s, speed: %s' % [n.ba_status.char_name, n.ba_status.speed])

		
func sort_by_speed(a,b):
	return a.ba_status.speed > b.ba_status.speed
		

func position_agents():
	var i = 0
	for n in pc_agents.get_children():
		n.global_transform.origin = pc_agent_positions[i].translation
		i += 1
	i = 0
	for n in en_agents.get_children():
		n.global_transform.origin = en_agent_positions[i].translation
