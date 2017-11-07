extends KinematicBody2D

export var speed = 50

var screensize
var extents
var velocity = Vector2()

var AnimationPlayer

func _ready():
	print("Player Ready.")
	set_fixed_process(true)
	AnimationPlayer = get_node("Sprite/AnimationPlayer")
	
func _fixed_process(delta):
	var direction = Vector2(0, 0)
	
	if (Input.is_action_pressed("ui_left")):
		direction += Vector2(-1, 0)
		AnimationPlayer.play("Left")
	if (Input.is_action_pressed("ui_up")):
		direction += Vector2(0, -1)
		AnimationPlayer.play("Up")
	if (Input.is_action_pressed("ui_right")):
		direction += Vector2(1, 0)
		AnimationPlayer.play("Right")
	if (Input.is_action_pressed("ui_down")):
		direction += Vector2(0, 1)
		AnimationPlayer.play("Down")
	
	# Sprint Control
	if (Input.is_action_pressed("ui_sprint")):
		speed = 75
	else:
		speed = 50
	
	var motion = direction * speed * delta
	motion = move(motion)
	
	# Geno, them boards up there are slippy!
	# (Allows movement against physics objects)
	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		direction = n.slide(direction)
		move(motion)