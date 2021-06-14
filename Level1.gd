extends Node2D


func _physics_process(delta):
	if Input.is_action_pressed("esc"):
		$HUD/Pause.show()
		get_tree().paused = true 


func _on_Stop_pressed():
	$HUD/Pause.show()
	get_tree().paused = true 

