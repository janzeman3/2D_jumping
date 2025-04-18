extends Area2D

class_name Melon

func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		Game.addScore(50)
		queue_free()
