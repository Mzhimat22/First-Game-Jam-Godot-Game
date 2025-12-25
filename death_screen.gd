extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$rip.play()
	match global.death:
		1:
			$Weeks.text = "The nation has gone bankrupt! \nYou have been removed from office.\n"
		2:
			$Weeks.text = "The people have revolted, and you were overthrown!\n"
		3:
			$Weeks.text = "Crime rates are too high! \nThe nation descends into lawlessness.\n"
		4:
			$Weeks.text = "Global tension is too high! \nYour nation is invaded and you are deposed.\n"

	$Weeks.text = $Weeks.text + "\nTotal days as president: " + str(global.weeks)
	if global.weeks > global.highscore:
		global.highscore = global.weeks
	$Weeks.text = $Weeks.text + "\nHigh score: " + str(global.highscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
