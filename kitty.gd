extends Sprite2D
var velocity = Vector2(0,0)
var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity=velocity.normalized()
	global_position += speed * velocity * delta

func slide():
	velocity.x = 1
	await get_tree().create_timer(1).timeout
	velocity.x = 0
	
func slideback():
	velocity.x = -1
	await get_tree().create_timer(1).timeout
	velocity.x = 0
