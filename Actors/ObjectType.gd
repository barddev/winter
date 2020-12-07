# Falling Object type
extends Node2D

enum FallingObjectType {
    TOY,
    COAL
}

var type = FallingObjectType.TOY setget set_type

func _ready() -> void:
    pass
    
func set_type(new_type: int):
    if new_type == type:
        return
    type = new_type