extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var stats = get_node("../Stats")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func handle_out_of_bounds(a: int):
	stats.add_happiness(a)
