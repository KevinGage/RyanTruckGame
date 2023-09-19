extends Timer


func _on_timeout():
	Globals.remaining_seconds -= 1
