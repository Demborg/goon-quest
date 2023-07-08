extends Polygon2D
const SIZE = 42
const OFFSET = Vector2(95, 216)

var pos = Vector2(3, 7)

func _ready():
	rotation = randf() * 360

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = pos * SIZE + OFFSET
