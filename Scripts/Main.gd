extends Node2D

var score = 0
var intensity = 1


func _ready():
	set_process(true)
	
func _process(delta):
	#print(score)
	#score + intensity
	pass
	
func increase_intensity():
	#intensity = intensity + 1