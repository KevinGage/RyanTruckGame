extends CanvasLayer

@onready var score_label: Label = $MarginContainer/ScoreContainer/HBoxContainer/Score
@onready var time_label: Label = $MarginContainer/TimeContainer/HBoxContainer/Time


func _ready():
	Globals.connect("score_changed", update_score_text)
	Globals.connect("remaining_seconds_changed", update_time_text)
	update_score_text()
	update_time_text()

func update_score_text():
	score_label.text = str(Globals.current_score)


func update_time_text():
	time_label.text = str(Globals.remaining_time)
