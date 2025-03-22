extends StaticBody2D


func _process(delta: float) -> void:
	if Globals.progress == 2:
		Globals.change_scene($Area2D,"res://Scenes/others/questions.tscn",find_parent("Woods").get_node("Player").global_position,false)
	if Globals.progress == 3 and Globals.has_blueOrb:
		Globals.change_scene($Area2D,"res://Scenes/MiniGames/statue_mini_game.tscn",find_parent("Woods").get_node("Player").global_position,false)
			
