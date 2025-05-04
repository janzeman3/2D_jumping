extends CharacterBody2D

class_name Character

# rychlostp ohybu doleva/doprava
var speed = 150
var gravitation = 10
var jump = 400
var isOn = true

func _physics_process(_delta: float) -> void:
	if isOn:
		# jumping and falling (vertical move)
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = - jump
			$AnimatedSprite2D.play("jump")
		elif not is_on_floor():
			velocity.y += gravitation
			if velocity.y < 0:
				$AnimatedSprite2D.play("jump")
			else:
				$AnimatedSprite2D.play("fall")

		# runing or horizontal flying (horizontal move)
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * speed
			if is_on_floor():
				$AnimatedSprite2D.play("run")
			$AnimatedSprite2D.flip_h = (direction<0)
		else:
			velocity.x = 0
			if is_on_floor():
				$AnimatedSprite2D.play("idle")
 
		move_and_slide()
