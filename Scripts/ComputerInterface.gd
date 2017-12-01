extends Node2D

var GlobalState
var UnitsLabel
var IntensityLabel
var PurchaseLabel

func _ready():
	set_process(true)
	set_process_input(true)

	GlobalState = get_node("/root/GlobalState")
	UnitsLabel = get_node("UnitsLabel")
	IntensityLabel = get_node("IntensityLabel")
	PurchaseLabel = get_node("PurchaseLabel")


func _input(event):
	if (event.is_action_pressed("ui_cancel")):
		get_tree().change_scene("res://Scenes/Main.tscn")

	if (event.is_action_pressed("ui_select")):
		GlobalState.increase_units()

	if (event.is_action_pressed("ui_accept")):
		GlobalState.increase_intensity()

func _process(delta):
	UnitsLabel.set_text(str(GlobalState.get_units()))
	IntensityLabel.set_text(str(GlobalState.get_intensity()))
	PurchaseLabel.set_text(
		"convert " +
		str(GlobalState.get_intensity_cost()) +
		" units"
	)
