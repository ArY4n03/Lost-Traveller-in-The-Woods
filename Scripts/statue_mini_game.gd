extends Node2D


@onready var arrow = preload("res://Scenes/others/arrow.tscn")
var score = 0

func _spawn(x,y):
	var arrow_inst = arrow.instantiate()
	arrow_inst.global_position = Vector2(x,y)
	$"Arrow Container".add_child(arrow_inst)

func _on_timer_timeout() -> void:
	randomize()
	_spawn(randi_range(300,818),randi_range(-100,-50))

func _process(delta: float) -> void:
	if score >= 15:
		$AnimationPlayer.play("gameOver")

func change_scene():
	TransitionScene.scene = "res://Scenes/Woods/woods.tscn"
	if score >= 15:
		TransitionScene.get_node("AnimationPlayer").play("transition2")
		Globals.progress += 1
		Globals.has_key = true
	else:
		Globals.has_key = false
		Globals.has_blueOrb = false
		Globals.player_died()
