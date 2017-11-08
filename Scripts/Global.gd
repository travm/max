extends Node

var units = 0
var intensity = 1

func _ready():
	units = 0
	intensity = 1

func increase_units():
	units = units + intensity

func increase_intensity():
	intensity = intensity + 1

func hello_world():
	print(units)