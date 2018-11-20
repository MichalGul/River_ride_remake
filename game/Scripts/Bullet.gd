extends Area2D

export (int) var speed = 500
var velocity = Vector2()


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	position += velocity * delta

func start(pos, dir):
	position = pos
	rotation = dir
	velocity = Vector2(0,-speed).rotated(dir)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Bullet_body_entered(body):
	if body.is_in_group("Fuel"):
		print(body)

func _on_Bullet_area_entered(area):
	if area.is_in_group("Fuel"):
		area.destroy() # begin destroying fuel 
		queue_free() #destroy projectile
	elif area.is_in_group("Enemy"):
		area.destroy() # begin destroying fuel 
		queue_free() #destroy projectile
