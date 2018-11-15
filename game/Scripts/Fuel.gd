extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
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
	elif body.is_in_group("Projectile"):
		print(body)
		#Play destroy animation
		destroy()
#	#play tanking sound
	
	

	#end tanking
func _on_Fuel_body_exited(body):
	Global.GameState.is_tanking = false
	$AudioStreamPlayer.stop()
	
func destroy():
	#Play animation
	#play sound 
	#remove from scene
	queue_free()	#must be called in animation player