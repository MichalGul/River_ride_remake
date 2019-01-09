extends Node2D


func _ready():
	BackgroundMusic.playing = true

func init():
	$CanvasLayer/Popup.popup()
	

func _on_NewGameButton_pressed():
	Global.restart_stats()
	get_tree().paused = false
	$CanvasLayer/CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/NewGameButton/Click.play()
	Transition.fade_to(Global.Level)
	#et_tree().change_scene(Global.Level)

func _on_MenuButton_pressed():
	get_tree().paused = false
	#print("HALOOO")
	$CanvasLayer/CenterContainer/NinePatchRect/VBoxContainer/CenterContainer3/MenuButton/Click.play()
	Transition.fade_to(Global.SplashScreen)
	#get_tree().change_scene(Global.SplashScreen)

func _on_Exit_pressed():
	get_tree().paused = false
	get_tree().quit()
