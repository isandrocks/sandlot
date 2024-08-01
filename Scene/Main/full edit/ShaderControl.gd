extends Control

signal signal_reload

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_control_signal_reload():
	print("signal recieved")
	var scene = load("res://Scene/Main/full edit/color_rect_FE.tscn")
	var fe_shader = load("res://Assets/Shaders/full_edit.gdshader")
	var instance = scene.instantiate()
	add_child(instance)
	
