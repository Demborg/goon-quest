extends Sprite
const SIZE = 42
const OFFSET = Vector2(95, 216)

var pos = Vector2(randi() % 7, randi() % 7)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		pos.x = clamp(pos.x + 1, 0, 7)
	if Input.is_action_just_pressed("ui_left"):
		pos.x = clamp(pos.x - 1, 0, 7)
	if Input.is_action_just_pressed("ui_down"):
		pos.y = clamp(pos.y + 1, 0, 7)
	if Input.is_action_just_pressed("ui_up"):
		pos.y = clamp(pos.y - 1, 0, 7)
	position = pos * SIZE + OFFSET


func _on_Area2D_area_entered(area):
	print("I am dead")


func _on_Area2D_body_entered(body):
	print("test")


func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
 print("aaaaa")
