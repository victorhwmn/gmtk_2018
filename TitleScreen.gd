extends Control

var pressed = false
export(String, FILE, "*.tscn") var tutorial_scene

func _input(event):
	if event is InputEventKey or event is InputEventJoypadButton and !pressed:
		if event.pressed:
			StageManager.change_scene(tutorial_scene)
			pressed = true