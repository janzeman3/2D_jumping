extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		var score = get_meta("Score")
		if score:
			Game.addScore(score)
		queue_free()
