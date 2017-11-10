extends Node

var tickSample = preload("res://Audio/tick.smp")
var pickupSample = preload("res://Audio/pickup.smp")
var hurtSample = preload("res://Audio/hurt.smp")

var Interval
var Library
var Sound

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
	Interval = Timer.new()
	Interval.connect("timeout", self, "increase_units")
	Interval.set_wait_time(wait_time)
	add_child(Interval)
	Interval.start()
	
	# Add Audio Samples
	Library = SampleLibrary.new()
	Library.add_sample("tick", tickSample)
	Library.add_sample("pickup", pickupSample)
	Library.add_sample("hurt", hurtSample)
	Sound = SamplePlayer.new()
	Sound.set_polyphony(2)
	Sound.set_sample_library(Library) 

func increase_units():
	print('INCREASE')
	Sound.play("tick")
	units = units + intensity

func increase_intensity():
	if (units >= intensity_cost):
		print("INCREASING INTENSITY")
		Sound.play("pickup")
		units = units - intensity_cost
		intensity = intensity + 1
		intensity_cost = intensity_cost + 10
	else:
		print("CANNOT AFFORD INTENSITY INCREASE")
		Sound.play("hurt")

func set_player_pos():
	pass

func get_player_pos():
	pass