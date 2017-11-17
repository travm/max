extends StaticBody2D

var GlobalState
var Bubble
var RayCast

func _ready():
	set_process(true)
	set_process_input(true)
	GlobalState = get_node("/root/GlobalState")
	Bubble = get_node("Bubble")
	RayCast = get_node("RayCast2D")

func _input(event):
	if (RayCast.is_colliding() and event.is_action_pressed("ui_accept")):
		# Display Computer Interface
		get_tree().change_scene("res://Scenes/ComputerInterface.tscn")

func _process(delta):
	if (RayCast.is_colliding()):
		Bubble.set_hidden(false)
	else:
		Bubble.set_hidden(true)


