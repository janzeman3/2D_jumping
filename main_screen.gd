extends Node2D

func _ready() -> void:
	Game.scoreAdded.connect(on_addScore)
	gameStart()

func on_addScore():
	$ScoreCounter.text = "%d" % Game.score

func _on_end_check_timeout() -> void:
	var child_number = get_child_count()
	var idx = 0
	var found_fruit = false
	
	while not found_fruit and idx < child_number:
		if get_child(idx) is Fruit:
			found_fruit = true
			print("EndChecker:" + get_child(idx).name + " found")
		idx += 1
	
	if not found_fruit:
		print("EndChecker: Game Over!")
		gameOver()

func gameStart():
	$EndCheck.start()

func gameOver():
	$EndCheck.stop()
