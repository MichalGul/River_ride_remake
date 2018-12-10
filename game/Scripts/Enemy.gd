extends Area2D

export (int) var units_to_move = 100
#speed simple speed multiplier
export (int) var speed = 1
export (bool) var move_right = false
export (int) var score = 1000

#destination place in world
var destination = Vector2()
var saw_player = false
var blocked = false
#reposition  velocity
var repos_velo = Vector2()
var repos = Vector2()	


func move(delta):
	
	if global_position.x != destination.x:
		repos.x = destination.x - global_position.x
		repos_velo.x = repos.x * delta * speed
		global_position.x += repos_velo.x


func _ready():
	if move_right:
		$AnimatedSprite.flip_h = false
		destination.x = global_position.x + units_to_move
	else:
		$AnimatedSprite.flip_h = true
		destination.x = global_position.x - units_to_move
	destination.y = global_position.y


func _process(delta):
	check_if_saw_player()
	if saw_player and not blocked:
		move(delta)
				
func check_if_saw_player():
	if $RayCast2D.is_colliding():
		saw_player = true	
	
func destroy():
	$CollisionShape2D.disabled = true
	#Play animation
	$AnimationPlayer.play("die")
	#play sound 
	$Death.play()
	#remove from scene
	
func die():
	queue_free()	

func _on_Enemy_body_entered(body):
	if body.is_in_group("Player"):
		destroy()
		Global.GameState.hurt()
	if body.is_in_group("Border"):
		stop_moving()
		
func stop_moving():
	blocked = true
	

func _on_Enemy_area_entered(area):
	if area.is_in_group("Border"):
		stop_moving()


func _on_LongEnemy_area_entered(area):
	if area.is_in_group("Border"):
		stop_moving()


func _on_Enemy_area_shape_entered(area_id, area, area_shape, self_shape):
	print(area_id)
