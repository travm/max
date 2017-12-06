extends Node

var GlobalState
var PetState

var ResetRecentlySavedTimer

const SAVE_PATH = "res://save.json"
var recently_saved = false

func _ready():
	GlobalState = get_node("/root/GlobalState")
	PetState = get_node("/root/PetState")

	# Timer To Reset Recently Saved Trigger
	ResetRecentlySavedTimer = Timer.new()
	ResetRecentlySavedTimer.connect("timeout", self, "reset_recently_saved")
	ResetRecentlySavedTimer.set_wait_time(2)
	ResetRecentlySavedTimer.set_one_shot(true)
	add_child(ResetRecentlySavedTimer)

	# Initial Load
	load_game()

func save_game():
	# Create Save Game Dictionary
	var save_dict = {
		GlobalState = {
			units = GlobalState.get_units(),
			intensity = GlobalState.get_intensity(),
			intensity_cost = GlobalState.get_intensity_cost(),
			wait_time = GlobalState.get_wait_time(),
			#player_pos = {
			#	x = GlobalState.get_player_pos().x,
			#	y = GlobalobalState.get_player_pos().y
			#},
			#player_rotd = GlobalState.get_player_rotd()
		},
		PetState = {
			age = PetState.get_age(),
			health = PetState.get_health(),
			hunger = PetState.get_hunger(),
			hygiene = PetState.get_hygiene(),
			happiness = PetState.get_happiness(),
			evolution = PetState.get_evolution()
		}
	}

	# Create New Save File
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)
	save_file.store_line(save_dict.to_json())
	save_file.close()

	# Toggle Recently Saved Flag
	set_recently_saved(true);
	ResetRecentlySavedTimer.start();


func load_game():
	var save_file = File.new()
	var data = {}

	# Return If Save File Doesn't Exist
	if not save_file.file_exists(SAVE_PATH):
		return

	# Load & Parse Save File
	save_file.open(SAVE_PATH, File.READ)
	data.parse_json(save_file.get_as_text())

	# Set Global State Properties
	GlobalState.set_units(data["GlobalState"]["units"])
	GlobalState.set_intensity(data["GlobalState"]["intensity"])
	GlobalState.set_intensity_cost(data["GlobalState"]["intensity_cost"])
	GlobalState.set_wait_time(data["GlobalState"]["wait_time"])
	#GlobalState.set_player_pos(Vector2(data["GlobalState"]["player_pos"]["x"], data["GlobalState"]["player_pos"]["y"]))
	#GlobalState.set_player_rotd(data["GlobalState"]["player_rotd"])

	# Set Pet State Properties
	PetState.set_age(data["PetState"]["age"])
	PetState.set_health(data["PetState"]["health"])
	PetState.set_hunger(data["PetState"]["hunger"])
	PetState.set_hygiene(data["PetState"]["hygiene"])
	PetState.set_happiness(data["PetState"]["happiness"])
	PetState.set_evolution(data["PetState"]["evolution"])

func get_recently_saved():
	return recently_saved

func set_recently_saved(value):
	recently_saved = value

func reset_recently_saved():
	set_recently_saved(false)




