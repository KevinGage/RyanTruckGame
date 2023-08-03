extends Area2D

signal car_timer_timeout

func _on_body_entered(_body):
	$Sprite2D.rotation_degrees = 180
	if $Timer.is_stopped():
		$Timer.start()
		print("crash!")


func _on_timer_timeout():
	car_timer_timeout.emit()
	#$"..".spawn_car()
	
	print("despawn!")
	queue_free()
