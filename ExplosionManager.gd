extends Node2D

export (PackedScene) var Particle

func obj_destroyed(pos: Vector2) -> void:
    var p = Particle.instance()
    add_child(p)
    p.global_position = pos
    p.set_emitting(true)
