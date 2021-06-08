extends Node

onready var state_machine = get_node("../../../BattleStateMachine")
onready var hud = get_node("../../hud")

var delay = 3.0

func _ready():
    pass

func enter_state(params):
    delay = 3.0
    var names = []
    for n in params[1]:
        names.append(n.ba_status.char_name)
    hud.set_console("Using %s on %s!" % [params[0].attack_name, names])
    pass

func execute(params):
    delay -= params[0]
    if delay < 0.0:
        state_machine.change_state(state_machine.pc_action_state, [])
    pass

func exit_state(params):
    pass