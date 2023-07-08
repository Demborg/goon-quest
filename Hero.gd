extends Sprite
const SIZE = 42
const OFFSET = Vector2(95, 216)

var pos = Vector2(3, 7)

func move():
	var move = randi() % 3
	if move == 0:
		pos.x = clamp(pos.x + 1, 0, 7)
	if move == 1:
		pos.x = clamp(pos.x - 1, 0, 7)
	if move == 2:
		if pos.x in [3, 4] or pos.y > 0:
			pos.y -= 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = pos * SIZE + OFFSET

