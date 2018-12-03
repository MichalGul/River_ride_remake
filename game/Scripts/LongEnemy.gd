extends "res://Scripts/Enemy.gd"

func _ready():
	pass


func _on_LongEnemy_area_entered(area):
	if area.is_in_group("Border"):
		stop_moving()
