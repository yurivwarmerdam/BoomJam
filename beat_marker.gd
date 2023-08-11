extends Node2D


func _ready():
	var tween:Tween=create_tween()
	tween.tween_property(self,"position",Vector2(480,520),.8).from(Vector2(20,520))
	tween.finished.connect(bounce)
	pass

func bounce():
	var tween=create_tween()
	tween.tween_property(self,"scale",Vector2(1.2,1.2),.4)
	tween.finished.connect(destroy_self)

func destroy_self():
	self.queue_free()
