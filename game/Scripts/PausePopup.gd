extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var pause_game = true

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
		
func _input(event):
	if Input.is_action_pressed("Pause"):
		if pause_game:
			get_tree().paused = true
			$CanvasLayer/Popup.popup_centered()
			pause_game = false
		else:
			get_tree().paused = false
			$CanvasLayer/Popup.hide()
			pause_game = true
