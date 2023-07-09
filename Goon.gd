extends Sprite

var pos = Vector2(randi() % 7, randi() % 7)

func move(dir):
	match dir:
		Constants.Move.RIGHT:
			pos.x = clamp(pos.x + 1, 0, 7)
		Constants.Move.LEFT:
			pos.x = clamp(pos.x - 1, 0, 7)
		Constants.Move.DOWN:
			pos.y = clamp(pos.y + 1, 0, 7)
		Constants.Move.UP:
			pos.y = clamp(pos.y - 1, 0, 7)
		Constants.Move.ATTACK:
			$AttackPlayer.play()
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = Constants.pixel_possition(pos)
