extends Spatial

var cur_state
var cur_agent
var turn_order
var combatants

onready var start_state = $states/start_state
onready var pc_turn_state = $states/pc_turn_state
onready var pc_action_state = $states/pc_action_state
onready var pc_end_turn_state = $states/pc_end_turn_state
onready var pc_attack_action_state = $states/pc_attack_action_state
onready var pc_item_action_state = $states/pc_item_action_state
onready var pc_run_action_stat = $states/pc_run_action_state
onready var pc_target_select_state = $states/pc_target_select_state
onready var pc_execute_attack_state = $states/pc_execute_attack_state
onready var pc_execute_item_state = $states/pc_execute_item_state
onready var en_turn_state = $states/en_turn_state
onready var en_action_state = $states/en_action_state
onready var en_end_turn_state = $states/en_end_turn_state

func _ready():
	$states/start_state.connect('turn_order', self, 'set_turn_order')
	$states/start_state.connect('setup_hud', $hud, 'init_hud')
	init_battle()


func _process(delta):
	if cur_state:
		cur_state.execute([delta])


func init_battle():
	change_state(start_state, [])
	pass


func change_state(state, params):
	if cur_state:
		print_debug('exiting state %s' % cur_state.name)
		cur_state.exit_state(params)
	cur_state = state
	print_debug('entering state %s' % state.name)
	cur_state.enter_state(params)


func set_turn_order(order):
	turn_order = order


func start_next_turn():
	var next_agent = turn_order.pop_front()
	if next_agent.is_class('PCBattleAgent'):
		change_state(pc_turn_state, [next_agent])
	elif next_agent.is_class('ENBattleAgent'):
		change_state(en_turn_state, [next_agent])
	else: 
		print_debug('Err: Next agent class is not set correctly')