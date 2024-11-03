extends CharacterBody2D

class_name Player

const SPEED = 200.0
const JUMP_VELOCITY = -400.0


func _ready() -> void:
	print(GlobalInfo.player_pos)
	if GlobalInfo.player_pos == Vector2(0,0):
		GlobalInfo.player_pos = position
	else:
		position = GlobalInfo.player_pos
	print(GlobalInfo.player_pos)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if direction ==-1:
			$AnimatedSprite2D.flip_h=true
		else: $AnimatedSprite2D.flip_h=false
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	

	move_and_slide()
	
	
