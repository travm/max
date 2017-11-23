extends StaticBody2D

var Save

var RayCast
var SaveSprite

func _ready():
	set_process_input(true)
	set_process(true)

	Save = get_node("/root/Save")

	RayCast = get_node("RayCast2D")
	SaveSprite = get_node("SaveSprite")

func _input(event):
	if (RayCast.is_colliding() and event.is_action_pressed("ui_accept")):
		print("Saving!")
		Save.save_game()

func _process(delta):
	if (RayCast.is_colliding()):
		SaveSprite.set_hidden(false)
	else:
		SaveSprite.set_hidden(true)
