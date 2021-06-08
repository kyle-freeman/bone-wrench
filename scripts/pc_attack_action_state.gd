extends Node

onready var state_machine = get_node('../../../BattleStateMachine')
onready var hud = get_node('../../hud')

func _ready():
	hud.get_node("attacks_panel/Button").connect('pressed', self, 'on_Attack_back_button_pressed')
	pass


func enter_state(_params):
	hud.get_node("attacks_panel/Button").connect('pressed', self, 'on_Attack_back_button_pressed')
	hud.attacks_panel.visible = true
	hud.set_console('Pick an attack!')
	pass


func execute(_paras):
	pass

	
func exit_state(_params):
	hud.get_node("attacks_panel/Button").disconnect('pressed', self, 'on_Attack_back_button_pressed')
	hud.attacks_panel.visible = false
	pass


func on_Attack_back_button_pressed():
	state_machine.change_state(state_machine.pc_action_state, [])
	pass


func on_Attack_selected(move):
	hud.set_console("Move selected %s" % move.attack_name)
	state_machine.change_state(state_machine.pc_target_select_state, [0, move])
	pass
