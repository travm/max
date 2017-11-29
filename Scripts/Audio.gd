extends Node

var tickSample = preload("res://Audio/tick.smp")
var pickupSample = preload("res://Audio/pickup.smp")
var hurtSample = preload("res://Audio/hurt.smp")
var backgroundMusic = preload("res://Audio/music.ogg")

var Library
var SoundPlayer
var MusicPlayer

func _ready():
	set_process_input(true)

	# Build Sample Library
	Library = SampleLibrary.new()
	Library.add_sample("tick", tickSample)
	Library.add_sample("pickup", pickupSample)
	Library.add_sample("hurt", hurtSample)

	# Initialize Sample Player
	SoundPlayer = SamplePlayer.new()
	SoundPlayer.set_polyphony(4)
	SoundPlayer.set_sample_library(Library)

	# Initialize Stream Player
	MusicPlayer = StreamPlayer.new()
	MusicPlayer.set_stream(backgroundMusic)
	MusicPlayer.set_loop(true)
	add_child(MusicPlayer)
	MusicPlayer.play()

func _input(event):
	if (event.is_action_pressed("ui_mute")):
		toggle_music_mute();

func play_sound(sample_name):
	SoundPlayer.play(sample_name)

func toggle_music_mute():
	if (MusicPlayer.get_volume() == 0):
		MusicPlayer.set_volume(1)
	else:
		MusicPlayer.set_volume(0)
