extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	Global.GUI = self

func update_GUI(fuel, lives, points):
	$TextureRect/VBoxContainer/Fuel.text = str(fuel)
	$TextureRect/VBoxContainer/Lives.text = str(lives)
	$TextureRect/VBoxContainer/Points.text = str(points)
