extends Node2D

var score = 0
var intensity = 1


func _ready():
	set_process(true)
	
func _process(delta):
	if (Input.is_action_pressed("ui_cancel")):
		get_tree().change_scene("res://Scenes/Title.tscn")
	
	if (Input.is_action_pressed("ui_accept")):
		#increase_score()
		pass

func increase_score():
	score = score + intensity
	#get_node("Score").set_text(str(score))

func increase_intensity():
	intensity = intensity + 1