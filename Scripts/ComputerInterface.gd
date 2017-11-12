extends Node2D

var Global
var Units
var Intensity

func _ready():
	set_process(true)
	set_process_input(true)
	
	Global = get_node("/root/Global")
	Units = get_node("Units")
	Intensity = get_node("Intensity")

func _input(event):
	if (event.is_action_pressed("ui_cancel")):
		get_tree().change_scene("res://Scenes/Main.tscn")
		
	if (event.is_action_pressed("ui_select")):
		Global.increase_units()
	
	if (event.is_action_pressed("ui_accept")):
		Global.increase_intensity()

func _process(delta):
	Units.set_text(str(Global.units))
	Intensity.set_text(str(Global.intensity) + " (" + str(Global.intensity_cost) + ")")