extends CanvasLayer

var GlobalState
var Save

var UnitsLabel
var IntensityLabel
var SaveLabel

func _ready():
	set_process(true)

	GlobalState = get_node("/root/GlobalState")
	Save = get_node("/root/Save")

	UnitsLabel = get_node("UnitsLabel")
	IntensityLabel = get_node("IntensityLabel")
	SaveLabel = get_node("SaveLabel")

func _process(delta):
	UnitsLabel.set_text(str(GlobalState.get_units()))
	IntensityLabel.set_text(str(GlobalState.get_intensity()))

	if (Save.get_recently_saved()):
		SaveLabel.set_hidden(false)
	else:
		SaveLabel.set_hidden(true)
