extends CharacterBody2D


const SPEED = 150.0
var dir = Vector2();
var mouse_pos = null;
var dis = 0
var can_play_audio = true
var dialogues = {0:"So this is\nthat wood",1:"statue",2:"Was that statue\nthere all along",
				 3:"Blue Orb!!!",4:"Finally Got \nThe Key"}

func _ready():
	print(Globals.progress)
	if Globals.Player_revived:
		Globals.Player_revived = false
		_show_dialog("Aah Shit!!!\nHere we go \nagain")
	else:
		_show_dialog(dialogues[Globals.progress])
		
@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	dir = Vector2()
	if Input.is_action_pressed("move_to"):
		mouse_pos = get_global_mouse_position()
		dis = sqrt( pow((mouse_pos.x - global_position.x),2) + pow((mouse_pos.y - global_position.y),2))
		if round(dis) > 50:
			dir = (mouse_pos - global_position).normalized()
			$AnimationPlayer.play("run")
			_play_audio()
		else:
			dir = Vector2()
	else:
		$AnimationPlayer.play("idle")
	velocity = Vector2(SPEED,SPEED) * dir
	reset_position()
	move_and_slide()


func _show_dialog(dialogue):
	$"dialogue box/Label".text = dialogue
	$"dialogue box".show()
	$DialogueTimer.start()
	

func _on_dialogue_timer_timeout() -> void:
	$"dialogue box".hide()
	
func reset_position():
	if global_position.x > 2100:
		global_position.x = -350
	elif global_position.x < -350:
		global_position.x = 1990

func _play_audio():
	if can_play_audio:
		$AudioStreamPlayer2D.play()
		can_play_audio = false

func _on_audio_stream_player_2d_finished() -> void:
	can_play_audio = true
