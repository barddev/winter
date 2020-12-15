extends Node2D

signal  weapon_fired(bullet, location, direction)

export (PackedScene) var Bullet
export (int) var Burst = 1


onready var  end_of_gun = $EndOfGun
onready var  gun_dir = $GunDirection
onready var attack_cooldown = $AttackCooldown
onready var animation_player = $AnimationPlayer
onready var player = get_node("../../Player")

var burst_count = 0

func _ready() -> void:
	pass


func shoot():
	if attack_cooldown.is_stopped() and player.can_fire and Bullet != null:
		var bullet_instance = Bullet.instance()
		var dir = (gun_dir.global_position - end_of_gun.global_position).normalized()
		emit_signal("weapon_fired", bullet_instance, end_of_gun.global_position, dir)
		attack_cooldown.start()
		animation_player.play("MuzzleFlash")
		$ArtillaryFire.play()
		burst_count += 1
		if burst_count >= Burst:
			player.can_fire  = false
			burst_count = 0
