extends Node

onready var state_machine = get_node('../../../BattleStateMachine')
onready var hud = get_node('../../hud')

func enter_state(_params):
    hud.get_node("pc_action_panel/Button3").connect('pressed', self, 'on_Run_action_button_pressed')
    hud.set_console("Run!!!!")
    pass

func execute(_paras):
    pass

func exit_state(_params):
    hud.get_node("pc_action_panel/Button3").disconnect('pressed', self, 'on_Run_action_button_pressed')
    pass

func on_Run_back_button_pressed():
    state_machine.change_state(state_machine.player_turn_state)
    pass