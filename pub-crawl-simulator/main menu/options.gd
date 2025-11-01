extends Node2D
@onready var volume: HSlider = $Volume
@onready var back: Button = $Back
@onready var full_scrn: CheckButton = $"Full Scrn"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	volume.value_changed.connect(volume_slide)
	back.pressed.connect(back_pressed)
	full_scrn.button_down.connect(full_scrn_down)
	full_scrn.button_up.connect(full_scrn_up)
	pass # Replace with function body.

func volume_slide(volume_val):
	GlobalAudio.music_volume(volume_val)
	pass

func back_pressed():
	get_tree().change_scene_to_file("res://main menu/menu.tscn")
	
func full_scrn_down():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
func full_scrn_up():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
