extends Node2D


onready var bullet_manager = $BulletManager
onready var player: Player = $Player

onready var obj_type = $FallingObjectType

func _ready() -> void:
    player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")


# TODO handle scoring
func handle_out_of_bounds(obj):
    pass