extends Node2D

var GlobalState

func _ready():
	set_process_input(true)
	GlobalState = get_node("/root/GlobalState")

	# Stop Global Timer
	GlobalState.stop_timer();

func _input(event):
	if (event.is_action_pressed("ui_accept")):
		get_tree().change_scene("res://Scenes/Main.tscn")

	if (event.is_action_pressed("ui_cancel")):
		get_tree().quit()
