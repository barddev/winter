# Bullet.gd
extends Area2D
class_name Bullet

export (int) var speed = 20

var direction := Vector2.ZERO

func _ready() -> void:
    pass

func _physics_process(_delta: float) -> void:
    if direction != Vector2.ZERO:
        var velocity = direction * speed

        global_position += velocity

func set_direction(dir: Vector2) -> void:
    direction = dir
    rotation += direction.angle()

# If bullet leaves screen remove it
func _on_VisibilityNotifier2D_screen_exited() -> void:
    queue_free()