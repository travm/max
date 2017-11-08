extends KinematicBody2D

export var speed = 50

var screensize
var extents
var velocity = Vector2()

var AnimationPlayer
var RayCast

func _ready():
	set_fixed_process(true)
	
	AnimationPlayer = get_node("Sprite/AnimationPlayer")
	RayCast = get_node("RayCast2D")
	
func _fixed_process(delta):
	var direction = Vector2(0, 0)
	
	if (Input.is_action_pressed("ui_left")):
		direction += Vector2(-1, 0)
		RayCast.set_rotd(-90)
		AnimationPlayer.play("Left")
	if (Input.is_action_pressed("ui_up")):
		direction += Vector2(0, -1)
		RayCast.set_rotd(180)
		AnimationPlayer.play("Up")
	if (Input.is_action_pressed("ui_right")):
		direction += Vector2(1, 0)
		RayCast.set_rotd(90)
		AnimationPlayer.play("Right")
	if (Input.is_action_pressed("ui_down")):
		direction += Vector2(0, 1)
		RayCast.set_rotd(0)
		AnimationPlayer.play("Down")
	
	# Sprint Control
	if (Input.is_action_pressed("ui_sprint")):
		speed = 75
	else:
		speed = 50
	
	var motion = direction.normalized() * speed * delta
	motion = move(motion)
	
	# Geno, them boards up there are slippy!
	# (Allows movement against physics objects)
	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		direction = n.slide(direction)
		move(motion)