extends Spatial

var cur_state

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if cur_state:
		cur_state.execute(delta)

func init_battle():
	change_state($BattleInstance/states/start_state)
	pass

func change_state(state):
	cur_state.exit_state()
	cur_state = state
	cur_state.enter_state()

