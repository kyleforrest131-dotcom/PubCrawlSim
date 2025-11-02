extends Node2D

var pointer: bool = true
var attrForce: float = 1000


func _ready() -> void:
	var viewport_texture = $"Particle Viewport".get_texture()
	var mat := $TextureRect.material as ShaderMaterial
	mat.set_shader_parameter("SCREEN_TEXTURE", viewport_texture)

	$TextureRect.texture = viewport_texture
	get_tree().paused = false

func _process(delta: float) -> void:
	var dropCount: int = 0
	for wg in get_tree().get_nodes_in_group("waterGenerator"):
		dropCount += wg.objects.size()
