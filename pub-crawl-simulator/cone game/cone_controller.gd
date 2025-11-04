extends RigidBody2D

@onready var line: Line2D = $Line2D

enum ConeState {IDLE, AIMING, LAUNCHED}
var current_state = ConeState.IDLE

var aim_start_mouse: Vector2 = Vector2.ZERO
var launch_strength: float = 0.0
var launch_direction: Vector2 = Vector2.ZERO


func change_state(new_state: ConeState) -> void:
	current_state = new_state
	
	match current_state:
		ConeState.IDLE:
			print("IDLE")
			
		ConeState.AIMING:
			print("AIMING")
			line.clear_points()
			line.add_point(Vector2.ZERO)
			line.add_point(Vector2.ZERO)
			aim_start_mouse = get_global_mouse_position()
			
			
		ConeState.LAUNCHED:
			print("LAUNCHED")
			print(launch_direction)
			print(launch_strength)
			launch()

func remove_aim_line() -> void:
	line.remove_point(1)

func draw_aim_line() -> void:
	
	var current_mouse = get_global_mouse_position()
	var drag_vector = current_mouse - aim_start_mouse
	var local_drag = to_local(position + drag_vector)
				
	line.set_point_position(1,local_drag)
	launch_strength = drag_vector.length() * 2
	launch_direction = drag_vector.normalized()
	
	
	# Clamp power between 0 and 1 so it doesn't go out of range
	var t = clamp(launch_strength / 5000.0, 0.0, 1.0)

	var color_start = Color(1, 1, 1)   # Yellow
	var color_end = Color(1, 0, 0)     # Red
	
	var line_color = color_start.lerp(color_end, t)
	line.modulate = line_color

func launch() -> void:
	apply_central_impulse(launch_direction * launch_strength)
	#apply_torque_impulse(launch_strength)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match current_state:
		ConeState.AIMING:
			draw_aim_line()

			
	
	
func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		# When aiming
		if event.is_action_pressed("left_click") and current_state == ConeState.IDLE:
			change_state(ConeState.AIMING)
			
		# When launched
		elif event.is_action_released("left_click") and current_state == ConeState.AIMING:
			change_state(ConeState.LAUNCHED)
			remove_aim_line()

		# When cancel aiming
		elif !event.is_action_pressed("left_click") and current_state == ConeState.AIMING:
			change_state(ConeState.IDLE)
			remove_aim_line()
			
			
func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	
