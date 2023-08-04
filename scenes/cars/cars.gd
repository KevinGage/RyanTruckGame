extends Node2D
var car_scene = preload("res://scenes/cars/car.tscn")

const num_of_cars = 3

const min_car_x = 100
const max_car_x = 1050
const min_car_y = 100
const max_car_y = 500

var spawned_cars = []

var ready_to_spawn = false

func _process(_delta):
	# Check to see if the spawner is colliding with anything
	if !$SpawnChecker.has_overlapping_bodies() and !$SpawnChecker.has_overlapping_areas():
		# If not check to see if there are less than 3 cars.
		if spawned_cars.size() < num_of_cars:
			if ready_to_spawn:
				# If less than num_of_cars spawn a new one at spawner location
				spawn_car()
				var new_position = Vector2(randi_range(min_car_x, max_car_x), randi_range(min_car_y, max_car_y))
				$SpawnChecker.position = new_position
	else:
		# If it's coliding move it
		var new_position = Vector2(randi_range(min_car_x, max_car_x), randi_range(min_car_y, max_car_y))
		$SpawnChecker.position = new_position

# Spawns a new car in a random location
func spawn_car():
	# Create new instance of a car
	var car = car_scene.instantiate()

	# connect car signal to function
	car.connect("car_timer_timeout", _on_car_timer_timeout)
	
	# set car possition to spawner position
	car.position = $SpawnChecker.position

	# Add car to scene
	spawned_cars.append(car)
	add_child(car)
	
	# wait a bit before spawning again
	ready_to_spawn = false
	$Timer.start()

func _on_car_timer_timeout(car):
	# This will fire when a car instance sends the car_timer_timeout signal. 
	# remove the car from the collection
	spawned_cars.erase(car)
	# delete the car
	car.queue_free()


func _on_timer_timeout():
	ready_to_spawn = true
