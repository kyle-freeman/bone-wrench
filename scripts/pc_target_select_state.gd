extends Node

onready var state_machine = get_node("../../../BattleStateMachine")
onready var hud = get_node("../../hud")

var move
var item
var targets 


func _ready():
	hud.cancel_panel.get_node("Button").connect('pressed', self, "on_Cancel_button_pressed")
	hud.confirm_panel.get_node("Button").connect('pressed', self, "on_Confirm_button_pressed")
	pass


func enter_state(params):
	targets = []
	if params[0] == 0:
		move = weakref(params[1])
		hud.set_console("Pick a target for %s" % params[1].attack_name)
		hud.cancel_panel.visible = true

func execute(params):
	pass


func exit_state(params):
	move = null
	targets = null
	hud.cancel_panel.visible = false
	hud.confirm_panel.visible = false
	pass
	

func on_Cancel_button_pressed():
	if state_machine.cur_state == self:
		state_machine.change_state(state_machine.pc_action_state, [])

func on_Confirm_button_pressed():
	if state_machine.cur_state == self:
		if move != null and targets.size() == move.get_ref().number_of_targets:
			state_machine.change_state(state_machine.pc_execute_attack_state, [move.get_ref(), targets])
		elif item != null and targets.size() == item.get_ref().number_of_targets:
			state_machine.change_state(state_machine.pc_execute_item_state, [item.get_ref, targets])


func on_Target_selected(t):
	if state_machine.cur_state == self:
		var move_ref = move.get_ref()
		if t.is_class(move_ref.attack_target_type):
			if targets.has(t):
				targets.remove(targets.find(t))
			elif targets.size() == move_ref.number_of_targets:
				targets.pop_back()
				targets.push_front(t)
			else:
				targets.push_front(t)
			if targets.size() > 0:
				print_debug("Targets: %s" % targets)
			else:
				print_debug("No targets")

			if targets.size() == move_ref.number_of_targets:
				hud.confirm_panel.visible = true
			else:
				hud.confirm_panel.visible = false
