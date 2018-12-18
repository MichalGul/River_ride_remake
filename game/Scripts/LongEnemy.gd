extends "res://Scripts/Enemy.gd"

func _ready():
	if move_right:
		#$AnimatedSprite.play("move_right")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
		
	


func _on_LongEnemy_area_entered(area):
	if area.is_in_group("Border"):
		stop_moving()
		
