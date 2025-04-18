extends Node2D

func _ready() -> void:
	Game.scoreAdded.connect(on_addScore)

func on_addScore():
	$ScoreCounter.text = "%d" % Game.score
	
