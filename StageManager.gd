extends Node

var current_scene
onready var fader = get_node("canvas_screen/control_screen/anim")

func _input(event):
	if event.is_action_pressed("ui_restart"):
		get_tree().reload_current_scene()
	pass

func restart():
	get_tree().reload_current_scene()

func change_scene(new_scene):
	if !fader.is_playing():
		fader.play("fade_out")
		current_scene = new_scene

func _on_anim_animation_finished(anim_name):
	if(anim_name == "fade_out"):
		get_tree().change_scene(current_scene)
		fader.play("fade_in")
	pass # replace with function body
