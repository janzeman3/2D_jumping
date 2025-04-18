extends Node


signal scoreAdded

var score = 0

func addScore(value):
	score += value
	print("Score:" + str(score))
	emit_signal("scoreAdded")

func restart():
	score = 0
