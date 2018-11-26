extends Control



func _on_TextureButton_pressed():
	Global.restart_stats()
	get_tree().change_scene(Global.Level)
