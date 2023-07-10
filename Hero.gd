extends Sprite

var pos = Vector2(3, 7)
const MAX_HEALTH = 3
var health = MAX_HEALTH
var next_move = null

func _compute_move():
	if pos.y == 0:
		if pos.x in [3, 4]:
			return Constants.Move.UP
		elif pos.x < 3.5:
			return Constants.Move.RIGHT
		else:
			return Constants.Move.LEFT
	return [Constants.Move.LEFT, Constants.Move.UP, Constants.Move.RIGHT][randi() % 3]
		

func move():
	$StepPlayer.play()
	match next_move:
		Constants.Move.RIGHT:
			pos.x = clamp(pos.x + 1, 0, 7)
		Constants.Move.LEFT:
			pos.x = clamp(pos.x - 1, 0, 7)
		Constants.Move.UP:
			pos.y -= 1
	next_move = _compute_move()
	return pos.y < 0
	
func _ready():
	next_move = _compute_move()
		
# Called when the node enters the scene tree for the first time.
func take_damage():
	$DamagePlayer.play()
	health -= 1
	return health <= 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match next_move:
		Constants.Move.UP:
			$Polygon2D.rotation = 0
		Constants.Move.LEFT:
			$Polygon2D.rotation = -PI / 2
		Constants.Move.RIGHT:
			$Polygon2D.rotation = PI / 2
	position = Constants.pixel_possition(pos)
	$Control/ProgressBar.value = 100 * health / MAX_HEALTH
