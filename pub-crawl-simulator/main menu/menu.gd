extends Control
@onready var play_button: Button = $"Play Button"
@onready var options_button: Button = $"Options Button"
@onready var credits_button: Button = $"Credits Button"
@onready var exit_button: Button = $"Exit Button"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalAudio.music_play() == false:
		GlobalAudio.back_music_start()
	play_button.pressed.connect(play_pressed)
	options_button.pressed.connect(options_pressed)
	credits_button.pressed.connect(credits_pressed)
	exit_button.pressed.connect(exit_pressed)
	pass # Replace with function body.

func play_pressed():
	GlobalAudio.click()
	GlobalAudio.back_music_stop()
	get_tree().change_scene_to_file("res://level select/level select.tscn")
	pass

func options_pressed():
	GlobalAudio.click()
	get_tree().change_scene_to_file("res://main menu/options.tscn")
	pass
	
func credits_pressed():
	GlobalAudio.click()
	get_tree().change_scene_to_file("res://main menu/credits.tscn")
	pass
	
func exit_pressed():
	GlobalAudio.click()
	get_tree().quit()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
