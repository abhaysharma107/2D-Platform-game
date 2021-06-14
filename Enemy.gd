extends KinematicBody2D

signal score

var speed = 50
var velocity = Vector2(0,0)
export var direction = -1
export var detect_clils = true

func _ready():
	if direction ==1:
		$AnimatedSprite.flip_h = true
	$FloorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$FloorChecker.enabled = detect_clils
	if detect_clils:
			set_modulate(Color(1.2,0.5,1))
	
func _physics_process(delta):
	if is_on_wall() or not $FloorChecker.is_colliding() and detect_clils and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$FloorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
		
	velocity.y+= 20
	velocity.x = speed * direction
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_top_checker_body_entered(body):
	emit_signal("score")
	$AnimatedSprite.play("squeshed")
	$top_checker/Hit.play()
	speed = 0
	set_collision_layer_bit(4, false)
	set_collision_mask_bit(0, false)
	$top_checker.set_collision_mask_bit(4, false)
	$top_checker.set_collision_mask_bit(0, false)
	$sides_checker.set_collision_layer_bit(4, false)
	$sides_checker.set_collision_mask_bit(0, false)
	$Timer.start()
	body.bounce()


func _on_sides_checker_body_entered(body):
	body.ouch(position.x)


func _on_Timer_timeout():
	queue_free()
