extends Node2D

var PetState

var HungerBarLevel
var HygieneBarLevel
var HappinessBarLevel

func _ready():
	set_process(true)

	PetState = get_node("/root/PetState")

	HungerBarLevel = get_node("HungerBar/Level")
	HygieneBarLevel = get_node("HygieneBar/Level")
	HappinessBarLevel = get_node("HappinessBar/Level")

	# Initialize Stats Display
	set_stats()

func _process(delta):
	set_stats()

func set_stat_level(bar, value):
	bar.set_size(Vector2(value * 4, 8))

func set_stats():
	set_stat_level(HungerBarLevel, PetState.get_hunger())
	set_stat_level(HygieneBarLevel, PetState.get_hygiene())
	set_stat_level(HappinessBarLevel, PetState.get_happiness())
