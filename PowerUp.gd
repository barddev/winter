extends FallingBody

onready var weapon = get_node("../../Player/Weapon")
onready var cooldown = get_node("../../Player/Weapon/AttackCooldown")


func _ready() -> void:
    pass


func handle_hit() -> void:
    queue_free()
    weapon.Burst = 3
    cooldown.wait_time = 0.15

func _on_FallingBody_area_entered(_area: Area2D) -> void:
    pass
