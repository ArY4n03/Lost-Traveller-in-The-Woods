extends StaticBody2D



func _process(delta: float) -> void:
	if Globals.progress == 3:
		Globals.change_scene($Area2D,"res://Scenes/others/blue_orb_mini_game.tscn",find_parent("Woods").get_node("Player").global_position,false)
			
