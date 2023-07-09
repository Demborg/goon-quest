extends Polygon2D

var pos = Vector2(3, 7)

func _ready():
	rotation = randf() * 360

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = Constants.pixel_possition(pos)
