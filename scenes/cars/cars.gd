extends Node2D
var scene = preload("res://scenes/cars/car.tscn")

const min_car_x = 50
const max_car_x = 1050
const min_car_y = 50
const max_car_y = 600

# Called when the node enters the scene tree for the first time.
func _ready():
	# spawn first car
	spawn_car()

# Spawns a new car in a random location
func spawn_car():
	print("spawning new car in random location")
	# Create new instance of a car
	var car = scene.instantiate()
	
	# Calculate a random position
	var random_x = randi_range(min_car_x, max_car_x)
	var random_y = randi_range(min_car_y, max_car_y)
	
	car.position = Vector2(random_x, random_y)

	# Add car to scene
	add_child(car)
