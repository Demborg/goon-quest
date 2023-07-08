extends Sprite
const SIZE = 42
const OFFSET = Vector2(95, 216)

var pos = Vector2(randi() % 7, randi() % 7)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func move_right():
	pos.x = clamp(pos.x + 1, 0, 7)
	
func move_left():
	pos.x = clamp(pos.x - 1, 0, 7)
	
func move_down():
	pos.y = clamp(pos.y + 1, 0, 7)
	
func move_up():
	pos.y = clamp(pos.y - 1, 0, 7)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = pos * SIZE + OFFSET
