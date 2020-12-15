extends Node2D

# TODO Lot of repeated code, needs refactored

export (PackedScene) var Toy
export (PackedScene) var Coal
export (PackedScene) var PowerUp

var rng = RandomNumberGenerator.new()
onready var difficulty := 1

func _ready() -> void:
	rng.randomize()

func _on_ToySpawnerTimer_timeout() -> void:
    for _i in range(difficulty):
        var body_instance = Toy.instance()

        # TODO remove these magic numbers
        var pos := Vector2(rng.randi_range(16, 944), rng.randi_range(-64,0))

        add_child(body_instance)
        body_instance.global_position = pos

func _on_CoalSpawnerTimer_timeout() -> void:
    var body_instance = Coal.instance()
    var pos := Vector2(rng.randi_range(16, 944), 0)
    add_child(body_instance)
    body_instance.global_position = pos

func _on_DiffcultyTimer_timeout() -> void:
    difficulty += 1

func _on_PowerUp_timeout() -> void:
    var body_instance = PowerUp.instance()
    var pos := Vector2(rng.randi_range(16, 944),  rng.randi_range(-64,0))
    add_child(body_instance)
    body_instance.global_position = pos
