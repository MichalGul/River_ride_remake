extends Node

#Global script to hold reference to game objects - avoid string referencing

var GameState
var Player
var GUI

#Deternime fly type, consider moving to gameState
enum fly_speed{
  normal,
  fast,
  slow
}

var SplashScreen = ""
var Level = "res://Scenes/Levels/Level.tscn"
var GameOver = "res://Scenes/Levels/GameOver.tscn"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	print(fly_speed.normal)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
