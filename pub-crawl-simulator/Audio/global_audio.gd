extends Node2D
@onready var button_click: AudioStreamPlayer = $"Button Click"
@onready var background_music: AudioStreamPlayer = $"Background Music"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func click():
	button_click.play()

func back_music_start():
	background_music.play()
	
func back_music_stop():
	background_music.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
