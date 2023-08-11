extends Node


@export var start:int
var volume:float

@onready var index=AudioServer.get_bus_index("audio")

# Called when the node enters the scene tree for the first time.
func _ready():
	$"%player".play(start)
	print(index)

func _physics_process(delta):
	Whiteboard.audio=(AudioServer.get_bus_peak_volume_left_db(0,0)+AudioServer.get_bus_peak_volume_right_db(0,0))/2
