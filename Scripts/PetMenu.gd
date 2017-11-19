extends Node2D

var SelectLabel

var selectPosition = 0

func _ready():
	set_process_input(true)
	SelectLabel = get_node("SelectLabel")

func _input(event):
	if (event.is_action_pressed("ui_select")):
		# Fire Function For Selected Action
		pass

	if (event.is_action_pressed("ui_up")):
		if (selectPosition == 0):
			return
		selectPosition = selectPosition - 1
		print(selectPosition)
		move_selector(selectPosition)

	if (event.is_action_pressed("ui_down")):
		if (selectPosition == 3):
			return
		selectPosition = selectPosition + 1
		print(selectPosition)
		move_selector(selectPosition)

func move_selector(position):
	if (position == 0):
		SelectLabel.set_pos(Vector2(24, 32))
	if (position == 1):
		SelectLabel.set_pos(Vector2(24, 80))
	if (position == 2):
		SelectLabel.set_pos(Vector2(24, 128))
	if (position == 3):
		SelectLabel.set_pos(Vector2(24, 176))
