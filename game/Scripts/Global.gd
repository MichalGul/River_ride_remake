extends Node


var BEGIN_X_POS = 0# 467.815796
var BEGIN_Y_POS = 600# 545.357483

#Global script to hold reference to game objects - avoid string referencing
var GameState
var Player
var GUI


#Starting values of the stats
var last_points = 0
var last_lives = 3

#references to current level
var currentLevel


#remember last checkpoint initial value is defined from the top
var last_checkpoint_pos = Vector2(BEGIN_X_POS, BEGIN_Y_POS)
var begin_position = Vector2(BEGIN_X_POS, BEGIN_Y_POS)
#Deternime fly type, consider moving to gameState
enum fly_speed{
  normal,
  fast,
  slow
}

var SplashScreen = ""
var Level = "res://Scenes/Levels/Level_1.tscn"
var Level_2 = "res://Scenes/Levels/Level_2.tscn"
var Level_3 ="" 
var GameOver = "res://Scenes/Levels/GameOver.tscn"
var Bullet = "res://Scenes/Bullet.tscn"
var Menu = "res://Scenes/Levels/Menu.tscn"


func _ready():
	currentLevel = Level

func restart_stats():
	last_points = 0
	last_lives = 3
	last_checkpoint_pos = Vector2(BEGIN_X_POS, BEGIN_Y_POS)
	
	
func restart_level_from_checkpoint():
	get_tree().change_scene(currentLevel)


func load_level_scene():
	get_tree().change_scene(currentLevel)
	
#Global funkction to change scene between levels
func change_level(level):
	currentLevel = level

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
