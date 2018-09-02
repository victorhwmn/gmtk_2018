extends Node

var current_scene
onready var fader = $canvas_screen/canvas_screen/control_screen/fader

func _input(event):
	if event.is_action_pressed("ui_restart"):
		get_tree().reload_current_scene()
	pass

func restart():
	get_tree().reload_current_scene()

func change_scene(new_scene):
	if !fader.is_playing():
		fader.play("fade-out")
		current_scene = new_scene

func _on_anim_animation_finished(anim_name):
	if(anim_name == "fade-out"):
		get_tree().change_scene(current_scene)
		fader.play("fade-in")
	pass # replace with function body
