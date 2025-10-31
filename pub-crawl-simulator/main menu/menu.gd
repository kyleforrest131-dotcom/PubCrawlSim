extends Control
@onready var play_button: Button = $"MarginContainer/VBoxContainer/Play Button"
@onready var options_button: Button = $"MarginContainer/VBoxContainer/Options Button"
@onready var credits_button: Button = $"MarginContainer/VBoxContainer/Credits Button"
@onready var exit_button: Button = $"MarginContainer/VBoxContainer/Exit Button"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalAudio.back_music_start()
	play_button.pressed.connect(play_pressed)
	options_button.pressed.connect(options_pressed)
	credits_button.pressed.connect(credits_pressed)
	exit_button.pressed.connect(exit_pressed)
	pass # Replace with function body.

func play_pressed():
	GlobalAudio.back_music_stop()
	get_tree().change_scene_to_file("res://level select/level select.tscn")
	pass

func options_pressed():
	pass
	
func credits_pressed():
	pass
	
func exit_pressed():
	get_tree().quit()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
