extends Area2D

#export (int) var units_to_move = 100
#speed simple speed multiplier
export (int) var jet_speed = 200
export (bool) var move_right = false
export (int) var score = 1000
export (int) var raycast_launch_angle = 60

#destination place in world
var destination = Vector2()
var saw_player_stop = false
var saw_player_start = false

#reposition  velocity
var repos_velo = Vector2()
var repos = Vector2()	


	
func move(delta):
	if move_right:
		$AnimatedSprite.flip_h = false
		raycast_launch_angle =- raycast_launch_angle
		$AnimatedSprite/Particles2D.rotation_degrees = 90
		global_position.x += jet_speed * delta
	else:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite/Particles2D.rotation_degrees = 270
		global_position.x -= jet_speed * delta



func _ready():
	if move_right:
		$AnimatedSprite.flip_h = true
		$RayCastMove.rotation_degrees = -raycast_launch_angle
	else:
		$AnimatedSprite.flip_h = false
		$RayCastMove.rotation_degrees = raycast_launch_angle

func _process(delta):
	check_if_saw_player_to_stop()
	check_if_saw_player_to_move()
	if saw_player_start:
		if not saw_player_stop:
			move(delta)
				
func check_if_saw_player_to_stop():
	if $RayCastStop.is_colliding():
		saw_player_stop = true	
		
		
#check if player was detected to start moving
func check_if_saw_player_to_move():
	if $RayCastMove.is_colliding():
		saw_player_start = true
		#Pomysł dodać dźwięk I seeee you 
		#print("WIDZEEEEEEEE GRACZA")

	
func destroy():
	$CollisionShape2D.disabled = true
	$AnimatedSprite/Particles2D.emitting = false
	#Play animation
	$AnimationPlayer.play("die")
	#play sound 
	$Death.play()
	
func die():
	queue_free()	

func _on_JetEnemy_body_entered(body):
	if body.is_in_group("Player"):
		destroy()
		Global.GameState.hurt()
		
func on_Enemy_area_entered(area):
	pass
