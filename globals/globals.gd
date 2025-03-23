extends Node

var progress = 0
var playerPos = Vector2(44,200)
var Player_revived = false
var has_key = false
var has_blueOrb = false
var death_count = 0
func  change_scene(area,scene,pos,is_dead):
	if len(area.get_overlapping_bodies()) > 0:
		if Input.is_action_just_pressed("interact"):
			playerPos = pos
			
			TransitionScene.scene = scene
			if is_dead:
				TransitionScene.get_node("AnimationPlayer").play("transition")
			else:
				TransitionScene.get_node("AnimationPlayer").play("transition2")


func player_died():
	death_count += 1
	playerPos = Vector2(44,200)
	Player_revived = true
	TransitionScene.label.visible = true
	TransitionScene.scene = "res://Scenes/Woods/woods.tscn"
	TransitionScene.get_node("AnimationPlayer").play("transition")
