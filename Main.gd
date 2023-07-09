extends Node2D

export var goon_scene: PackedScene
export var hero_scene: PackedScene
export var blood_scene: PackedScene

var goons = []
var hero 
var click = null


# Called when the node enters the scene tree for the first time.
func _ready():
	hero = hero_scene.instance()
	add_child(hero)
	for i in range(10):
		var goon = goon_scene.instance()
		goons.append(goon)
		add_child(goon)
		
func _kill(goon):
	var blood = blood_scene.instance()
	blood.pos = goon.pos
	remove_child(goon)
	goons.erase(goon)
	add_child(blood)
		
func _combat():
	for goon in goons:
		if goon.pos == hero.pos:
			_kill(goon)
		for other in goons:
			if (goon != other) and (goon.pos == other.pos):
				_kill(goon)
				
func _play_turn(dir):
	for goon in goons:
		goon.move(dir)
	_combat()
	hero.move()
	_combat()
			
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			click = event.position
		elif click:
			var diff = click - event.position
			
			if diff.length() > 200:
				if abs(diff.x) > 2 * abs(diff.y):
					if diff.x > 0:
						_play_turn(Constants.Move.LEFT)
					else: 
						_play_turn(Constants.Move.Right)
				elif abs(diff.y) > 2 * abs(diff.x):
					if diff.y > 0:
						_play_turn(Constants.Move.UP)
					else: 
						_play_turn(Constants.Move.DOWN)
			click = Vector2.ZERO

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		_play_turn(Constants.Move.UP)
	if Input.is_action_just_pressed("ui_down"):
		_play_turn(Constants.Move.DOWN)			
	if Input.is_action_just_pressed("ui_left"):
		_play_turn(Constants.Move.LEFT)
	if Input.is_action_just_pressed("ui_right"):
		_play_turn(Constants.Move.RIGHT)
			
	
