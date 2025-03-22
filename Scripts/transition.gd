extends Node2D

var scene = "res://Scenes/Woods/woods.tscn"
@onready var label = get_node("CanvasLayer/Label")
func change_scene():
	label.visible = false
	get_tree().change_scene_to_file(scene)
