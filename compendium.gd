extends Node2D

var question = preload("res://assets/Who_.png")
var texture1 = preload("res://assets/Health(1).png")
var texture2 = preload("res://assets/Bella(1).png")
var texture3 = preload("res://assets/Reporter(1).png")
var texture4 = preload("res://assets/Police(1).png")
var texture5 = preload("res://assets/State(1).png")
var texture6 = preload("res://assets/Clown.png")
var texture7 = preload("res://assets/State(2).png")
var texture8 = preload("res://assets/Cat.png")
var texture9 = preload("res://assets/Pirate.png")
var texture999 = preload("res://assets/Cat(1).png")

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.count1 == 0:
		$TransportMinister.texture = question
		$Minister1Name.text = "???????"
	else:
		$TransportMinister.texture = texture1
		$Minister1Name.text = "Jack T. Rain\nMinister of Transport\nNumber of times met: " + str(global.count1)
	if global.count2 == 0:
		$HealthMinister.texture = question
		$Minister1Name2.text = "???????"
	else:
		$HealthMinister.texture = texture2
		$Minister1Name2.text = "Bella M. Edicine\nMinister of Health\nNumber of times met: " + str(global.count2)
	if global.count3 == 0:
		$Reporter.texture = question
		$Minister1Name3.text = "???????"
	else:
		$Reporter.texture = texture3
		$Minister1Name3.text = "Yusuf S. Coop\nReporter\nNumber of times met: " + str(global.count3)
	if global.count4 == 0:
		$Police.texture = question
		$Minister1Name4.text = "???????"
	else:
		$Police.texture = texture4
		$Minister1Name4.text = "Aya A. Rest\nHead of the Police\nNumber of times met: " + str(global.count4)
	if global.count5 == 0:
		$SoState.texture = question
		$Minister1Name5.text = "???????"
	else:
		$SoState.texture = texture5
		$Minister1Name5.text = "Mishima D. Iplomat\nSecratary of State\nNumber of times met: " + str(global.count5)
	if global.count6 == 0:
		$Clown.texture = question
		$Minister1Name6.text = "???????"
	else:
		$Clown.texture = texture6
		$Minister1Name6.text = "Rozo Dozo\nClown of Randomness\nNumber of times met: " + str(global.count6)
	if global.count7 == 0:
		$Secret.texture = question
		$Minister1Name7.text = "???????"
	else:
		$Secret.texture = texture7
		$Minister1Name7.text = "Raj A. Gent\nHead of Secret Services\nNumber of times met: " + str(global.count7)
	if global.count8 == 0:
		$Kitty.texture = question
		$Minister1Name8.text = "???????"
	else:
		$Kitty.texture = texture8
		$Minister1Name8.text = "Mittens\nCat\nNumber of times met: " + str(global.count8)
	if global.count9 == 0:
		$Pirate.texture = question
		$Minister1Name10.text = "???????"
	else:
		$Pirate.texture = texture9
		$Minister1Name10.text = "Jonsey Greybeard\nPirate\nNumber of times met: " + str(global.count9)
	if global.count999 == 0:
		$Illuminati.texture = question
		$Minister1Name9.text = "???????"
	else:
		$Illuminati.texture = texture999
		$Minister1Name9.text = "Mysterious Man\nHead of the Illuminati\nNumber of times met: " + str(global.count999)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
