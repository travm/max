extends Area2D

export var speed = 50

var screensize
var extents
var velocity = Vector2()

func _ready():
	print("Player Ready.")
	set_fixed_process(true)
	screensize = get_viewport_rect().size
	extents = get_node("Sprite").get_texture().get_size() / 2
	#set_pos(screensize / 2)
	
func _fixed_process(delta):
	var input = Vector2(0,0)
	var pos
	
	if (Input.is_action_pressed("ui_sprint")):
		speed = 100
	else:
		speed = 50
	
	input = Vector2(0,0)
	input.x = Input.is_action_pressed("ui_right") - Input.is_action_pressed("ui_left")
	input.y = Input.is_action_pressed("ui_down") - Input.is_action_pressed("ui_up")
	velocity = input.normalized() * speed
	
	pos = get_pos() + velocity * delta
	pos.x = clamp(pos.x, 0, screensize.width)
	pos.y = clamp(pos.y, 0, screensize.height)
	
	set_pos(pos)