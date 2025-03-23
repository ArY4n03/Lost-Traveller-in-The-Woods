extends Control


var can_change_scene = false
@onready var end_scene_text = "And just like that I finally escaped\nI died " + str(Globals.death_count)+" times in that place"
func _ready() -> void:
	if Globals.progress == 4:
		$RichTextLabel.text = end_scene_text
	$AnimationPlayer.play("typing animation")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	can_change_scene = true


func _on_next_button_up() -> void:
	if Globals.progress != 4:
		TransitionScene.scene = "res://Scenes/Woods/woods.tscn"
	else:
		TransitionScene.scene = "res://Scenes/others/title_screen.tscn"
	
	TransitionScene.get_node("AnimationPlayer").play("transition2")
