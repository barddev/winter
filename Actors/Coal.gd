extends FallingBody


onready var stats = get_node("../../Stats")

func _ready():
	pass 

func handle_hit():
	stats.add_happiness(-1)
	queue_free()


