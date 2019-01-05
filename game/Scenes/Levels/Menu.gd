extends CanvasLayer


func _ready():
	$AudioStreamPlayer.playing = true

func _on_Exit_pressed():
	get_tree().quit()


func _on_NewGame_pressed():
	$AudioStreamPlayer.playing = false
	$CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/NewGame/Click.play()
	$AnimationPlayer.play('load_new_level')

func load_new_level():
	Global.restart_stats()
	get_tree().change_scene(Global.Level)
	
func load_credits():
	get_tree().change_scene(Global.Credits)

func _on_Button_pressed():
	pass # replace with function body


func _on_CreditsButton_pressed():
	$CenterContainer/NinePatchRect/VBoxContainer/CenterContainer3/CreditsButton/Click2.play()
	$AnimationPlayer.play('load_credits')
