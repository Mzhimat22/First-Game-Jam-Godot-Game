extends Node2D
var debt_number = 0b110000
var dis = 0b110000
var crime = 0b110000
var globe = 0b110000
var prev

var character

var option

var days
var daylimit
var daysinthreat
var threat1 = false
var threat2 = false
var threat3 = false
var threat4 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	daylimit=7
	if Menumusic:
		Menumusic.get_node("menusong").stop()
	prev = 0
	$hovertext1.visible = false
	$hovertext2.visible = false
	$GlitchBackground.hide()
	$music.play()
	$Debt.max_value = 0b11111111
	$Debt.min_value = 0b00000000
	$Disapproval.max_value = 0b11111111
	$Disapproval.min_value = 0b00000000
	$Crime.max_value = 0b11111111
	$Crime.min_value = 0b00000000
	$GlobalTension.max_value = 0b11111111
	$GlobalTension.min_value = 0b00000000
	randomly_picked_question()
	days = 1 
	$option_1.hide()
	$option_2.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Debt.value = debt_number
	$Disapproval.value = dis
	$Crime.value = crime
	$GlobalTension.value = globe
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
	if debt_number > 0b10000000:
		threat1 = true
		$Threatdays.show()
		$Debt.tint_progress = Color.RED
	else:
		threat1 = false
		$Debt.tint_progress = Color.GREEN
	
	if dis > 0b10000000:
		threat2 = true
		$Threatdays.show()
		$Disapproval.tint_progress = Color.RED
		
	else:
		threat2 = false
		$Disapproval.tint_progress = Color.GREEN
		

	if crime > 0b10000000:
		threat3 = true
		$Threatdays.show()
		$Crime.tint_progress = Color.RED
	else:
		threat3 = false
		$Crime.tint_progress = Color.GREEN
	
	if globe > 0b10000000:
		threat4 = true
		$Threatdays.show()
		$GlobalTension.tint_progress = Color.RED
		
	else:
		threat4 = false
		$GlobalTension.tint_progress = Color.GREEN
		
		
	if daysinthreat == 0:
		if debt_number > 0b10000000:
			global.death = 1
			global.weeks = days - 1
			$TextBox.hide()
			await get_tree().create_timer(1).timeout
			get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
		elif dis > 0b10000000:
			global.death = 2
			global.weeks = days - 1 
			$TextBox.hide()
			await get_tree().create_timer(1).timeout
			get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
		elif crime > 0b10000000:
			global.death = 3
			global.weeks = days - 1
			$TextBox.hide()
			await get_tree().create_timer(1).timeout
			get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
		elif globe > 0b10000000:
			global.death = 4
			global.weeks = days - 1
			$TextBox.hide()
			await get_tree().create_timer(1).timeout
			get_tree().change_scene_to_file("res://scenes/death_screen.tscn")

	
	if not (threat1 or threat2 or threat3 or threat4):
		$Threatdays.hide()
		daysinthreat = daylimit
	$DaysnWeeks.text = "Day: " + str(days) 
	$Threatdays.text = "\nDays before Loss: " + str(daysinthreat)
	
	if days > 20:
		daylimit = 6
	elif days > 30:
		daylimit = 5
	elif days > 35:
		daylimit = 4
	elif days > 40:
		daylimit = 3
#end of proccess

