extends Area2D

export (int) var score = 2000

func _ready():
	get_parent().get_node("AnimationPlayer").play("Scout")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		destroy()
		Global.GameState.hurt()
		
		
func destroy():
	#Play animation
	get_parent().get_node("AnimationPlayer").play("die")
	#play sound 
	#remove from scene
	#must be called in animation player
func die():
	queue_free()