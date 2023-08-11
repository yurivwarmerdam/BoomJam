extends Node

@export var start:int
var beat
var timeout:float=0
var timeout_max=.2
var beat_marker_prototype=preload("res://beat_marker.tscn")
@onready var index=AudioServer.get_bus_index("beat")


# Called when the node enters the scene tree for the first time.
func _ready():
	$"%player".play(start-1)
	print(index)


func _physics_process(delta):
	beat=(AudioServer.get_bus_peak_volume_left_db(index,0)+AudioServer.get_bus_peak_volume_right_db(index,0))/2
	Whiteboard.beat=(AudioServer.get_bus_peak_volume_left_db(index,0)+AudioServer.get_bus_peak_volume_right_db(index,0))/2
	if beat > -6 && timeout>=timeout_max:
		make_marker()
		timeout=0
		return
	timeout +=delta

func make_marker():
	var new_marker=beat_marker_prototype.instantiate()
	add_child(new_marker)
