extends CharacterBody2D

#var pos: Vector2 = Vector2(position.x, position.y)

const speed: int = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	pos.x += speed * delta
#	position = pos
#	if Input.is_action_pressed("left"):
#		print("left")
#	elif Input.is_action_pressed("right"):
#		print("right")
#	elif Input.is_action_pressed("up"):
#		print("up")
#	elif Input.is_action_pressed("down"):
#		print("down")

	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed

	#print(velocity)
	move_and_slide()
