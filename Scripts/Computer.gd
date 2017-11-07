extends StaticBody2D

var Bubble
var RayCast

func _ready():
	set_process(true)
	Bubble = get_node("Bubble")
	RayCast = get_node("RayCast2D")

func _process(delta):
	if (RayCast.is_colliding()):
		print(RayCast.get_collider().get_name())
		Bubble.set_hidden(false);
		print("Colliding!")
	else:
		Bubble.set_hidden(true);
