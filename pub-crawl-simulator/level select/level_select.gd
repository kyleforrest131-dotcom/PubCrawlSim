extends Node2D
@onready var cone_game: Button = $"Cone Game"
@onready var pint_game: Button = $"Pint Game"
@onready var pong_game: Button = $"Pong Game"
@onready var back: Button = $Back


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cone_game.pressed.connect(cone_pressed)
	pint_game.pressed.connect(pint_pressed)
	pong_game.pressed.connect(pong_pressed)
	back.pressed.connect(back_pressed)
	if GlobalAudio.cone_complete == false:
		pint_game.visible = false
	if GlobalAudio.pint_complete == false:
		pong_game.visible = false
	pass # Replace with function body.


func back_pressed():
	GlobalAudio.click()
	get_tree().change_scene_to_file("res://main menu/menu.tscn")

func cone_pressed():
	GlobalAudio.click()
	get_tree().change_scene_to_file("res://cone game/cone game.tscn")
	pass

func pint_pressed():
	GlobalAudio.click()
	get_tree().change_scene_to_file("res://pint game/pint game.tscn")
	pass
	
func pong_pressed():
	GlobalAudio.click()
	get_tree().change_scene_to_file("res://pong game/pong game.tscn")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
