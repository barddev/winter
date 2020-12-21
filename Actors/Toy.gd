extends FallingBody


onready var sprite = $Sprite
onready var parachute = $Parachute

onready var sprites = [
	load("res://assets/bear.png"),
	load("res://assets/doll.png"),
	load("res://assets/duck.png"),
	load("res://assets/jack.png"),
	]

onready var parachute_sprites = [
	load("res://assets/parachute_1.png"),
	load("res://assets/parachute_2.png"),
	load("res://assets/parachute_3.png"),
	load("res://assets/parachute_4.png"),
	load("res://assets/parachute_5.png"),
	load("res://assets/parachute_6.png"),
	]

onready var stats = get_node("../../Stats")
onready var happy_sound  = get_node("../../YayHappiness")
onready var particle_manager = get_node("../../ExplosionManager")
onready var toy_hit_sound = get_node("../../ToyHitSound")
# onready var toy_hit_sound = $ToyHitSound

export (PackedScene) var Particle

var rng = RandomNumberGenerator.new()

func _ready():

	rng.randomize()
	var s = rng.randi_range(0,3)
	var p = rng.randi_range(0,5)

	sprite.texture = sprites[s]
	parachute.texture = parachute_sprites[p]

func handle_hit():
	stats.add_score(10)
	var particle_instance = Particle.instance()
	particle_instance.global_position = self.global_position
	particle_manager.add_child(particle_instance)
	toy_hit_sound.play()
	queue_free()
	particle_instance.emitting = true

func _on_FallingBody_area_entered(area: Area2D) -> void:
	# Check if object has gone out of bounds
	if area.has_method("handle_out_of_bounds"):
		happy_sound.play()
		area.handle_out_of_bounds(1)
