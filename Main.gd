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
			
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			click = event.position
		elif click:
			var diff = click - event.position
			
			if diff.length() > 200:
				if abs(diff.x) > 2 * abs(diff.y):
					hero.move()
					if diff.x > 0:
						for goon in goons:
							goon.move_left()
					else: 
						for goon in goons:
							goon.move_right()
					_combat()
				elif abs(diff.y) > 2 * abs(diff.x):
					hero.move()
					if diff.y > 0:
						for goon in goons:
							goon.move_up()
					else: 
						for goon in goons:
							goon.move_down()
					_combat()
			click = Vector2.ZERO

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		hero.move()
		for goon in goons:
			goon.move_up()
		_combat()
	if Input.is_action_just_pressed("ui_down"):
		hero.move()
		for goon in goons:
			goon.move_down()
		_combat()				
	if Input.is_action_just_pressed("ui_left"):
		hero.move()
		for goon in goons:
			goon.move_left()
		_combat()
	if Input.is_action_just_pressed("ui_right"):
		hero.move()
		for goon in goons:
			goon.move_right()
		_combat()
			
	
