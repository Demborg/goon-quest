extends Sprite

var pos = Vector2(3, 7)
const MAX_HEALTH = 3
var health = MAX_HEALTH

func move():
	$StepPlayer.play()
	var move = randi() % 3
	if move == 0:
		pos.x = clamp(pos.x + 1, 0, 7)
	if move == 1:
		pos.x = clamp(pos.x - 1, 0, 7)
	if move == 2:
		if pos.x in [3, 4] or pos.y > 0:
			pos.y -= 1
	return pos.y < 0

# Called when the node enters the scene tree for the first time.
func take_damage():
	$DamagePlayer.play()
	health -= 1
	return health <= 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = Constants.pixel_possition(pos)
	$Control/ProgressBar.value = 100 * health / MAX_HEALTH
