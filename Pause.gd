extends Control



func _on_Button_resume():
	get_tree().paused = false
	visible = not visible


