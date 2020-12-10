extends FallingBody


onready var sprite = $Sprite
onready var sprites = [
	load("res://assets/bear.png"),
	load("res://assets/doll.png"),
	load("res://assets/duck.png"),
	load("res://assets/jack.png"),
	]

onready var stats = get_node("../../Stats")

var rng = RandomNumberGenerator.new()

func _ready():

	rng.randomize()
	var s = rng.randi_range(0,3)

	sprite.texture = sprites[s]

func handle_hit():
	stats.add_score(10)
	queue_free()

