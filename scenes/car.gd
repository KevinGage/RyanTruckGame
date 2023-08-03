extends Area2D

func _on_body_entered(_body):
	$Sprite2D.rotation_degrees = 180
	if $Timer.is_stopped():
		$Timer.start()
		print("crash!")


func _on_timer_timeout():
	print("despawn!")
	$"..".spawn_car()
	queue_free()
