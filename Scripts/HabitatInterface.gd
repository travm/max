extends Node2D

var PetState

var PetMenu
var PetStats

func _ready():
	set_process_input(true)
	set_process(true)

	PetState = get_node("/root/PetState")

	PetMenu = get_node("PetMenu")
	PetStats = get_node("PetStats")

func _input(event):
	if (event.is_action_pressed("ui_cancel")):
		get_tree().change_scene("res://Scenes/Main.tscn")

func _process(delta):
	if (PetState.get_evolution() == 0):
		PetMenu.set_hidden(true)
		PetStats.set_hidden(true)
