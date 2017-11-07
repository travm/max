extends Area2D

var Bubble

func _ready():
	Bubble = get_node("Bubble")


func _on_computer_body_enter( body ):
	if (body.get_name() == "Player"):
		print("Player is near.")
		Bubble.set_hidden(false);


func _on_computer_body_exit( body ):
	if (body.get_name() == "Player"):
		print("Player is leaving.")
		Bubble.set_hidden(true);
