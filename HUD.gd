extends CanvasLayer

var coins = 0
var health = 3
var time = 500
var score_value = 0

func _ready():
	$Coins.text = String(coins)
	$Health.text = String(health)
	$total_time.text = String(time)
	$scoer_value.text = String(score_value)

func _physics_process(delta):
	if coins == 100:
		health += 1
		coins = 0
	time -= 2.5*delta
	$total_time.text = String(int(time))
	#yield(get_tree().create_timer(100),"timeout")
	if time <=0:
		print("time")
		get_tree().change_scene("res://Title_Menu.tscn")


func _on_coin_collected():
	coins += 1
	$Coins.text = String(coins)
	score_value += 10
	$scoer_value.text = String(score_value)


func _on_Jonny_health_value():
	
	health -=1
	$Health.text = String(health)
	if health == -1:
		print("health")
		get_tree().change_scene("res://Title_Menu.tscn")


#	time -= 1
#	yield(get_tree().create_timer(0.4),"timeout")
#	if time == 0:
#		get_tree().change_scene("res://Title_Menu.tscn")
#	_ready()

func _on_Enemy_score():
	score_value += 20
	$scoer_value.text = String(score_value)


func _on_Jonny_time_value():
	time = 500


func _on_Heart_health_added():
	health += 1
	$Health.text = String(health)
