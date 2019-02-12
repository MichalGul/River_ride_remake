extends Area2D

export var next_level_number = 3

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _on_EndGamePoint_body_entered(body):
	Global.game_over()
	Transition.fade_to(Global.Victory)
