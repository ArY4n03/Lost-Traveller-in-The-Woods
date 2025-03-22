extends Control
@onready var light = $PointLight2D
func _ready() -> void:
	TransitionScene.find_child("TextureRect").visible = false
	
func _process(delta: float) -> void:
	light.global_position = get_global_mouse_position()
	pass

func _on_credits_button_up() -> void:
	print("hello")
	$Popup.show()


func _on_play_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/Woods/woods.tscn")
