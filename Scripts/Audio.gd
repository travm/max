extends Node

var tick_sample = preload("res://Audio/tick.smp")
var pickup_sample = preload("res://Audio/pickup.smp")
var hurt_sample = preload("res://Audio/hurt.smp")
var background_music = preload("res://Audio/music.ogg")

var Library
var SoundPlayer
var MusicPlayer

func _ready():
	set_process_input(true)

	# Build Sample Library
	Library = SampleLibrary.new()
	Library.add_sample("tick", tick_sample)
	Library.add_sample("pickup", pickup_sample)
	Library.add_sample("hurt", hurt_sample)

	# Initialize Sample Player
	SoundPlayer = SamplePlayer.new()
	SoundPlayer.set_polyphony(4)
	SoundPlayer.set_default_volume(0.25)
	SoundPlayer.set_sample_library(Library)

	# Initialize Stream Player
	MusicPlayer = StreamPlayer.new()
	MusicPlayer.set_stream(background_music)
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
