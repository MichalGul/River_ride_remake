extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

	#tank player
func _on_Fuel_body_entered(body):
	if body.is_in_group("Player"):
		Global.GameState.is_tanking = true
		$AudioStreamPlayer.play()

	
	#end tanking
func _on_Fuel_body_exited(body):
	Global.GameState.is_tanking = false
	$AudioStreamPlayer.stop()
	
	#TODO add sound and animation to fuel explosion
func destroy():
	#Play animation
	$AnimationPlayer.play("die")
	#play sound 
	#remove from scene
		#must be called in animation player
	
func die():
	queue_free()