extends RigidBody2D

var timeout:float=0.0
var timeout_max=.2
var moving:Vector2=Vector2.ZERO
var speed = 15

func _physics_process(delta):
	change_move()
	apply_force(moving)
	if Whiteboard.audio > -6 && timeout>=timeout_max:
		bounce()
		timeout=0
		return
	timeout +=delta

func bounce():
	var tween=create_tween()
	tween.tween_property($"%sprite","scale",Vector2.ONE,.5).from(Vector2(1.5,0.7))
	tween.play()

func change_move():
		if randi() % 100 == 99:
			if moving == Vector2.ZERO:
				moving = Vector2.RIGHT.rotated(randf()*TAU) *speed
			else:
				moving = Vector2.ZERO
