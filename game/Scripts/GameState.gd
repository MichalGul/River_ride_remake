extends Node2D

export (int) var starting_lives = 3
export (int) var max_lives = 9
export (int) var starting_fuel = 100
export (int) var fuel_extinction_param = 2 #fuel drop per second
export (int) var fuel_tank_speed = 20 #unit fuel unit per second
export (int) var points_life_counter = 10000 #How many points needs to be gain in order to gain life
export (int) var jet_spawn_timer = 2

export (PackedScene) var JetEnemy

var lives
var fuel 
var current_score = 0
var is_tanking = false

onready var GUI = Global.GUI
var screen_size_x 
var screen_size_y


func _ready():
	Global.GameState = self
	lives = starting_lives
	fuel = starting_fuel
	$JetSpawnerTimer.wait_time = jet_spawn_timer
	$JetSpawnerTimer.autostart = true
	
	screen_size_x = get_viewport().size.x
	screen_size_y = get_viewport().size.y
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
func _process(delta):
	update_GUI()

func manage_fuel(delta, fly_speed):
#	print(fly_speed) DEBUG
	if fly_speed == Global.fly_speed.normal:
		fuel -= fuel_extinction_param * delta
	elif fly_speed == Global.fly_speed.fast:
		fuel -= fuel_extinction_param * delta * 2 
	elif fly_speed == Global.fly_speed.slow:
		fuel -= fuel_extinction_param * delta * 0.5
	tank_fuel(delta)
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
		
	
func tank_fuel(delta):
	if is_tanking:
		fuel += fuel_tank_speed *delta

		
func update_GUI():
	GUI.update_GUI(int(fuel), lives, current_score)
		
func end_game():
	get_tree().change_scene(Global.GameOver)

func _on_Player_shoot(bullet, pos, dir):
	var projectile = bullet.instance()
	projectile.start(pos, dir)
	add_child(projectile)
	
func update_score(amount):
	current_score += amount
	var life_up_point = (current_score % points_life_counter ) == 0
	if life_up_point and lives < max_lives:
		life_up()
		
	
func life_up():
	lives += 1
	update_GUI()
	
func spawn_jet():
#	#Acces palyer position
	var player_pos = Global.Player.global_position
	var spawn_pos = Vector2()
	spawn_pos.y = Global.Player.global_position.y - screen_size_y
	#randomly chose side 0 or one
	var side = pick_random_side()
	if side:
		spawn_pos.x = Global.Player.global_position.x - screen_size_x
	else:
		spawn_pos.x = Global.Player.global_position.x + screen_size_x
		
	var jet_enemy = JetEnemy.instance()
	$Enemies.add_child(jet_enemy)
	jet_enemy.init(side, spawn_pos)

func _on_JetSpawnerTimer_timeout():
	spawn_jet()
	
func pick_random_side():
	randomize()
	var rand_num = round(rand_range(1,11))
	if rand_num >5:
		return true
	else:
		return false
	
	