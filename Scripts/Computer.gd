extends StaticBody2D

var Bubble
var RayCast
var AnimationPlayer

func _ready():
	set_process(true)
	set_process_input(true)
	Bubble = get_node("Bubble")
	AnimationPlayer = get_node("Bubble/AnimationPlayer")
	RayCast = get_node("RayCast2D")
	AnimationPlayer.play("Float")

func _input(event):
	if (RayCast.is_colliding() and event.is_action_pressed("ui_interact")):
		print("Using Computer!")

func _process(delta):
	if (RayCast.is_colliding()):
		Bubble.set_hidden(false)
	else:
		Bubble.set_hidden(true)
		
		
