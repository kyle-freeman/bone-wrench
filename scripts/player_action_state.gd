extends Node


onready var state_machine = get_node("../../../BattleStateMachine")
onready var hud = get_node("../../hud")

func _ready():
	hud.get_node("action_panel/Button").connect('pressed', self, 'on_Attack_action_button_pressed')
	hud.get_node("action_panel/Button2").connect('pressed', self, 'on_Item_action_button_pressed')
	hud.get_node("action_panel/Button3").connect('pressed', self, 'on_Run_action_button_pressed')


func enter_state(_params):
	hud.action_panel.visible = true


func execute(_params):
	pass

func exit_state(_params):
	hud.action_panel.visible = false


func on_Attack_action_button_pressed():
	state_machine.change_state(state_machine.pc_attack_action_state, [])

func on_Item_action_button_pressed():
	state_machine.change_state(state_machine.pc_item_action_state, [])
	
func on_Run_action_button_pressed():
	print_debug('Running doesnt exist!')
	pass
	