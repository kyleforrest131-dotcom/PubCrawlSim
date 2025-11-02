extends Node2D

var pointer: bool = true
var attrForce: float = 1000


func _ready() -> void:
	get_tree().paused = false

func _process(delta: float) -> void:
	var dropCount: int = 0
	for wg in get_tree().get_nodes_in_group("waterGenerator"):
		dropCount += wg.objects.size()
