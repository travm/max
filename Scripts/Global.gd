extends Node

var score

func _ready():
	print("Loading from Global...")
	
func can_use_item(char, item):
	if (char.get_global_pos().distance_to(item.get_global_pos()) <= 100):
		return true
	else:
		return false