extends TouchScreenButton

signal stop_press

func _physics_process(delta):
	emit_signal("stop_press")
