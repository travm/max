extends Node2D

var Global
var Player

func _ready():
	set_process_input(true)
	Global = get_node("/root/Global")
	Player = get_node("Player")

	# Set Player Position
	Player.set_pos(Global.player_pos)

	# Start Global Timer
	if (Global.is_timer_active()):
		print("Global timer already active!")
	else:
		Global.start_timer()

	if (PetState.is_timer_active()):
		print('PetState timers already active!')
	else:
		PetState.start_timers()

func _input(event):
	if (event.is_action_pressed("ui_cancel")):
		get_tree().change_scene("res://Scenes/Title.tscn")

	if (event.is_action_pressed("ui_select")):
		Global.increase_units()
