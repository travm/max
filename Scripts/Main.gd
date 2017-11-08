extends Node2D

var Global

func _ready():
	set_process_input(true)
	Global = get_node("/root/Global")
	
func _input(event):
	if (event.is_action_pressed("ui_cancel")):
		get_tree().change_scene("res://Scenes/Title.tscn")
	
	if (event.is_action_pressed("ui_select")):
		Global.increase_units()
		print(Global.units);