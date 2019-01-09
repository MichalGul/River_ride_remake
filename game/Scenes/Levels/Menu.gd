extends CanvasLayer


func _ready():
	#$AudioStreamPlayer.playing = true
	#BackgroundMusic.playing = true
	pass

func _on_Exit_pressed():
	get_tree().quit()


func _on_NewGame_pressed():
	$AudioStreamPlayer.playing = false
	$CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/NewGame/Click.play()
	Transition.fade_to(Global.Level)
	Global.restart_stats()
	#$AnimationPlayer.play('load_new_level')

func load_new_level():
	Global.restart_stats()
	Transition.fade_to(Global.Level)
	#get_tree().change_scene(Global.Level)
	
func load_credits():
	Transition.fade_to(Global.Credits)
	#get_tree().change_scene(Global.Credits)

func _on_Button_pressed():
	pass # replace with function body


func _on_CreditsButton_pressed():
	$CenterContainer/NinePatchRect/VBoxContainer/CenterContainer3/CreditsButton/Click2.play()
	Transition.fade_to(Global.Credits)
	#$AnimationPlayer.play('load_credits')
