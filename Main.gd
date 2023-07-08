extends Node2D

export var goon_scene: PackedScene
export var hero_scene: PackedScene
export var blood_scene: PackedScene

var goons = []
var hero 

# Called when the node enters the scene tree for the first time.
func _ready():
	hero = hero_scene.instance()
	add_child(hero)
	for i in range(10):
		var goon = goon_scene.instance()
		goons.append(goon)
		add_child(goon)
		
func _combat():
	for goon in goons:
		if goon.pos == hero.pos:
			var blood = blood_scene.instance()
			blood.pos = goon.pos
			remove_child(goon)
			add_child(blood)

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
			
	
