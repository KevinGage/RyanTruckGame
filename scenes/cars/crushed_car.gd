extends Area2D

func _ready():
	$GPUParticles2D.restart()

func _on_timer_timeout():
	queue_free()
