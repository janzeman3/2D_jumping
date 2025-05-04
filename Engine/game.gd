extends Node


signal scoreAdded

var score = 0
var time_start = 0
var all_fruit_taken = false

func addScore(value):
	score += value
	print("Score:" + str(score))
	emit_signal("scoreAdded")

func restart():
	score = 0
	all_fruit_taken = false
	time_start = Time.get_ticks_msec()
