extends CanvasLayer

var GlobalState

var UnitsLabel
var IntensityLabel

func _ready():
	set_process(true)
	GlobalState = get_node("/root/GlobalState")
	UnitsLabel = get_node("Units")
	IntensityLabel = get_node("Intensity")

func _process(delta):
	UnitsLabel.set_text(str(GlobalState.get_units()))
	IntensityLabel.set_text(str(GlobalState.get_intensity()))
