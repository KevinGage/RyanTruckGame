extends Node2D
var car_scene = preload("res://scenes/cars/car.tscn")

const min_car_x = 100
const max_car_x = 1110
const min_car_y = 100
const max_car_y = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	# spawn first car
	spawn_car()

# Spawns a new car in a random location
func spawn_car():
	print("spawning new car in random location")
	# Create new instance of a car
	var car = car_scene.instantiate()
	
	# Calculate a random position
	var random_x = randi_range(min_car_x, max_car_x)
	var random_y = randi_range(min_car_y, max_car_y)
	
	car.position = Vector2(random_x, random_y)
	
	# connect car signal to function
	car.connect("car_timer_timeout", _on_car_timer_timeout)

	# Add car to scene
	add_child(car)

func _on_car_timer_timeout():
	spawn_car()
	
