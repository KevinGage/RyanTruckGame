extends Node2D
var car_scene = preload("res://scenes/cars/car.tscn")

const min_car_x = 100
const max_car_x = 1050
const min_car_y = 100
const max_car_y = 500

const min_dist = 150
var player

var spawned_cars = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# get player for spawn collision detection
	player = $"../Player1"

	# spawn first cars
	for i in range(3):
		spawn_car()

# Spawns a new car in a random location
func spawn_car():
	# Create new instance of a car
	var car = car_scene.instantiate()
	
	var spawn_pos: Vector2
	var random_x: int
	var random_y: int
	var safe_to_spawn: bool
	
	while true:
		safe_to_spawn = true
		
		# Calculate a random position
		random_x = randi_range(min_car_x, max_car_x)
		random_y = randi_range(min_car_y, max_car_y)
		spawn_pos = Vector2(random_x, random_y)
	
		# Make sure the car doesnt overlap with anything
		if spawn_pos.distance_to(player.position) < min_dist:
			# too close to player
			continue
		
		for existing_car in spawned_cars:
			if spawn_pos.distance_to(existing_car.position) < min_dist:
				# too close to another car
				safe_to_spawn = false
				break

		if safe_to_spawn:
			break
	
	car.position = Vector2(random_x, random_y)
	
	# connect car signal to function
	car.connect("car_timer_timeout", _on_car_timer_timeout)

	# Add car to scene
	spawned_cars.append(car)
	add_child(car)

func _on_car_timer_timeout(car):
	# This will fire when a car instance sends the car_timer_timeout signal. 
	# remove the car from the collection
	spawned_cars.erase(car)
	# delete the car
	car.queue_free()
	# spawn a new car to replace it
	spawn_car()
