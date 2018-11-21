extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	Global.GUI = self

func update_GUI(fuel, lives, points):
	$VBoxContainer/Fuel.text = str(fuel)
	$VBoxContainer/Lives.text = str(lives)
	$VBoxContainer/Points.text = str(points)
