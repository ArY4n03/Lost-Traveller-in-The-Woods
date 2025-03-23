extends Control

#[question,option1,option2,correct option number]
var question_sets ={0:["I didn't do anything wrong.\nYou agree with me, right ?","what did you do?","I dont know","no correct"],
					1:["I didn't do anything wrong.\nYou agree with me, right ?","You did nothing wrong","Do you need help?","You did nothing wrong"],
					2:["\n\n\t\tBlue Orb\n\t\tOffer Blue Orb","ok","need a blue orb?","ok"],
					3:["If you value your life\nYou have to get the keys of the cabin in woods\nIf you can claim it from me you will live",
						"OK , I am ready","I am not this shit anymore","OK , I am ready"]}

var cur_question_set = []
@onready var option1Btn = $"HBoxContainer/Option 1"
@onready var option2Btn = $"HBoxContainer/Option 2"
@onready var sprites = [preload("res://Sprites/unknownCharacter.png"),preload("res://Sprites/statue.png")]
func _ready() -> void:
	_assign_question()
	option1Btn.connect("button_up",Callable(self,"on_option_pressed").bind([option1Btn.text]))
	option2Btn.connect("button_up",Callable(self,"on_option_pressed").bind([option2Btn.text]))
	
	if Globals.progress in [0,1]:
		$Sprite2D.texture = sprites[0]
	elif Globals.progress in [2,3]:
		$Sprite2D.texture = sprites[1]
	
	
func _assign_question():
	cur_question_set = question_sets[Globals.progress]
	
	$RichTextLabel.text = cur_question_set[0]
	$"HBoxContainer/Option 1".text = cur_question_set[1]
	$"HBoxContainer/Option 2".text = cur_question_set[2]
	
func on_option_pressed(option)-> void:
	$AudioStreamPlayer2.play()
	if option[0] == cur_question_set[3]:
		if Globals.progress != 3:
			TransitionScene.scene = "res://Scenes/Woods/woods.tscn"
			TransitionScene.get_node("AnimationPlayer").play("transition2")
			Globals.progress += 1
		else:
			get_tree().change_scene_to_file("res://Scenes/MiniGames/statue_mini_game.tscn")
		
	else:
		if Globals.progress == 0:
			Globals.progress += 1
		$RichTextLabel.hide()
		$HBoxContainer.hide()
		$Sprite2D2.hide()
		$AudioStreamPlayer.play()	
		Globals.player_died()
