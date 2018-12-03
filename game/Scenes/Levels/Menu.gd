extends Control


func _on_Exit_pressed():
	get_tree().quit()


func _on_NewGame_pressed():
	Global.restart_stats()
	get_tree().change_scene(Global.Level)
