extends Area2D

export (int) var units_to_move = 100
#speed simple speed multiplier
export (int) var jet_speed = 200
export (bool) var move_right = false
export (int) var score = 1000


#destination place in world
var destination = Vector2()
var saw_player = false

#reposition  velocity
var repos_velo = Vector2()
var repos = Vector2()	

func init(move_r, pos):
	#determine moving direction nnd position
	move_right = move_r	
	global_position = pos

	
func move(delta):
	if move_right:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite/Particles2D.rotation_degrees = 90
		global_position.x += jet_speed * delta
	else:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite/Particles2D.rotation_degrees = 270
		global_position.x -= jet_speed * delta



func _ready():
	pass


func _process(delta):
	check_if_saw_player()
	if not saw_player:
		move(delta)
				
func check_if_saw_player():
	if $RayCast2D.is_colliding():
		saw_player = true	
	
func destroy():
	$CollisionShape2D.disabled = true
	$AnimatedSprite/Particles2D.emitting = false
	#Play animation
	$AnimationPlayer.play("die")
	#play sound 
	$Death.play()
	
func die():
	queue_free()	

func _on_JetEnemy_body_entered(body):
	if body.is_in_group("Player"):
		destroy()
		Global.GameState.hurt()
		
func on_Enemy_area_entered(area):
	pass
