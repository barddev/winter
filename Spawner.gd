extends Node2D

export (PackedScene) var Toy
export (PackedScene) var Coal

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()

func _on_ToySpawnerTimer_timeout() -> void:
	var body_instance = Toy.instance()

	# TODO remove these magic numbers
	var pos := Vector2(rng.randi_range(16, 944), 0)

	add_child(body_instance)
	body_instance.global_position = pos

func _on_CoalSpawnerTimer_timeout() -> void:
	var body_instance = Coal.instance()
	var pos := Vector2(rng.randi_range(16, 944), 0)
	add_child(body_instance)
	body_instance.global_position = pos
