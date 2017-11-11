extends Node2D

var Global

func _ready():
	set_process_input(true)
	Global = get_node("/root/Global")
	
	# Stop Global Timer
	Global.stop_timer();
	
func _input(event):
	if (event.is_action_pressed("ui_accept")):
		get_tree().change_scene("res://Scenes/Main.tscn")
		
	if (event.is_action_pressed("ui_cancel")):
		get_tree().quit()
