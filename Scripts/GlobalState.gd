extends Node

var tickSample = preload("res://Audio/tick.smp")
var pickupSample = preload("res://Audio/pickup.smp")
var hurtSample = preload("res://Audio/hurt.smp")

var IncrementalTimer
var Library
var Sound

var units = 0
var intensity = 1
var intensity_cost = 50
var wait_time = 1
var player_pos = Vector2(240, 160)

func _ready():
	# Incrementing Timer
	IncrementalTimer = Timer.new()
	IncrementalTimer.connect("timeout", self, "increase_units")
	IncrementalTimer.set_wait_time(wait_time)
	IncrementalTimer.set_active(false)
	add_child(IncrementalTimer)

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

func decrease_units(amount):
	units = units - amount

func increase_intensity():
	if (units >= intensity_cost):
		Sound.play("pickup")
		units = units - intensity_cost
		intensity = intensity + 1
		intensity_cost = intensity_cost + 10
	else:
		Sound.play("hurt")

func decrease_intensity(amount):
	intensity = intensity - amount

func start_timer():
	IncrementalTimer.set_active(true)
	IncrementalTimer.start()

func stop_timer():
	IncrementalTimer.set_active(false)
	IncrementalTimer.stop()

func is_timer_active():
	return IncrementalTimer.is_active()

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
