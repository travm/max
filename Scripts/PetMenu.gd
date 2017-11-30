extends Node2D

var PetState

var SelectLabel

var select_position = 0

func _ready():
	set_process_input(true)
	PetState = get_node("/root/PetState")
	SelectLabel = get_node("SelectLabel")

func _input(event):
	if (event.is_action_pressed("ui_accept")):
		perform_action(select_position)
		pass

	if (event.is_action_pressed("ui_left")):
		if (select_position == 0):
			return
		select_position = select_position - 1
		move_selector(select_position)

	if (event.is_action_pressed("ui_right")):
		if (select_position == 3):
			return
		select_position = select_position + 1
		move_selector(select_position)

func move_selector(position):
	if (position == 0):
		SelectLabel.set_pos(Vector2(40, 15))
	if (position == 1):
		SelectLabel.set_pos(Vector2(153, 15))
	if (position == 2):
		SelectLabel.set_pos(Vector2(254, 15))
	if (position == 3):
		SelectLabel.set_pos(Vector2(357, 15))

func perform_action(position):
	if (position == 0):
		PetState.feed_pet("snack")
	if (position == 1):
		PetState.feed_pet("meal")
	if (position == 2):
		PetState.bath_pet()
	if (position == 3):
		PetState.entertain_pet()
