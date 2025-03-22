extends Node

var progress = 0
var playerPos = Vector2(-48,400)
var Player_revived = false
var has_key = false
var has_blueOrb = false

func  change_scene(area,scene,pos,is_dead):
	if len(area.get_overlapping_bodies()) > 0:
		if Input.is_action_just_pressed("interact"):
			playerPos = pos
			
			TransitionScene.scene = scene
			print(TransitionScene.scene)
			if is_dead:
				TransitionScene.get_node("AnimationPlayer").play("transition")
			else:
				TransitionScene.get_node("AnimationPlayer").play("transition2")


func player_died():
	playerPos = Vector2(-48,400)
	Player_revived = true
	TransitionScene.label.visible = true
	TransitionScene.scene = "res://Scenes/Woods/woods.tscn"
	TransitionScene.get_node("AnimationPlayer").play("transition")
