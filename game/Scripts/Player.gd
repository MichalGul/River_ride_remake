extends KinematicBody2D

var motion = Vector2()
export (int) var turn_speed = 1000
export (int) var forward_speed = 80
export (int) var speed_boost = 2
export (float) var slow_down = 0.5

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
	move_and_slide(motion)

func _process_input():
	right_input = Input.is_action_pressed("ui_right")
	left_input = Input.is_action_pressed("ui_left")
	up_input = Input.is_action_pressed("ui_up")
	down_input = Input.is_action_pressed("ui_down")
	shoot_input = Input.is_action_pressed("Shoot")
	
func manage_shooting():
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
