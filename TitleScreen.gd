extends Control

var scene_path_to_load

func _ready() -> void:
	for button in $TitleScreen/HBoxContainer/VBoxContainer/MenuOptions.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func _on_Button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	if scene_path_to_load == "res://Main.tscn":
		$StartGameSound.play()
	else:
		$CreditsSound.play()
	$Transition.show()
	$Transition.fade_in()
	
func _on_Transition_fade_finished():


	get_tree().change_scene(scene_path_to_load)
