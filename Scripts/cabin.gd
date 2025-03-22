extends StaticBody2D


var cursor_on = false

func _process(delta: float) -> void:
	if Globals.progress == 4 and Globals.has_key:
		Globals.change_scene($Area2D,"res://Scenes/Cabin/cabin_interior.tscn",find_parent("Woods").get_node("Player").global_position,false)
