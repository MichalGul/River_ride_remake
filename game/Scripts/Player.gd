extends KinematicBody2D

var motion = Vector2()
export (int) var turn_speed = 1000
export (int) var forward_speed = 80
export (int) var speed_boost = 2
export (float) var slow_down = 0.5
var is_dying = false

#Controls
var right_input
var left_input
var up_input
var down_input
var shoot_input

#Shooting
signal shoot
export (PackedScene) var Bullet
export (float) var fire_rate
var can_shoot = true

var fly_type 

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	Global.Player = self 
	global_position = Global.last_checkpoint_pos
	
	fly_type = Global.fly_speed.normal
	$GunTimer.wait_time = fire_rate


func _process(delta):
	
	update_animation(motion)
	manage_plane_fuel(delta)
	manage_shooting()
	_process_input()
#	print(str(Global.GameState.fuel)) #DEBUG
	
func _physics_process(delta):
	fly()
	if not is_dying:
		move_and_slide(motion)
		
	#Colided with something	
	if get_slide_count() > 0: 
		var collision = get_slide_collision(0)
		proces_border_collision(collision)

#process collision with border
func proces_border_collision(collision):
	if(collision):
		if collision.get_collider().is_in_group("Border") and not is_dying:

			Global.GameState.hurt()
		

func _process_input():
	right_input = Input.is_action_pressed("ui_right")
	left_input = Input.is_action_pressed("ui_left")
	up_input = Input.is_action_pressed("ui_up")
	down_input = Input.is_action_pressed("ui_down")
	shoot_input = Input.is_action_pressed("Shoot")
	
func manage_shooting():
	if not is_dying:
		if shoot_input and can_shoot:
			shoot()

func shoot():
	emit_signal("shoot", Bullet, $Muzzle.global_position, rotation)
	can_shoot = false
	$GunTimer.start()




func fly():
		if left_input and not right_input:
			motion.x = -turn_speed
			#run right
		elif right_input and not left_input:
			motion.x = turn_speed
		else:
			motion.x = 0		
		if up_input: 
			motion.y = -forward_speed * speed_boost
			fly_type = Global.fly_speed.fast
		elif down_input:
			motion.y = -forward_speed * slow_down
			fly_type = Global.fly_speed.slow
		else:
			fly_type = Global.fly_speed.normal
			motion.y = -forward_speed
	
func update_animation(motion):
	$AnimatedSprite.update(motion)


func manage_plane_fuel(delta):
	Global.GameState.manage_fuel(delta, fly_type)
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_GunTimer_timeout():
	can_shoot = true

func die():
	print("DYING RESTART FROM CHECKPOINT")
	restart_player(Global.last_checkpoint_pos)
	
func destroy():
	is_dying = true
	$CollisionShape2D.disabled = true
	#Play animation
	$AnimationPlayer.play("die")
	#play sound 
	$Death.play()
	
func end_game():
	is_dying = true
	$CollisionShape2D.disabled = true
	#Play animation
	$AnimationPlayer.play("die_end_game") #27.11.2018 ADD THIS ANIMATION TO END GAME
	#play sound 
	$Death.play()

func restart_player(position):
	is_dying = false
	$CollisionShape2D.disabled = false
	$AnimationPlayer.play("straight")
	#reposition player to last check_point
	global_position = position
	#save player stats
	Global.GameState.remember_stats()
	Global.restart_level_from_checkpoint()
	#restart level ale gracza w innej pozycji, ale trzeba zapamietac paliwo, punkty i zycia
	
func end():
	Global.GameState.end_game()