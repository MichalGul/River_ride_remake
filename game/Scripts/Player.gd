extends KinematicBody2D

var motion = Vector2()
export var turn_speed = 1000
export var forward_speed = 80
export var speed_boost = 2
export var slow_down = 0.5

#Controls
var right_input
var left_input
var up_input
var down_input

var fly_type 

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	Global.Player = self 
	fly_type = Global.fly_speed.normal


func _process(delta):
	
	#Procces user input
	right_input = Input.is_action_pressed("ui_right")
	left_input = Input.is_action_pressed("ui_left")
	up_input = Input.is_action_pressed("ui_up")
	down_input = Input.is_action_pressed("ui_down")
	
	update_animation(motion)
	manage_plane_fuel(delta)
	print(str(Global.GameState.fuel)) #DEBUG
	
func _physics_process(delta):
	fly()
	move_and_slide(motion)

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
