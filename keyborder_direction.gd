extends Node2D


func _ready():
	pass


func _on_up_pressed():
	Input.action_press("jump")


func _on_right_pressed():
	Input.action_press("right")


func _on_left_pressed():
	Input.action_press("left")


func _on_up_released():
	Input.action_release("jump")


func _on_right_released():
	Input.action_release("right")


func _on_left_released():
	Input.action_release("left")
