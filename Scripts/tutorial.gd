extends Control


func _on_button_button_up() -> void:
	TransitionScene.scene = "res://Scenes/Woods/woods.tscn"
	TransitionScene.get_node("AnimationPlayer").play("transition2")
