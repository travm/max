extends StaticBody2D

var Save

var RayCast

func _ready():
	set_process_input(true)

	Save = get_node("/root/Save")

	RayCast = get_node("RayCast2D")

func _input(event):
	if (RayCast.is_colliding() and event.is_action_pressed("ui_accept")):
		print("Saving!")
		Save.save_game()
