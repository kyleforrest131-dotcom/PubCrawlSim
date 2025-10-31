extends Node2D
@onready var volume: HSlider = $Volume


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	volume.value_changed.connect(volume_slide)
	pass # Replace with function body.

func volume_slide(volume_val):
	GlobalAudio.music_volume(volume_val)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
