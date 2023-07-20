extends AnimatedSprite

func _process(delta):
	if frame == 5:
		stop()
		frame = 0

