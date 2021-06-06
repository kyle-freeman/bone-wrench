extends MeshInstance

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	rotate_y(rad2deg(sin(delta)) * 0.1)
	