#Questions!!!
func randomly_picked_question():
	option = randi_range(1,35)
	var meetrand = randi_range(1,200)
	if meetrand == 69:
		option = 999
	while option == prev:
		option = randi_range(1,35)
	prev = option
	#option = 40 #testing
	match option:
		999:
			character = 999
			$Illuminati.slide()
			$TextBox.text = "You have done well so far.\n Allow us to support you."
			$option_1.text = "Uhhhh, sure?"
			$option_2.text = "I don't need your help"
			$hovertext1.text = "You have chosen well."
			$hovertext2.text = "It's not negotiable."
		1:
			character = 1
			$TransportMinister.slide()
			$TextBox.text = "Mr. President! Our citizens demand high speed rail. \nDo we build another line?"
			$option_1.text = "I like trains!!"
			$option_2.text = "Nah"
			$hovertext1.text = "Increases Debt"
			$hovertext2.text = "Increases Disapproval Rate and Crime"
		2:
			character = 2
			$HealthMinister.slide()
			$TextBox.text = "Mr. President! Our citizens demand better healthcare. \nDo we increase the health budget?"
			$option_1.text = "Yes Healthcare!!"
			$option_2.text = "What am I, a comminust?"
			$hovertext1.text = "Increases Debt"
			$hovertext2.text = "Increases Disapproval Rate and Crime"
		3:
			character = 2
			$HealthMinister.slide()
			$TextBox.text = "Mr. President! A new virus has appeared, \ndo we increase the funding of the Department of Health?"
			$option_1.text = "Yes, we must fight this new virus"
			$option_2.text = "No, this is a Syntaxian conspiracy!"
			$hovertext1.text = "Increases Debt"
			$hovertext2.text = "Increases Disapproval Rate, Crime, and Global Tension"
		4:
			character = 3
			$Reporter.slide()
			$TextBox.text = "Mr. President! Do you have anything to say to your citizens?"
			$option_1.text = "I love you all and appreciate your support"
			$option_2.text = "You're all stupid subjects, just obey me!"
			$hovertext1.text = "Increases Crime"
			$hovertext2.text = "Increases Disapproval Rate, Crime, and Global Tension"
		5:
			character = 4
			$Police.slide()
			$TextBox.text = "Mr. President! We're dealing with a huge crime wave! \nDo we increase police funding?"
			$option_1.text = "Yes, I shall provide you with it"
			$option_2.text = "It's okay, what's wrong with some crime?"
			$hovertext1.text = "Increases Debt and Global Tension"
			$hovertext2.text = "Increases Disapproval Rate and Crime"
		6:
			character = 5
			$SoState.slide()
			$TextBox.text = "Mr. President! Neighboring Syntaxia is amassing \ntroops along the border \nDo we respond in kind?"
			$option_1.text = "They will regret threatining our great nation"
			$option_2.text = "It's probably some military exerices, no need to worry"
			$hovertext1.text = "Increases Debt and Global Tension"
			$hovertext2.text = "Increases Disapproval Rate and Crime"
		7:
			character = 3
			$Reporter.slide()
			$TextBox.text = "Mr. President! Famous podcaster Roe Jogan was shot! \nWhat do you have to say?"
			$option_1.text = "We will honor him with a military funeral"
			$option_2.text = "Who cares?"
			$hovertext1.text = "Increases Debt and Dissaproval Rate"
			$hovertext2.text = "Increases Crime and Global Tension"
		8:
			character = 5
			$SoState.slide()
			$TextBox.text = "Mr. President! We recived a gift of dead rats from\nthe president of Syntaxia.\nHow do we respond?"
			$option_1.text = "Send back a gift of sweets with the note: 'Dignitaries gift what they eat'"
			$option_2.text = "Lets ignore their transgressions for now"
			$hovertext1.text = "Increases Global Tension"
			$hovertext2.text = "Increases Disapproval Rate"
		9:
			character = 6
			$Clown.slide()
			$TextBox.text = "Round and round we go, this nation randomly will be so!"
			$option_1.text = "Huh?"
			$option_2.text = "What?"
			$hovertext1.text = "How did this clown slip past security?"
			$hovertext2.text = "How did this clown slip past security?"
		10:
			character = 1
			$TransportMinister.slide()
			$TextBox.text = "Mr. President! Our roads are getting old!\nWhat shall we do?"
			$option_1.text = "Increase road funding"
			$option_2.text = "Add a car tax to decrease car usage"
			$hovertext1.text = "Increases Debt"
			$hovertext2.text = "Increases Disapproval Rate"
		11:
			character = 4
			$Police.slide()
			$TextBox.text = "Mr. President! Teenage hooligans are patrolling the streets!\nWhat shall we do?"
			$option_1.text = "Implement a curfew to keep them in check"
			$option_2.text = "Leave them be"
			$hovertext1.text = "Increases Disapproval Rate"
			$hovertext2.text = "Increases Crime"
		12:
			character = 4
			$Police.slide()
			$TextBox.text = "Mr. President! We caught a wanted criminal from Syntaxia!\nWhat shall we do with them?"
			$option_1.text = "Give them back to Syntaxia"
			$option_2.text = "We will grant them amnesty"
			$hovertext1.text = "Increases Disapproval Rate"
			$hovertext2.text = "Increases Global Tension"
		13:
			character = 7
			$Secret.slide()
			$TextBox.text = "Mr. President. \nShall we conduct spy operations against Syntaxia?"
			$option_1.text = "Yes, go ahead and gather intelligence"
			$option_2.text = "No, we don't want to risk being caught"
			$hovertext1.text = "Increases Debt and Global Tension"
			$hovertext2.text = "Increases Disapproval Rate and Crime"
		14:
			character = 5
			$SoState.slide()
			$TextBox.text = "Mr. President!\nThe UN has asked for our support in peacekeeping.\nDo we provide troops?"
			$option_1.text = "Yes, we shall be there to help"
			$option_2.text = "No, we have our own issues to worry about"
			$hovertext1.text = "Increases Debt and Disapproval Rate"
			$hovertext2.text = "Increases Crime and Global Tension"
		15:
			character = 7
			$Secret.slide()
			$TextBox.text = "Mr. President.\nWe have caught Syntaxian spies in our borders.\nWhat shall we do with them?"
			$option_1.text = "Interrogate them harshly"
			$option_2.text = "Let them go, we don't want to land into any trouble"
			$hovertext1.text = "Increases Debt and Global Tension"
			$hovertext2.text = "Increases Disapproval Rate and Crime"
		16:
			character = 5
			$SoState.slide()
			$TextBox.text = "\nMr. President!\nSyntaxia is demanding we stop \nillegal immigrants coming into their nation.\nWhat shall we do?"
			$option_1.text = "Fortify the border even more"
			$option_2.text = "Why should we support them arresting our citizens?"
			$hovertext1.text = "Increases Debt"
			$hovertext2.text = "Increases Disapproval Rate, Crime, and Global Tension"
		17:
			character = 5
			$SoState.slide()
			$TextBox.text = "Mr. President!\nWe are getting an influx of Syntaxian illegal immigrants.\nWhat shall we do?"
			$option_1.text = "Fortify the border and stop them"
			$option_2.text = "Let them be"
			$hovertext1.text = "Increases Debt and Global Tension"
			$hovertext2.text = "Increases Disapproval Rate and Crime"
		18:
			character = 5
			$SoState.slide()
			$TextBox.text = "Mr. President!\nRuntimeland is asking for more help in their civil war.\nWhat shall we do?"
			$option_1.text = "Send them more weapons, we must support them against the rebels"
			$option_2.text = "We have our own issues to worry about at the moment"
			$hovertext1.text = "Increases Debt and Disapproval Rate"
			$hovertext2.text = "Increases Global Tension"
		19:
			character = 4
			$Police.slide()
			$TextBox.text = "Mr. President!\nWe arrested a bunch of insurgents from\nthe Underflow Liberation Front.\nWhat shall we do with them?"
			$option_1.text = "Execute them publicly, make them an example"
			$option_2.text = "Arrest them, no need to be harsher than necessary"
			$hovertext1.text = "Increases Disapproval Rate"
			$hovertext2.text = "Increases Crime and Global Tension"
		20:
			character = 2
			$HealthMinister.slide()
			$TextBox.text = "\n\nMr. President!\nA Syntaxian scientist has made breakthroughs \nin curing cancer!\nSome of our scientists are suggesting \nwe supprt their research.\nShall we?"
			$option_1.text = "Of course! Global health comes before geopolitical rivalries"
			$option_2.text = "Hold up, let me call the head of Secret Services...."
			$hovertext1.text = "Increases Debt"
			$hovertext2.text = "Increases Global Tension"
		21:
			character = 8
			$Kitty.slide()
			$TextBox.text = "Meow!\nMeow meow meow!\nMeow!"
			$option_1.text = "Pet the kitty"
			$option_2.text = "Don't pet the kitty"
			$hovertext1.text = "Aww"
			$hovertext2.text = "What's wrong with you??"
		22:
			character = 3
			$Reporter.slide()
			$TextBox.text = "Mr. President!\nWill you try to make peace with\nthe Underflow Liberation Front?"
			$option_1.text = "Yes, this conflict has gone on for too long"
			$option_2.text = "No, we don't negotiate with terrorists"
			$hovertext1.text = "Increases Disapproval Rate"
			$hovertext2.text = "Increases Global Tension and Crime"
		23:
			character = 6
			$Clown.slide()
			$TextBox.text = "Flip a coin, what will it be?\nWitness my trickery and you shall see!"
			$option_1.text = "Uhh, heads?"
			$option_2.text = "Uhh, tails?"
			$hovertext1.text = "50/50 chance to have all rates in the red or not"
			$hovertext2.text = "50/50 chance to have all rates in the red or not"
		24:
			character = 9
			$Pirate.slide()
			$TextBox.text = "Yarr Matey President! Me parrot be hungry.\nIt needs ye booty!"
			$option_1.text = "Sure, here's some cash"
			$option_2.text = "Why does your parrot need so much food?"
			$hovertext1.text = "Increases Debt"
			$hovertext2.text = "Increases Crime"
		25:
			character = 3
			$Reporter.slide()
			$TextBox.text = "Mr. President! \nRuntimeland has been struck with a devestating attack.\nDo you believe they have a right to defend themselves?"
			$option_1.text = "Yes, another 20 trillion to Runtimeland"
			$option_2.text = "Why should we care?"
			$hovertext1.text = "Increases Debt and Disapproval rate"
			$hovertext2.text = "Increases Global Tension"
		26:
			character = 9
			$Pirate.slide()
			$TextBox.text = "Yarr Matey President!\nMe need some booty and thought ye ports are fine rich\nPrepare for ye to be pillaged!"
			$option_1.text = "You shall face the might of our navy!"
			$option_2.text = "How about we strike a truce?"
			$hovertext1.text = "Increases Debt and Global Tension"
			$hovertext2.text = "Increases Crime and Disapproval Rate"
		27:
			character = 3
			$Reporter.slide()
			$TextBox.text = "Mr. President!\nSome of our citizens believe we're hiding \nevidence of aliens.\nWhat do you have to say?"
			$option_1.text = "That's absurd, aliens don't exist"
			$option_2.text = "Well, I do have some declassified information to share....."
			$hovertext1.text = "Increases Disapproval rate"
			$hovertext2.text = "Increases Global Tension"
		28:
			character = 3
			$Reporter.slide()
			$TextBox.text = "Mr. President!\nDo you believe the dress is black and blue,\nor gold and white?"
			$option_1.text = "Black and blue, obviously"
			$option_2.text = "Gold and white, obviously"
			$hovertext1.text = "Increases Global Tension"
			$hovertext2.text = "Increases Disapproval Rate and Global Tension"
		29:
			character = 1
			$TransportMinister.slide()
			$TextBox.text = "Mr. President! Climate change is becoming a big issue.\nShould we increase carbon taxes?"
			$option_1.text = "Yes, we need to combat climate change, even if it makes a few mad"
			$option_2.text = "No, climate change is fake!"
			$hovertext1.text = "Increases Disapproval Rate"
			$hovertext2.text = "Increases Debt, Disapproval Rate, and Global Tension"
		30:
			character = 4
			$Police.slide()
			$TextBox.text = "Mr. President! We have reports of an impending attack\nby the Underflow Liberation Front.\nWhat shall we do?"
			$option_1.text = "Stop that attack by any means necessary!"
			$option_2.text = "Actually, we could use more public support against them..."
			$hovertext1.text = "Increases Debt and Disapproval Rate"
			$hovertext2.text = "Increases Crime and Global Tension"
		31:
			character = 4
			$Police.slide()
			$TextBox.text = "Mr. President! We have reports of a new drug\nbeing sold on the black market\nWhat shall we do?"
			$option_1.text = "I will provide law enforcement with more funds to combat drugs"
			$option_2.text = "We must impose stricter control over the citizens to find who's selling it"
			$hovertext1.text = "Increases Debt and Crime"
			$hovertext2.text = "Increases Disapproval Rate and Crime"
		32:
			character = 7
			$Secret.slide()
			$TextBox.text = "Mr. President.\nAn explosion occured at one of our military factories.\nHow should we break the news?"
			$option_1.text = "We must be honest that the cause was our own negligence"
			$option_2.text = "Blame the Underflow Liberation Front, this is an opportunity to mobilize the public"
			$hovertext1.text = "Increases Disapproval Rate"
			$hovertext2.text = "Increases Crime and Global Tension"
		33:
			character = 3
			$Reporter.slide()
			$TextBox.text = "Mr. President!\nWhat are your plans to deal with unemployment?"
			$option_1.text = "We will provide the unemployed with more benefits"
			$option_2.text = "We will subsidize companies for hiring more people"
			$hovertext1.text = "Increases Debt and Crime"
			$hovertext2.text = "Increases Debt and Disapproval Rate"
		34:
			character = 2
			$HealthMinister.slide()
			$TextBox.text = "Mr. President!\nWe have a shortage of doctors!\nHow do we deal with it?"
			$option_1.text = "Subsizide medical schools so we get more doctors"
			$option_2.text = "What we just, like, forced people to be doctors?"
			$hovertext1.text = "Increases Debt"
			$hovertext2.text = "Increases Debt and Disapproval Rate"
		35:
			character = 9
			$Pirate.slide()
			$TextBox.text = "Yarr Matey President! \nMe jolly crew needs some rest. May we use ye ports?"
			$option_1.text = "Of course! Go ahead, matey!"
			$option_2.text = "Yo ho ho, out of my office you go!"
			$hovertext1.text = "Increases Disapproval Rate"
			$hovertext2.text = "Increases Crime"
		36:
			character = 5
			$SoState.slide()
			$TextBox.text = "Mr. President!\nSyntaxia hit us with tariffs!\nHow do we respond?"
			$option_1.text = "Hit them back with more tariffs!"
			$option_2.text = "There's nothing to do, no need to escalate"
			$hovertext1.text = "Increases Debt and Global Tension"
			$hovertext2.text = "Increases Debt and Disapproval Rate"
		37:
			character = 2
			$HealthMinister.slide()
			$TextBox.text = "Mr. President!\nThere's been a disease outbreak in one of our cities!\nHow do we respond?"
			$option_1.text = "Shut down all entrances and exits to the city!"
			$option_2.text = "Let's leave"
			$hovertext1.text = "Increases Debt, Disapproval Rate, and Global Tension"
			$hovertext2.text = "Increases Disapproval Rate, Crime, and Global Tension"
		38:
			character = 3
			$Reporter.slide()
			$TextBox.text = "Mr. President!\nThe opposition party has released a scathing attack ad!\nHow do you respond?"
			$option_1.text = "We will arrest leaders of the opposition who approved that slanderous ad!"
			$option_2.text = "Freedom of speech is an important part of our country, so I won't respond"
			$hovertext1.text = "Increases Disapproval Rate and Global Tension"
			$hovertext2.text = "Increases Disapproval Rate"
		39:
			character = 9
			$Pirate.slide()
			$TextBox.text = "Yarr Matey President!\nMe join this game jam and me need some help.\nMay ye spare some support?"
			$option_1.text = "Sure, i'll provide you with some funds!"
			$option_2.text = "Nah, game dev is lame, get a real job"
			$hovertext1.text = "Increases Debt"
			$hovertext2.text = "Increases Disapproval Rate (and this game dev's disapproval too....)"
		40:
			character = 2
			$HealthMinister.slide()
			$TextBox.text = "Mr. President! You seem sick.\nDo you need some rest?"
			$option_1.text = "Yes, I might need a rest..."
			$option_2.text = "No, I must appear strong to my citizens!"
			$hovertext1.text = "Increases Global Tension"
			$hovertext2.text = "Increases Disapproval Rate"
		
		
	await get_tree().create_timer(1).timeout
	$option_1.show()
	$option_2.show()

