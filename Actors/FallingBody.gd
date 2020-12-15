extends Area2D
class_name FallingBody


onready var object_type = $ObjectType

export (int) var speed = 2

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	global_position.y += speed

func handle_hit() -> void:
	queue_free()

func _on_FallingBody_area_entered(area: Area2D) -> void:
	# Check if object has gone out of bounds
	if area.has_method("handle_out_of_bounds"):
		# TODO: probably wanna pass the type of object here
		area.handle_out_of_bounds()

# remove if the sprite leaves the screen
func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
