extends CanvasLayer

var Global
var Units

func _ready():
	set_process(true)
	Global = get_node("/root/Global")
	Units = get_node("Units")
	
func _process(delta):
	Units.set_text(str(Global.units))
