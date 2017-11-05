extends KinematicBody2D

export var speed = 50

var screensize
var extents
var velocity = Vector2()

func _ready():
	print("Player Ready.")
	set_fixed_process(true)
	
func _fixed_process(delta):
	var direction = Vector2(0, 0)
	
	if (Input.is_action_pressed("ui_left")):
		direction += Vector2(-1, 0)
	elif (Input.is_action_pressed("ui_up")):
		direction += Vector2(0, -1)
	elif (Input.is_action_pressed("ui_right")):
		direction += Vector2(1, 0)
	elif (Input.is_action_pressed("ui_down")):
		direction += Vector2(0, 1)
	
	var motion = direction * speed * delta
	motion = move(motion)
	
	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		direction = n.slide(direction)
		move(motion)