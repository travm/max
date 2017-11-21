extends CanvasLayer

var GlobalState

var UnitsLabel

func _ready():
	set_process(true)
	GlobalState = get_node("/root/GlobalState")
	UnitsLabel = get_node("Units")

func _process(delta):
	UnitsLabel.set_text(str(GlobalState.get_units()))
