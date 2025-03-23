extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.progress in [0,1]:
		Globals.change_scene($Area2D,"res://Scenes/others/questions.tscn",find_parent("Woods").get_node("Player").global_position,false)
	elif Globals.progress == 4:
		Globals.change_scene($Area2D,"res://Scenes/others/cabin_mini_game.tscn",find_parent("Cabin Interior").get_node("Player").global_position,false)
