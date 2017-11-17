extends CanvasLayer

var GlobalState
var Save

var UnitsLabel

func _ready():
	set_process(true)
	GlobalState = get_node("/root/GlobalState")
	Save = get_node("/root/Save")
	UnitsLabel = get_node("Units")

func _process(delta):
	UnitsLabel.set_text(str(GlobalState.get_units()))

func _on_button_pressed():
	Save.save_game()
