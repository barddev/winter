extends "res://Actors/Weapon.gd"

export (int) var Burst = 1

func _ready() -> void:
	pass

func shoot():
    if attack_cooldown.is_stopped() and Bullet != null:

        var t := Timer.new()
        t.set_wait_time(0.1)

        for _i in range(Burst):
            var bullet_instance = Bullet.instance()
            var dir = (gun_dir.global_position - end_of_gun.global_position).normalized()
            emit_signal("weapon_fired", bullet_instance, end_of_gun.global_position, dir)
            animation_player.play("MuzzleFlash")
            $ArtillaryFire.play()

        attack_cooldown.start()
