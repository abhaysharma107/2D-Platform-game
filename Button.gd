extends TouchScreenButton

signal resume

func _ready():
	pass


func _on_Resume_released():
	$Click.play()
	emit_signal("resume")
