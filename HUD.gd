extends CanvasLayer

onready var stats = get_node("../Stats")
var scene_path_to_load

func _physics_process(_delta: float) -> void:
	$Score.text = str(stats.score)
	$Happiness.text = str(stats.happiness)


func _ready() -> void:
	var button = $GameOver/CenterContainer/VBoxContainer/Play
	button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	if scene_path_to_load == "res://Main.tscn":
		$StartGameSound.play()
	$Transition.show()
	$Transition.fade_in()
	
func _on_Transition_fade_finished():
	# get_tree().change_scene(scene_path_to_load)
	get_tree().reload_current_scene()
	get_tree().paused = false
