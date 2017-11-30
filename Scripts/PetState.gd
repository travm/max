extends Node

var Audio
var GlobalState

var AgeTimer
var StatsTimer

var age = 1;
var hunger = 10
var hygiene = 10
var happiness = 10
var evolution = 1
var snack_cost = 1
var meal_cost = 2
var bath_cost = 5
var entertain_cost = 2

func _ready():
	set_process(true)

	Audio = get_node("/root/Audio")
	GlobalState = get_node("/root/GlobalState")

	# Add Timer To Decrease Stats Over Timer
	StatsTimer = Timer.new()
	StatsTimer.connect("timeout", self, "decrease_stats")
	StatsTimer.set_wait_time(60)
	StatsTimer.set_active(false)
	add_child(StatsTimer)

	# Add Timer To Age The Pet (1 Day = 20 Seconds?)
	AgeTimer = Timer.new()
	AgeTimer.connect("timeout", self, "increase_age")
	AgeTimer.set_wait_time(60)
	AgeTimer.set_active(false)
	add_child(AgeTimer)

func _process(delta):
	# Check For Evolution
	if (age == 5):
		evolution = 2
	if (age == 10):
		evolution = 3
	if (age == 20):
		if (is_healthy()):
			evolution = 4
		else:
			evolution = 5

# Methods
func start_timers():
	StatsTimer.set_active(true)
	StatsTimer.start()
	AgeTimer.set_active(true)
	AgeTimer.start()

func stop_timers():
	StatsTimer.set_active(false)
	StatsTimer.stop()
	AgeTimer.set_active(false)
	AgeTimer.stop()

func is_timer_active():
	return StatsTimer.is_active() or AgeTimer.is_active()

func decrease_stats():
	decrease_hunger()
	decrease_hygiene()
	decrease_happiness()

func increase_age():
	age = age + 1

func decrease_hunger():
	if (hunger == 0):
		return
	hunger = hunger - 1

func decrease_hygiene():
	if (hygiene == 0):
		return
	hygiene = hygiene - 1

func decrease_happiness():
	if (happiness == 0):
		return
	happiness = happiness - 1

func feed_pet(type):
	if (hunger == 10):
		Audio.play_sound("hurt")
		return
	if (type == "snack"):
		if (GlobalState.get_intensity() < 2):
			Audio.play_sound("hurt")
			return
		hunger = hunger + 1;
		Audio.play_sound("pickup")
		GlobalState.decrease_intensity(snack_cost)
	elif (type == "meal"):
		if (hunger > 8 or GlobalState.get_intensity() < 3):
			Audio.play_sound("hurt")
			return
		hunger = hunger + 2
		Audio.play_sound("pickup")
		GlobalState.decrease_intensity(meal_cost)

func bath_pet():
	if (hygiene == 10 or GlobalState.get_intensity() < 6):
		Audio.play_sound("hurt")
		return
	hygiene = hygiene + 1
	Audio.play_sound("pickup")
	GlobalState.decrease_intensity(bath_cost)

func entertain_pet():
	if (happiness == 10 or GlobalState.get_intensity() < 3):
		Audio.play_sound("hurt")
		return
	happiness = happiness + 1
	Audio.play_sound("pickup")
	GlobalState.decrease_intensity(entertain_cost)

func is_healthy():
	 var health = hunger + hygiene + happiness

	 if (health >= 15):
	 	return true
	 else:
	 	return false

# Getters & Setters
func get_age():
	return age

func set_age(value):
	age = value

func get_hunger():
	return hunger

func set_hunger(value):
	hunger = value

func get_hygiene():
	return hygiene

func set_hygiene(value):
	hygiene = value

func get_happiness():
	return happiness

func set_happiness(value):
	happiness = value

func get_evolution():
	return evolution

func set_evolution(value):
	evolution = value

func get_snack_cost():
	return snack_cost

func set_snack_cost(value):
	snack_cost = value

func get_meal_cost():
	return meal_cost

func set_meal_cost(value):
	meal_cost = value

func get_bath_cost():
	return bath_cost

func set_bath_cost(value):
	bath_cost = value

func get_entertain_cost():
	return entertain_cost

func set_entertain_cost(value):
	entertain_cost = value
