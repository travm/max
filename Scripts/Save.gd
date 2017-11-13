extends Node

var Global

const SAVE_PATH = "res://save.json"
var _settings = {}

func _ready():
	Global = get_node("/root/Global")
	load_game()
	
func save_game():
	# Create Save Game Dictionary
	var save_dict = {
		Global = {
			units = Global.units,
			intensity = Global.intensity,
			intensity_cost = Global.intensity_cost,
			wait_time = Global.wait_time,
			player_pos = {
				x = Global.player_pos.x,
				y = Global.player_pos.y
			}
		}
	}
	
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)
	save_file.store_line(save_dict.to_json())
	save_file.close()
	
func load_game():
	var save_file = File.new()
	var data = {}
	
	# Return If Save File Doens't Exist
	if not save_file.file_exists(SAVE_PATH):
		return
	
	save_file.open(SAVE_PATH, File.READ)
	data.parse_json(save_file.get_as_text())
	
	# Update Global Properties
	Global.units = data["Global"]["units"]
	Global.intensity = data["Global"]["intensity"]
	Global.intensity_cost = data["Global"]["intensity_cost"]
	Global.wait_time = data["Global"]["wait_time"]
	Global.player_pos = Vector2(data["Global"]["player_pos"]["x"], data["Global"]["player_pos"]["y"])
	
	