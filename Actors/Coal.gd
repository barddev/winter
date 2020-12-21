extends FallingBody


onready var stats = get_node("../../Stats")
onready var toy_hit_sound = get_node("../../ToyHitSound")
var is_coal = true

onready var particle_manager = get_node("../../ExplosionManager")
export (PackedScene) var Particle

onready var parachute = $Parachute

onready var parachute_sprites = [
	load("res://assets/parachute_1.png"),
	load("res://assets/parachute_2.png"),
	load("res://assets/parachute_3.png"),
	load("res://assets/parachute_4.png"),
	load("res://assets/parachute_5.png"),
	load("res://assets/parachute_6.png"),
	]


var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	var p = rng.randi_range(0,5)
	parachute.texture = parachute_sprites[p]

func handle_hit():
	var particle_instance = Particle.instance()
	particle_instance.global_position = self.global_position
	particle_manager.add_child(particle_instance)
	toy_hit_sound.play()
	queue_free()
	particle_instance.emitting = true

func _on_FallingBody_area_entered(area: Area2D) -> void:
	# Check if object has gone out of bounds
	if area.has_method("handle_out_of_bounds"):
		if stats.happiness != 0:
			$NoHappy.play()
		area.handle_out_of_bounds(-1)
