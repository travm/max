extends CanvasLayer

var Global
var Save

var units

func _ready():
	set_process(true)
	Global = get_node("/root/Global")
	Save = get_node("/root/Save")
	units = get_node("Units")

func _process(delta):
	units.set_text(str(Global.units))

func _on_button_pressed():
	Save.save_game()