extends KinematicBody2D

var Sprite
var Timer

export var speed = 50
var newDirection = Vector2(0, 0)

func _ready():
	set_fixed_process(true)
	
	# Initialize Sprite
	Sprite = get_node("Sprite")
	Sprite.set_texture(load(get_texture(2)))
	Sprite.set_hframes(2)
	
	# Random Pet Movement
	Timer = get_node("Timer")
	Timer.connect("timeout", self, "set_direction")
	

func _fixed_process(delta):
	var motion
	var direction = Vector2(0, 0)
	
	direction += newDirection
	
	motion = direction.normalized() * speed * delta
	motion = move(motion)

func set_direction():
	newDirection = Vector2(range(-1, 2)[randi() % 3], 0)

func get_texture(stage):
	if (stage == 1):
		return "res://Sprites/pet-infant.png"
	elif (stage == 2):
		return "res://Sprites/pet-adolescent.png"
	elif (stage == 3):
		return "res://Sprites/pet-adult-one.png"
	elif (stage == 4):
		return "res://Sprites/pet-adult-two.png"
	else:
		return "res://Sprites/pet-infant.png"