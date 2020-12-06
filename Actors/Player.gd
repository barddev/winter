extends Node2D

signal player_fired_bullet(bullet, position, direction)

export (PackedScene) var Bullet

onready var  end_of_gun = $EndOfGun
onready var  gun_dir = $GunDirection
onready var attack_cooldown = $AttackCooldown
onready var animation_player= $AnimationPlayer

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	look_at(get_global_mouse_position())

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
    if attack_cooldown.is_stopped():
        var bullet_instance = Bullet.instance()
        var dir = (gun_dir.global_position - end_of_gun.global_position).normalized()
        emit_signal("player_fired_bullet", bullet_instance, end_of_gun.global_position, dir)
        attack_cooldown.start()
        animation_player.play("MuzzleFlash")
