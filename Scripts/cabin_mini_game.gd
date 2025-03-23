extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TransitionScene.find_child("TextureRect").visible = false
	
	$"HBoxContainer2/1".connect("button_up",Callable(self,"_btn_pressed").bind([1]))
	$"HBoxContainer2/2".connect("button_up",Callable(self,"_btn_pressed").bind([2]))
	$"HBoxContainer2/3".connect("button_up",Callable(self,"_btn_pressed").bind([3]))
	$"HBoxContainer2/4".connect("button_up",Callable(self,"_btn_pressed").bind([4]))
	
func _btn_pressed(door_no):
	randomize()
	var num = randi_range(1,4)
	if door_no[0] == num:
		TransitionScene.scene = "res://Scenes/others/starting_scene.tscn"
		TransitionScene.get_node("AnimationPlayer").play("transition2")
	else:
		Globals.player_died()
	
