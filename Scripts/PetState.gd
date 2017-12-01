extends Node

var Audio
var GlobalState

var AgeTimer
var HealthTimer
var StatsTimer

var age = 1
var health = 10
var hunger = 10
var hygiene = 10
var happiness = 10
var evolution = 1
var snack_cost = 2
var meal_cost = 4
var bath_cost = 4
var entertain_cost = 2

func _ready():
	set_process(true)

	Audio = get_node("/root/Audio")
	GlobalState = get_node("/root/GlobalState")

	# Add Timer To Age The Pet (1 Day = 60 Seconds)
	AgeTimer = Timer.new()
	AgeTimer.connect("timeout", self, "increase_age")
	AgeTimer.set_wait_time(60)
	AgeTimer.set_active(false)
	add_child(AgeTimer)

	# Add Timer To Decrease Stats Over Time
	HealthTimer = Timer.new()
	HealthTimer.connect("timeout", self, "update_health")
	HealthTimer.set_wait_time(6)
	HealthTimer.set_active(false)
	add_child(HealthTimer)

	# Add Timer To Decrease Stats Over Time
	StatsTimer = Timer.new()
	StatsTimer.connect("timeout", self, "decrease_stats")
	StatsTimer.set_wait_time(60)
	StatsTimer.set_active(false)
	add_child(StatsTimer)

func _process(delta):
	update_evolution()

# Methods
func start_timers():
	AgeTimer.set_active(true)
	AgeTimer.start()
	HealthTimer.set_active(true)
	HealthTimer.start()
	StatsTimer.set_active(true)
	StatsTimer.start()

func stop_timers():
	AgeTimer.set_active(false)
	AgeTimer.stop()
	HealthTimer.set_active(false)
	HealthTimer.stop()
	StatsTimer.set_active(false)
	StatsTimer.stop()

func is_timer_active():
	return StatsTimer.is_active() or AgeTimer.is_active()

func update_evolution():
	if (age == 5):
		set_evolution(2)
	if (age == 10):
		set_evolution(3)
	if (age == 20):
		if (quality_of_life() == "good"):
			evolution = 4
		elif (quality_of_life() == "bad"):
			evolution = 5
		elif (quality_of_life() == "terrible"):
			evolution = 6

func update_health():
	if (hunger == 0 and hygiene == 0 and happiness == 0):
		if (health == 0):
			evolution = 0
			stop_timers()
			return
		else:
			health = health - 1

func decrease_stats():
	decrease_hunger()
	decrease_hygiene()
	decrease_happiness()

func increase_age():
	age = age + 1

func increase_hunger(value = 1):
	if (hunger == 10):
		return
	hunger = hunger + value

func decrease_hunger(value = 1):
	if (hunger == 0):
		return
	hunger = hunger - value

func increase_hygiene(value = 1):
	if (hygiene == 10):
		return
	hygiene = hygiene + value

func decrease_hygiene(value = 1):
	if (hygiene == 0):
		return
	hygiene = hygiene - value

func increase_happiness(value = 1):
	if (happiness == 10):
		return
	happiness = happiness + value

func decrease_happiness(value = 1):
	if (happiness == 0):
		return
	happiness = happiness - value

func feed_pet(type):
	if (hunger == 10):
		Audio.play_sound("hurt")
		return
	if (type == "snack"):
		if (GlobalState.get_intensity() < snack_cost + 1):
			Audio.play_sound("hurt")
			return
		increase_hunger()
		Audio.play_sound("pickup")
		GlobalState.decrease_intensity(snack_cost)
	elif (type == "meal"):
		if (hunger > 8 or GlobalState.get_intensity() < meal_cost + 1):
			Audio.play_sound("hurt")
			return
		increase_hunger(2)
		Audio.play_sound("pickup")
		GlobalState.decrease_intensity(meal_cost)

func bath_pet():
	if (hygiene == 10 or GlobalState.get_intensity() < bath_cost + 1):
		Audio.play_sound("hurt")
		return
	increase_hygiene()
	Audio.play_sound("pickup")
	GlobalState.decrease_intensity(bath_cost)

func entertain_pet():
	if (happiness == 10 or GlobalState.get_intensity() < entertain_cost + 1):
		Audio.play_sound("hurt")
		return
	decrease_hunger()
	decrease_hygiene()
	increase_happiness()
	Audio.play_sound("pickup")
	GlobalState.decrease_intensity(entertain_cost)

func quality_of_life():
	 var stat_total = hunger + hygiene + happiness

	 if (stat_total >= 15):
	 	return "good"
	 elif (stat_total >= 1 and stat_total < 15):
	 	return "bad"
	 elif (stat_total == 0):
	 	return "terrible"


# Getters & Setters
func get_age():
	return age

func set_age(value):
	age = value

func get_health():
	return health

func set_health(value):
	health = value

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
