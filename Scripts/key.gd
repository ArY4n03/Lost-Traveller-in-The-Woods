extends CharacterBody2D


const SPEED = 300.0
var dir = Vector2();
var mouse_pos = null;
var dis = 0

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	dir = Vector2()
	if Input.is_action_pressed("move_to"):
		mouse_pos = get_global_mouse_position()

		dir = (mouse_pos - global_position).normalized()

	velocity = Vector2(300,300) * dir
	move_and_slide()