func _on_option_1_pressed():
	match option:
		999:
			debt_number = 0b11
			dis = 0b11
			crime = 0b11
			globe = 0b11
		1:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		2:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		3:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		4:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11000)
			globe = overflow_operations(globe + 0b11)
		5:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11000)
		6:
			debt_number = overflow_operations(debt_number + 0b100000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		7:
			debt_number = overflow_operations(debt_number + 0b111100)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		8:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		9:
			var rand1 = randi_range(3,128)
			var rand2 = randi_range(3,128)
			var rand3 = randi_range(3,128)
			var rand4 = randi_range(3,128)
			debt_number = overflow_operations(debt_number + rand1)
			dis = overflow_operations(dis + rand2)
			crime = overflow_operations(crime + rand3)
			globe = overflow_operations(globe + rand4)
		10:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		11:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1111000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		12:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1100000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		13:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1100000)
		14:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b1000100)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		15:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		16:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		17:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		18:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		19:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		20:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		21:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		22:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		23:
			var rand23 = randi_range(1,2)
			if rand23==1:
				debt_number = 0b1000000
				dis = 0b1000000
				crime = 0b1000000
				globe = 0b1000000
			else:
				debt_number = 0b11000000
				dis = 0b11000000
				crime = 0b11000000
				globe = 0b11000000
		24:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		25:
			debt_number = overflow_operations(debt_number + 0b1111000)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		26:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		27:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		28:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		29:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b111110)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		30:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b111110)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		31:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b11)
		32:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		33:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b11)
		34:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		35:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		36:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		37:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		38:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1100000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		39:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		40:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
			
	days += 1
	if threat1 or threat2 or threat3 or threat4:
		daysinthreat -= 1
	$option_1.hide()
	$option_2.hide()
	slide_back()
	await get_tree().create_timer(1).timeout
	randomly_picked_question()

