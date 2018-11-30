extends Area2D


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _on_Border_body_entered(body):
	if body.is_in_group("Player"):
		Global.GameState.hurt()
