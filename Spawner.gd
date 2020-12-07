extends Node2D

export (PackedScene) var Toy

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()

func _on_SpawnerTimer_timeout() -> void:
	var body_instance = Toy.instance()

	# TODO remove these magic numbers
	var pos := Vector2(rng.randi_range(16, 944), 0)

	add_child(body_instance)
	body_instance.global_position = pos

