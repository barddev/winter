extends FallingBody

onready var weapon = get_node("../../Player/Weapon")
onready var cooldown = get_node("../../Player/Weapon/AttackCooldown")
onready var powerup_sound = get_node("../../PowerUpSound")

onready var particle_manager = get_node("../../ExplosionManager")
export (PackedScene) var Particle

func _ready() -> void:
	pass

func handle_hit() -> void:
	var particle_instance = Particle.instance()
	particle_instance.global_position = self.global_position
	particle_manager.add_child(particle_instance)
	powerup_sound.play()
	queue_free()
	particle_instance.emitting = true
	weapon.Burst = 3
	cooldown.wait_time = 0.15

func _on_FallingBody_area_entered(_area: Area2D) -> void:
	pass
