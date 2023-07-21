extends Sprite

signal win

export var blood_scene: PackedScene

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
	return [
		Constants.Move.LEFT,
		Constants.Move.UP,
		Constants.Move.UP,
		Constants.Move.RIGHT,
		Constants.Move.ATTACK,
		Constants.Move.ATTACK
	][randi() % 6]
		

func move():
	$StepPlayer.play()
	var kill_zone = []
	match next_move:
		Constants.Move.RIGHT:
			pos.x = clamp(pos.x + 1, 0, 7)
			kill_zone = [pos]
		Constants.Move.LEFT:
			pos.x = clamp(pos.x - 1, 0, 7)
			kill_zone = [pos]
		Constants.Move.UP:
			pos.y -= 1
			kill_zone = [pos]
		Constants.Move.ATTACK:
			$SwordAnimation.play()
			$Attack.play()
			kill_zone = [pos + Vector2(1, -1), pos + Vector2(0, -1), pos + Vector2(-1, -1)]
	if pos.y < 0:
		emit_signal("win")
			 
	next_move = _compute_move()
	return kill_zone
	
func _ready():
	next_move = _compute_move()
		
# Called when the node enters the scene tree for the first time.
func take_damage():
	$DamagePlayer.play()
	health -= 1
	var blood = blood_scene.instance()
	blood.pos = pos
	blood.color = Color(0, 0, 1, 0.37)
	get_parent().add_child(blood)
	return health <= 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Polygon2D.show()
	$AttackBox.hide()
	match next_move:
		Constants.Move.UP:
			$Polygon2D.rotation = 0
		Constants.Move.LEFT:
			$Polygon2D.rotation = -PI / 2
		Constants.Move.RIGHT:
			$Polygon2D.rotation = PI / 2
		Constants.Move.ATTACK:
			$Polygon2D.hide()
			$AttackBox.show()
	position = Constants.pixel_possition(pos)
	$Control/ProgressBar.value = 100 * health / MAX_HEALTH
