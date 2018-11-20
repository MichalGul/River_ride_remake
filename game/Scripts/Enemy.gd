extends Area2D

export (int) var units_to_move = 100
#speed simple speed multiplier
export (int) var speed = 1
export (bool) var move_right = false

#destination place in world
var destination = Vector2()
var saw_player = false
#reposition  velocity
var repos_velo = Vector2()
var repos = Vector2()	



func move(delta):
	
	if not(global_position.x == destination.x):
		repos.x = destination.x - global_position.x
		repos_velo.x = repos.x * delta * speed
		global_position.x += repos_velo.x


func _ready():
	if move_right:
		destination.x = global_position.x + units_to_move
	else:
		destination.x = global_position.x - units_to_move
	destination.y = global_position.y


func _process(delta):
	check_if_saw_player()
	if saw_player:
		move(delta)
				
func check_if_saw_player():
	if $RayCast2D.is_colliding():
		saw_player = true	
	
func destroy():
	#Play animation
	#play sound 
	#remove from scene
	queue_free()	#must be called in animation player


func _on_Enemy_body_entered(body):
	if body.is_in_group("Player"):
		destroy()
		Global.GameState.hurt()
		
