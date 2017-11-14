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
	Interval.set_active(false)
	add_child(Interval)
	
	# Add Audio Samples
	Library = SampleLibrary.new()
	Library.add_sample("tick", tickSample)
	Library.add_sample("pickup", pickupSample)
	Library.add_sample("hurt", hurtSample)
	Sound = SamplePlayer.new()
	Sound.set_polyphony(2)
	Sound.set_sample_library(Library) 

# Methods
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
	Interval.set_active(true)
	Interval.start()
	
func stop_timer():
	Interval.set_active(false)
	Interval.stop()
	
func is_timer_active():
	return Interval.is_active()

# Getters & Setters
func get_units():
	return units

func set_units(value):
	units = value

func get_intensity():
	return intensity

func set_intensity(value):
	intensity = value
	
func get_intensity_cost():
	return intensity_cost

func set_intensity_cost(value):
	intensity_cost = value

func get_wait_time():
	return wait_time

func set_wait_time(value):
	wait_time = value

func get_player_pos():
	return player_pos

func set_player_pos(value):
	player_pos = value