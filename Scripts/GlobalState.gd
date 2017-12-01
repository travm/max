extends Node

var Audio

var IncrementalTimer
var PauseMenu

var units = 100000
var intensity = 1
var intensity_cost = 50
var wait_time = 1
var player_pos = Vector2(240, 160)
var player_rotd = 0

func _ready():
	Audio = get_node("/root/Audio")

	# Incrementing Timer
	IncrementalTimer = Timer.new()
	IncrementalTimer.connect("timeout", self, "increase_units")
	IncrementalTimer.set_wait_time(wait_time)
	IncrementalTimer.set_active(false)
	add_child(IncrementalTimer)

# Methods
func increase_units():
	Audio.play_sound("tick");
	units = units + intensity

func decrease_units(amount):
	units = units - amount

func increase_intensity():
	if (units >= intensity_cost):
		Audio.play_sound("pickup")
		units = units - intensity_cost
		intensity = intensity + 1
		intensity_cost = intensity_cost + 10
	else:
		Audio.play_sound("hurt")

func decrease_intensity(amount):
	intensity = intensity - amount
	intensity_cost = intensity_cost - (amount * 10)

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

func get_player_rotd():
	return player_rotd

func set_player_rotd(value):
	player_rotd = value
