extends Node2D
class_name Player

signal player_fired_bullet(bullet, position, direction)

onready var weapon = $Weapon

func _ready() -> void:
    weapon.connect("weapon_fired", self, "shoot")

func _physics_process(_delta: float) -> void:
	look_at(get_global_mouse_position())

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("shoot"):
        weapon.shoot()

func shoot(bullet_instance: Bullet, location: Vector2, dir: Vector2):
    emit_signal("player_fired_bullet", bullet_instance, location, dir)