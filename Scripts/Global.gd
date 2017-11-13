extends Node

var tickSample = preload("res://Audio/tick.smp")
var pickupSample = preload("res://Audio/pickup.smp")
var hurtSample = preload("res://Audio/hurt.smp")

var Interval
var Library
var Sound

var units = 0
var intensity = 1
var intensity_cost = 50
var wait_time = 1
var player_pos = Vector2(240, 160)

func _ready():
	# Incrementing Timer
	Interval = Timer.new()
	Interval.connect("timeout", self, "increase_units")
	Interval.set_wait_time(wait_time)
	add_child(Interval)
	
	# Add Audio Samples
	Library = SampleLibrary.new()
	Library.add_sample("tick", tickSample)
	Library.add_sample("pickup", pickupSample)
	Library.add_sample("hurt", hurtSample)
	Sound = SamplePlayer.new()
	Sound.set_polyphony(2)
	Sound.set_sample_library(Library) 

func increase_units():
	Sound.play("tick")
	units = units + intensity

func increase_intensity():
	if (units >= intensity_cost):
		Sound.play("pickup")
		units = units - intensity_cost
		intensity = intensity + 1
		intensity_cost = intensity_cost + 10
	else:
		Sound.play("hurt")

func start_timer():
	Interval.start()
	
func stop_timer():
	Interval.stop()

func set_player_pos():
	pass

func get_player_pos():
	pass