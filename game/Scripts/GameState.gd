extends Node2D

export var starting_lives = 3
export var max_lives = 9
export var starting_fuel = 100
export var fuel_extinction_param = 2 #fuel drop per second
export var points_life_counter = 10000 #How many points needs to be gain in order to gain life
var lives
var points = 0
var fuel 

onready var GUI = Global.GUI

func _ready():
	Global.GameState = self
	lives = starting_lives
	fuel = starting_fuel
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
func _process(delta):
	update_GUI()

func manage_fuel(delta, fly_speed):
	print(fly_speed)
	if fly_speed == Global.fly_speed.normal:
		fuel -= fuel_extinction_param * delta
	elif fly_speed == Global.fly_speed.fast:
		fuel -= fuel_extinction_param * delta * 2 
	elif fly_speed == Global.fly_speed.slow:
		fuel -= fuel_extinction_param * delta * 0.5
	check_for_empty()
	
func check_for_empty():
	if fuel <= 0:
		end_game()
		
func hurt():
	lives -= 1
	if lives < 0:
		end_game()
	else:
		print("Death, restart from checkpoint") #restart from last checkpoint
		
func update_GUI():
	GUI.update_GUI(int(fuel), lives)
		
func end_game():
	get_tree().change_scene(Global.GameOver)