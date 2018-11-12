extends AnimatedSprite


func update(motion):
	if motion.x < 0:
		play("left")
	elif motion.x > 0:
		play("right")
	else:
		play("straight")


