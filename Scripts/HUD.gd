extends CanvasLayer

var Global
var Save

var UnitsLabel

func _ready():
	set_process(true)
	Global = get_node("/root/Global")
	Save = get_node("/root/Save")
	UnitsLabel = get_node("Units")

func _process(delta):
	UnitsLabel.set_text(str(Global.get_units()))

func _on_button_pressed():
	Save.save_game()