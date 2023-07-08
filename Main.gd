extends Node2D

export var goon_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(10):
		var goon = goon_scene.instance()
		add_child(goon)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
