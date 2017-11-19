extends Node

var GlobalState

var AgeTimer
var StatsTimer

var age = 0;
var hunger = 5
var hygiene = 5
var happiness = 4
var evolution = 1

func _ready():
	set_process(true)

	GlobalState = get_node("root/Global")

	# Add Timer To Decrease Stats Over Timer
	StatsTimer = Timer.new()
	StatsTimer.connect("timeout", self, "decrease_stats")
	StatsTimer.set_wait_time(5)
	StatsTimer.set_active(false)
	add_child(StatsTimer)

	# Add Timer To Age The Pet (1 Day = 20 Seconds?)
	AgeTimer = Timer.new()
	AgeTimer.connect("timeout", self, "increase_age")
	AgeTimer.set_wait_time(1)
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
	if (hunger == 1):
		return
	hunger = hunger - 1

func decrease_hygiene():
	if (hygiene == 1):
		return
	hygiene = hygiene - 1

func decrease_happiness():
	if (happiness == 1):
		return
	happiness = happiness - 1

func feed_pet(type):
	if (hunger == 10):
		return
	if (type == "snack"):
		hunger = hunger + 1;
		GlobalState.decrease_intensity(1)
	elif (type == "meal" and hunger <= 8):
		hunger = hunger + 2
		GlobalState.decrease_intensity(2)

func bathe_pet():
	if (hygiene == 10):
		return
	hygiene = hygiene + 1

func entertain_pet():
	if (happiness == 10):
		return
	happiness = happiness + 1

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
