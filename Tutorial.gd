extends Control


func _on_Button_pressed():
	get_tree().change_scene("res://Background.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		_on_Button_pressed()
