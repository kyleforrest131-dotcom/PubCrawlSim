extends Node2D
var objects: Array[Array] = []

@onready var cir_shape := CircleShape2D.new()
@onready var tex: Texture2D = preload("res://pint game/beer drop.png")
@export var spawnRad: float
var texSize: float = 10
var pointer: bool = true
@onready var attrForce: float = get_parent().attrForce
@export var viewport_root_path: NodePath
var viewport_root: Node2D




func _ready() -> void:
	cir_shape.radius = 3.4
	cir_shape.custom_solver_bias = 0.1
	viewport_root = get_node(viewport_root_path)
	#await get_tree().create_timer(3).timeout
	#while Engine.get_frames_per_second() > 90:
		#create_object(global_position + Vector2.from_angle(randf()*TAU)*spawnRad*randf())
		#await get_tree().create_timer(0.001).timeout

func create_object(pos: Vector2):
	var local_pos = to_local(pos)
	var ps := PhysicsServer2D
	var object = ps.body_create()
	ps.body_set_space(object, get_world_2d().space)
	ps.body_add_shape(object, cir_shape)
	ps.body_set_param(object, ps.BODY_PARAM_FRICTION, 0.1)
	ps.body_set_param(object, ps.BODY_PARAM_MASS, 0.1)
	ps.body_set_mode(object, ps.BODY_MODE_RIGID_LINEAR)
	var trans := Transform2D(0, local_pos)
	ps.body_set_state(object, ps.BODY_STATE_TRANSFORM, trans)

	var sprite := Sprite2D.new()
	sprite.texture = tex
	var mat := ShaderMaterial.new()
	mat.shader = preload("res://pint game/waterEffect.gdshader")
	sprite.material = mat
	viewport_root.add_child(sprite)
	sprite.position = local_pos


	objects.append([object, sprite])


func _physics_process(delta):
	var index: int = 0
	for pair in objects:
		var object: RID = pair[0]
		var sprite: Sprite2D = pair[1]  # <- changed from img
		var trans: Transform2D = PhysicsServer2D.body_get_state(object, PhysicsServer2D.BODY_STATE_TRANSFORM)
		trans.origin -= global_position
		
		if trans.origin.y > 648 - global_position.y:
			objects.remove_at(index)
			PhysicsServer2D.free_rid(object)
			sprite.queue_free()  # <- replace RenderingServer.free_rid
		else:
			sprite.position = trans.origin  # <- replace canvas_item_set_transform
			PhysicsServer2D.body_set_constant_force(object, Vector2.ZERO)
		
		index += 1


func _exit_tree():
	for pair in objects:
		var object: RID = pair[0]
		var img: RID = pair[1]
		PhysicsServer2D.free_rid(object)
		RenderingServer.free_rid(img)


func _process(delta: float) -> void:
	attrForce = get_parent().attrForce
	pointer = get_parent().pointer
	if Input.is_action_pressed("ui_accept"):
		create_object(global_position + Vector2(randf() - 0.5, randf() - 0.5).normalized() * spawnRad * randf())
