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
		idx += 1
	
	if not found_fruit:
		print("EndChecker: Game Over!")
		Game.all_fruit_taken = true
		gameOver()

func gameStart():
	$GameMenu.visible = false
	$Time.start()
	Game.restart()
	$EndCheck.start()
	#$VirtualGuy.isOn = true

func gameOver():
	$Time.stop()
	$EndCheck.stop()
	#$VirtualGuy.isOn = false
	move_child($GameMenu, -1)
	$GameMenu.visible = true
	$"GameMenu/YourTime".text = $TimeCounter.text
	if Game.all_fruit_taken:
		$"GameMenu/YourTimeLabel".text = "You succeeded in time: "
	else:
		$"GameMenu/YourTimeLabel".text = "Game interupted in time: "

func _on_time_timeout() -> void:
	var allSeconds = int((Time.get_ticks_msec()-Game.time_start)/1000)
	var minutes = int(allSeconds / 60)
	var seconds = allSeconds % 60
	$TimeCounter.text = "%02d:%02d" % [minutes,seconds]

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_again_button_pressed() -> void:
	gameStart()
	get_tree().change_scene_to_file("res://main_screen.tscn")
