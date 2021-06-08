extends Node

onready var state_machine = get_node('../../../BattleStateMachine')
onready var hud = get_node('../../hud')

func enter_state(params):
	hud.connect('action_selected', self, 'on_action_selected')
	hud.set_console("It's %s's turn!" % params[0].ba_status.char_name)
	hud.populate_action_panels(params[0])
	hud.open_action_panel()

func execute(_params):
	pass

func exit_state(_params):
	hud.close_action_panel()
	hud.disconnect('action_selected', self, 'on_action_selected')
	

func on_action_selected(type):
	match type:
		'attack':
			state_machine.change_state(state_machine.player_attack_action_state, [])
		'item':
			state_machine.change_state(state_machine.player_item_action_state, [])
		'run':
			state_machine.change_state(state_machine.player_run_action_state, [])
			