extends Node

onready var state_machine = get_node('../../../BattleStateMachine')
onready var hud = get_node('../../hud')

func _ready():
    hud.get_node("items_panel/Button").connect('pressed', self, 'on_Item_back_button_pressed')


func enter_state(_params):
    hud.set_console('Pick an Item!')
    hud.items_panel.visible = true
    

func execute(_paras):
    pass

func exit_state(_params):
    hud.items_panel.visible = false
    

func on_Item_back_button_pressed():
    state_machine.change_state(state_machine.pc_action_state, [])