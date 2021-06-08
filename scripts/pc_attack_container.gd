extends HBoxContainer

var attack_ref setget set_attack_ref

signal attack_selected

func _ready():
	$Button.connect('pressed', self, 'on_pressed')


func on_pressed():
	emit_signal('attack_selected', attack_ref)


func set_attack_ref(val):
	attack_ref = val
	$Button.text = val.attack_name
