extends Area2D

signal car_crushed(car)

func _on_body_entered(_body):
	car_crushed.emit(self)

func get_shape() -> Shape2D:
	return $CollisionShape2D.shape