func _on_option_2_pressed():
	match option:
		999:
			debt_number = 0b11
			dis = 0b11
			crime = 0b11
			globe = 0b11
		1:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b110000)
			crime = overflow_operations(crime + 0b11000)
			globe = overflow_operations(globe + 0b11)
		2:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b110000)
			crime = overflow_operations(crime + 0b11000)
			globe = overflow_operations(globe + 0b11)
		3:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b110)
			crime = overflow_operations(crime + 0b110000)
			globe = overflow_operations(globe + 0b110000)
		4:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1111100)
			crime = overflow_operations(crime + 0b11000)
			globe = overflow_operations(globe + 0b11000)
		5:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b100000)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b11)
		6:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b100000)
			crime = overflow_operations(crime + 0b11000)
			globe = overflow_operations(globe + 0b11)
		7:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b11000)
		8:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b111110)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		9:
			var rand1 = randi_range(3,128)
			var rand2 = randi_range(3,128)
			var rand3 = randi_range(3,128)
			var rand4 = randi_range(3,128)
			debt_number = overflow_operations(debt_number + rand1)
			dis = overflow_operations(dis + rand2)
			crime = overflow_operations(crime + rand3)
			globe = overflow_operations(globe + rand4)
		10:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		11:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b11)
		12:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		13:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b11)
		14:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b111100)
			globe = overflow_operations(globe + 0b1000000)
		15:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b11)
		16:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b1000000)
		17:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1100000)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b11)
		18:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		19:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b1000000)
		20:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		21:
			debt_number = overflow_operations(debt_number + 0b1100000)
			dis = overflow_operations(dis + 0b1100000)
			crime = overflow_operations(crime + 0b1100000)
			globe = overflow_operations(globe + 0b1100000)
		22:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b111100)
			globe = overflow_operations(globe + 0b1000000)
		23:
			var rand23 = randi_range(1,2)
			if rand23==1:
				debt_number = 0b1000000
				dis = 0b1000000
				crime = 0b1000000
				globe = 0b1000000
			else:
				debt_number = 0b11000000
				dis = 0b11000000
				crime = 0b11000000
				globe = 0b11000000
		24:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b11)
		25:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		26:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b11)
		27:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		28:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1100000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1100000)
		29:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b1000000)
		30:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b1000000)
		31:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b11)
		32:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b1000000)
		33:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		34:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		35:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b11)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b11)
		36:
			debt_number = overflow_operations(debt_number + 0b1000000)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		37:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b1000000)
			globe = overflow_operations(globe + 0b1000000)
		38:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		39:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
		40:
			debt_number = overflow_operations(debt_number + 0b11)
			dis = overflow_operations(dis + 0b1000000)
			crime = overflow_operations(crime + 0b11)
			globe = overflow_operations(globe + 0b11)
			
	days += 1
	if threat1 or threat2 or threat3 or threat4:
		daysinthreat -= 1
	$option_1.hide()
	$option_2.hide()
	slide_back()
	await get_tree().create_timer(1).timeout
	randomly_picked_question()


