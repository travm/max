extends Node

var age = 0;
var hunger = 10
var hygiene = 10
var happiness = 10

func _ready():
	set_process(true)

func _process(delta):
    # Add Timer To Decrease Stats Over Timer

    # Add Timer To Age The Pet (1 Day = 10 Minutes?)
    pass

func feed_pet(type):
    if (hunger == 10):
        return

    if (type == 'snack'):
        hunger = hunger + 1;
        # Spend One Intensity Point
    elif (type == 'meal' and hunger <= 8):
        hunger = hunger + 2
        # Spend Two Intensity Points

func bathe_pet():
    if (hygiene == 10):
        return

    hygiene = hygiene + 1

func entertain_pet():
    if (happiness == 10):
        return

    happiness = happiness + 1
