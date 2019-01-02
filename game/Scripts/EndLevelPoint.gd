extends Area2D

export var next_level_number = 2

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_EndScenePoint_body_entered(body):
	if body.is_in_group("Player"):
		Global.GameState.remember_stats()
		Global.change_level(Global.Level_2)
		Global.load_level_scene()
		