#Overflow!!!
func overflow_operations(n):
	if n > 0b11111111:
		$Overflow.play()
		$GlitchBackground.show()
		$glitch_timer.start()
		$option_1.hide()
		$option_2.hide()
	n = n & 0b11111111  # Keeps the lower 32 bits and gets rid of carry over bits simulating overflow
	return n
	
#sprite slide back
func slide_back():
	match character:
		999:
			$Illuminati.slideback()
			global.count999 += 1
		1:
			$TransportMinister.slideback()
			global.count1 += 1
		2:
			$HealthMinister.slideback()
			global.count2 += 1
		3:
			$Reporter.slideback()
			global.count3 += 1
		4:
			$Police.slideback()
			global.count4 += 1
		5:
			$SoState.slideback()
			global.count5 += 1
		6:
			$Clown.slideback()
			global.count6 += 1
		7:
			$Secret.slideback()
			global.count7 += 1
		8:
			$Kitty.slideback()
			global.count8 += 1
		9:
			$Pirate.slideback()
			global.count9 += 1




func _on_glitch_timer_timeout():
	$GlitchBackground.hide()


func _on_option_1_mouse_entered():
	$hovertext1.visible = true


func _on_option_2_mouse_entered():
	$hovertext2.visible = true


func _on_option_1_mouse_exited():
	$hovertext1.visible = false


func _on_option_2_mouse_exited():
	$hovertext2.visible = false
