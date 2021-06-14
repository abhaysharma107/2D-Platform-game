extends Area2D

signal health_added

func _on_Heart_body_entered(body):
	$AudioStreamPlayer.play()
	emit_signal("health_added")
	yield(get_tree().create_timer(0.33),"timeout")
	queue_free()
