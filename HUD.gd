extends CanvasLayer

onready var stats = get_node("../Stats")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta: float) -> void:
	$Score.text = str(stats.score)
	$Happiness.text = str(stats.happiness)
