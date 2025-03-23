extends Area2D

func _process(delta: float) -> void:
	if len(get_overlapping_bodies()) > 0:
		if Input.is_action_just_pressed("interact"):
			find_parent("Woods").get_node("Popup").show() 
