extends CharacterBody2D

func _input(event):
	if event.is_action_pressed("dance"):
		start_tween()

func start_tween():
	#if tween: tween.stop()
	var tween=create_tween()
	tween.tween_property($"%sprite","scale",Vector2.ONE,.5).from(Vector2(1.5,0.7))
	tween.play()
