extends KinematicBody2D

var GlobalState

var AnimationPlayer
var RayCast

export var speed = 50
var animation = ""
var lastAnimation = ""

func _ready():
	set_fixed_process(true)
	GlobalState = get_node("/root/GlobalState")
	AnimationPlayer = get_node("Sprite/AnimationPlayer")
	RayCast = get_node("RayCast2D")

func _fixed_process(delta):
	var velocity = Vector2(0, 0)

	# Player Movement
	if (Input.is_action_pressed("ui_left")):
		velocity += Vector2(-1, 0)
		RayCast.set_rotd(-90)
	if (Input.is_action_pressed("ui_up")):
		velocity += Vector2(0, -1)
		RayCast.set_rotd(180)
	if (Input.is_action_pressed("ui_right")):
		velocity += Vector2(1, 0)
		RayCast.set_rotd(90)
	if (Input.is_action_pressed("ui_down")):
		velocity += Vector2(0, 1)
		RayCast.set_rotd(0)

	# Animations
	if (velocity.length() == 0):
		# Idle Animations
		if (RayCast.get_rotd() == -90):
			animation = "Left Idle"
		if (RayCast.get_rotd() == 180):
			animation = "Up Idle"
		if (RayCast.get_rotd() == 90):
			animation = "Right Idle"
		if (RayCast.get_rotd() == 0):
			animation = "Down Idle"
	else:
		if (Input.is_action_pressed("ui_left")):
			animation = "Left"
		if (Input.is_action_pressed("ui_up")):
			animation = "Up"
		if (Input.is_action_pressed("ui_right")):
			animation = "Right"
		if (Input.is_action_pressed("ui_down")):
			animation = "Down"

	if (animation != lastAnimation):
		lastAnimation = animation
		AnimationPlayer.play(lastAnimation)

	# Sprint Control
	if (Input.is_action_pressed("ui_sprint")):
		speed = 75
		AnimationPlayer.set_speed(2)
	else:
		speed = 50
		AnimationPlayer.set_speed(1.5)

	# Apply Velocity & Speed To Move Character
	var motion = velocity.normalized() * speed * delta
	motion = move(motion)

	# Geno, them boards up there are slippy!
	# (Allows movement against physics objects)
	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		move(motion)

	# Set Player Position In Global
	GlobalState.set_player_pos(get_pos())
