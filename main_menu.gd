extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Menumusic:
		if not Menumusic.get_node("menusong").playing:
			Menumusic.get_node("menusong").play()
	$Label3.text = "Highscore: " + str(global.highscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/office.tscn")


func _on_h_2p_button_pressed():
	get_tree().change_scene_to_file("res://scenes/how_2_play.tscn")


func _on_character_compendium_pressed():
	get_tree().change_scene_to_file("res://scenes/character_compendium.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
