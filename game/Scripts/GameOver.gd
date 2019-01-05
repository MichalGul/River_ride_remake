extends Node2D




func init():
	$CanvasLayer/Popup.popup()

func _on_NewGameButton_pressed():
	Global.restart_stats()
	get_tree().paused = false
	get_tree().change_scene(Global.Level)

func _on_MenuButton_pressed():
	get_tree().paused = false
	print("HALOOO")
	get_tree().change_scene(Global.SplashScreen)

func _on_Exit_pressed():
	get_tree().paused = false
	get_tree().quit()
