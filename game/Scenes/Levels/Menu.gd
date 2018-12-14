extends Control


func _ready():
	$AudioStreamPlayer.playing = true

func _on_Exit_pressed():
	get_tree().quit()


func _on_NewGame_pressed():
	$AudioStreamPlayer.playing = false
	$NewGame/Click.play()
	$AnimationPlayer.play('load_new_level')

func load_new_level():
	Global.restart_stats()
	get_tree().change_scene(Global.Level)