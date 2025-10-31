extends Control
@onready var play: Button = $MarginContainer/VBoxContainer/Play
@onready var options: Button = $MarginContainer/VBoxContainer/Options
@onready var credits: Button = $MarginContainer/VBoxContainer/Credits
@onready var exit: Button = $MarginContainer/VBoxContainer/Exit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalAudio.back_music_start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
