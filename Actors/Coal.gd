extends FallingBody


onready var stats = get_node("../../Stats")
var is_coal = true

func _ready():
	pass 

func handle_hit():
	queue_free()

func _on_FallingBody_area_entered(area: Area2D) -> void:
    # Check if object has gone out of bounds
    if area.has_method("handle_out_of_bounds"):
        # TODO: probably wanna pass the type of object here
        area.handle_out_of_bounds(-1)
