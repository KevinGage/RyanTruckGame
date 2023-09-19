extends Node

signal score_changed
signal remaining_seconds_changed
signal game_over

var current_score = 0:
	get:
		return current_score
	set(value):
		current_score = value
		score_changed.emit()

var remaining_seconds = 180:
	get:
		return remaining_seconds
	set(value):
		remaining_seconds = value
		remaining_seconds_changed.emit()
		if remaining_seconds <= 0:
			game_over.emit()

var remaining_time:
	get:
		@warning_ignore("integer_division")
		var minutes = (remaining_seconds / 60) % 60
		var seconds = remaining_seconds % 60
		return "%01d:%02d" % [minutes, seconds]
	set(_value):
		pass
