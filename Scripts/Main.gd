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
	Global.start_timer()
	
func _input(event):
	if (event.is_action_pressed("ui_cancel")):
		get_tree().change_scene("res://Scenes/Title.tscn")
	
	if (event.is_action_pressed("ui_select")):
		Global.increase_units()
		print(Global.units);