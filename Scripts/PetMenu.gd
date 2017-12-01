extends Node2D

var GlobalState
var PetState

var CostLabel
var IntensityLabel
var SelectLabel

var select_position = 0

func _ready():
	set_process_input(true)

	PetState = get_node("/root/PetState")
	GlobalState = get_node("/root/GlobalState")

	CostLabel = get_node("CostLabel")
	IntensityLabel = get_node("IntensityLabel")
	SelectLabel = get_node("SelectLabel")

	# Default To Snack Cost
	CostLabel.set_text("-" + str(PetState.get_snack_cost()))
	IntensityLabel.set_text(str(GlobalState.get_intensity()))


func _input(event):
	# Prevent Input If Pet Is Dead
	if (PetState.get_evolution() == 0):
		return

	if (event.is_action_pressed("ui_accept")):
		perform_action(select_position)
		pass

	if (event.is_action_pressed("ui_left")):
		if (select_position == 0):
			return
		select_position = select_position - 1
		update_selection(select_position)

	if (event.is_action_pressed("ui_right")):
		if (select_position == 3):
			return
		select_position = select_position + 1
		update_selection(select_position)

func update_selection(position):
	if (position == 0):
		SelectLabel.set_pos(Vector2(40, 15))
		CostLabel.set_text("-" + str(PetState.get_snack_cost()))
	if (position == 1):
		SelectLabel.set_pos(Vector2(153, 15))
		CostLabel.set_text("-" + str(PetState.get_meal_cost()))
	if (position == 2):
		SelectLabel.set_pos(Vector2(254, 15))
		CostLabel.set_text("-" + str(PetState.get_bath_cost()))
	if (position == 3):
		SelectLabel.set_pos(Vector2(357, 15))
		CostLabel.set_text("-" + str(PetState.get_entertain_cost()))

func perform_action(position):
	if (position == 0):
		PetState.feed_pet("snack")
	if (position == 1):
		PetState.feed_pet("meal")
	if (position == 2):
		PetState.bath_pet()
	if (position == 3):
		PetState.entertain_pet()

	IntensityLabel.set_text(str(GlobalState.get_intensity()))


