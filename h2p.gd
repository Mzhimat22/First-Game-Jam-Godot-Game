extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Menumusic:
		if not Menumusic.get_node("menusong").playing:
			Menumusic.get_node("menusong").play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
