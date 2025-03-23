extends Node2D

var turns_left = 15
var can_roll = true
# Called when the node enters the scene tree for the first time.
@onready var images = {1:preload("res://Sprites/dice (1).png"),
					   2:preload("res://Sprites/dice (2).png"),
					   3:preload("res://Sprites/dice (3).png"),
					   4:preload("res://Sprites/dice (4).png"),
					   5:preload("res://Sprites/dice (5).png"),
					   6:preload("res://Sprites/dice (6).png")}
					
func _ready() -> void:
	TransitionScene.find_child("TextureRect").visible = false
	
func move_blueOrb(distance):
	if distance != -1:
		$Label.text = "Move " + str(distance) + " steps forward"
	else:
		$Label.text = "Move 1 steps backward"
	var tween = get_tree().create_tween()
	tween.tween_property($"Blue orb","global_position:x",$"Blue orb".global_position.x + (32*distance),2.0)
	print(distance)
	tween.connect("finished",Callable(self,"tween_finished"))

func roll_dice():
	if can_roll:
		randomize()
		var number = randi_range(1,6)
		can_roll = false
		$dice.texture = images[number]
		if number < 6:
			move_blueOrb(number)
		else:
			move_blueOrb(-1)
		
		
func tween_finished():
	turns_left -= 1
	can_roll = true
	TransitionScene.scene = "res://Scenes/Woods/woods.tscn"
	_update_turnsLabel()
	if $"Blue orb".global_position.x > 760:
		TransitionScene.find_child("TextureRect").visible = true
		TransitionScene.get_node("AnimationPlayer").play("transition2")
		Globals.has_blueOrb = true
	if turns_left <0:
		TransitionScene.find_child("TextureRect").visible = true
		Globals.player_died()

func _update_turnsLabel():
	$Label2.text = "Turns : " + str(turns_left)
		
	
