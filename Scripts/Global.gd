extends Node

var TIMER

var units
var intensity
var intensity_cost
var wait_time
var player_pos

func _ready():
	# Initialize State Variables
	units = 0
	intensity = 1
	intensity_cost = 50
	wait_time = 1
	player_pos = Vector2(240, 160)
	
	# Incrementing Timer
	TIMER = Timer.new()
	TIMER.connect("timeout", self, "increase_units")
	TIMER.set_wait_time(wait_time)
	add_child(TIMER)
	TIMER.start()

func increase_units():
	print('INCREASE')
	units = units + intensity

func increase_intensity():
	if (units >= intensity_cost):
		print("INCREASING INTENSITY")
		units = units - intensity_cost
		intensity = intensity + 1
		intensity_cost = intensity_cost + 10
	else:
		print("CANNOT AFFORD INTENSITY INCREASE")

func set_player_pos():
	pass

func get_player_pos():
	pass