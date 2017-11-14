extends Node2D

var Global
var UnitsLabel
var IntensityLabel

func _ready():
	set_process(true)
	set_process_input(true)
	
	Global = get_node("/root/Global")
	UnitsLabel = get_node("Units")
	IntensityLabel = get_node("Intensity")

func _input(event):
	if (event.is_action_pressed("ui_cancel")):
		get_tree().change_scene("res://Scenes/Main.tscn")
		
	if (event.is_action_pressed("ui_select")):
		Global.increase_units()
	
	if (event.is_action_pressed("ui_accept")):
		Global.increase_intensity()

func _process(delta):
	UnitsLabel.set_text(str(Global.get_units()))
	IntensityLabel.set_text(
		str(Global.get_intensity()) + " (" + 
		str(Global.get_intensity_cost()) + ")"
	)