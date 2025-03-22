extends Area2D

var motion = Vector2()
func _physics_process(delta: float) -> void:
	motion.y = 550 * delta
	
	translate(motion)
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	find_parent("StatueMiniGame").score += 1


func _on_body_entered(body: Node2D) -> void:
	find_parent("StatueMiniGame").get_node("AnimationPlayer").play("gameOver")
