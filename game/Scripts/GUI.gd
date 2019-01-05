extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	Global.GUI = self

func update_GUI(fuel, lives, points):
	$TextureRect/Fuel.value= fuel
	$TextureRect/Center/HBoxContainer/Lives.text = str(lives)
	$TextureRect/CenterContainer/Points.text = str(points)
