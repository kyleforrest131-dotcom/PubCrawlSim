extends Node2D
@onready var back: Button = $Back


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back.pressed.connect(back_pressed)
	pass # Replace with function body.
	

func back_pressed():
	GlobalAudio.click()
	get_tree().change_scene_to_file("res://main menu/menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
