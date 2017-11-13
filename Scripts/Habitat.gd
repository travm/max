extends StaticBody2D

var Global
var Bubble
var RayCast

func _ready():
	set_process_input(true)
	set_process(true)
	
	Global = get_node("/root/Global")
	Bubble = get_node("Bubble")
	RayCast = get_node("RayCast2D")

func _input(event):
	if (RayCast.is_colliding() and event.is_action_pressed("ui_accept")):
		print("hello world")
		
		# Store Player Location
		if (RayCast.get_collider().get_name() == "Player"):
			Global.player_pos = RayCast.get_collider().get_pos()
		
		# Display Computer Interface	
		get_tree().change_scene("res://Scenes/HabitatInterface.tscn")

func _process(delta):
	if (RayCast.is_colliding()):
		Bubble.set_hidden(false)
	else:
		Bubble.set_hidden(true)