extends Node2D

var GlobalState
var Player

func _ready():
	set_process_input(true)
	GlobalState = get_node("/root/GlobalState")
	Player = get_node("Player")

	# Set Player Position
	Player.set_pos(GlobalState.player_pos)

	# Start Global Timer
	if (GlobalState.is_timer_active()):
		print("Global timer already active!")
	else:
		GlobalState.start_timer()

	if (PetState.is_timer_active()):
		print('PetState timers already active!')
	else:
		PetState.start_timers()

func _input(event):
	if (event.is_action_pressed("ui_cancel")):
		get_tree().change_scene("res://Scenes/Title.tscn")

	if (event.is_action_pressed("ui_select")):
		GlobalState.increase_units()
