extends KinematicBody2D

var motion = Vector2()
export var turn_speed = 1000
export var basic_speed = 80
export var speed_boost = 2
export var slow_down = 0.5

#Controls
var right_input
var left_input
var up_input
var down_input

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	Global.Player = self 


func _process(delta):
	
	#Procces user input
	right_input = Input.is_action_pressed("ui_right")
	left_input = Input.is_action_pressed("ui_left")
	up_input = Input.is_action_pressed("ui_up")
	down_input = Input.is_action_pressed("ui_down")
	
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
#	motion = motion.normalized() * SPEED
	if up_input: 
		motion.y = -basic_speed * speed_boost
	elif down_input:
		motion.y = -basic_speed * slow_down
	else:
		motion.y = -basic_speed
	
	
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
