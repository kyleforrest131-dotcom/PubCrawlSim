extends Node2D

@onready var cone: RigidBody2D = $Cone
@onready var victory_area: Area2D = $VictoryArea
@onready var victory_label: Label = $VictoryLabel


var entered_time: float = 0.0
var area_inside: bool = false


func _process(delta: float) -> void:
	if area_inside:
		entered_time += delta
		# Check that the cone has landed in the correctd zone and is statinoary
		if entered_time >= 2.0 and cone.linear_velocity == Vector2.ZERO:
			print("CONE LANDED")
			victory_label.visible = true
			

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("ENTERED")
	entered_time = 0.0
	area_inside = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	print("EXITED")
	area_inside = false
	entered_time = 0.0
