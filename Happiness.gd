extends Node2D

onready var stats = get_node("../Stats")
onready var current = 0
onready var anim = $AnimationPlayer

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	if current == stats.happiness:
		return

	if stats.happiness == 0:
		current = 0
		anim.play("happiness_0")
	elif stats.happiness == 1:
		current = 1
		anim.play("happiness_1")
	elif stats.happiness == 2:
		current = 2
		anim.play("happiness_2")
	elif stats.happiness == 3:
		current = 3
		anim.play("happiness_3")
	elif stats.happiness == 4:
		current = 4
		anim.play("happiness_4")
