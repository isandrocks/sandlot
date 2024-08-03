extends Control

var shaderFile_path = "Assets/Shaders/full_edit.gdshader"
var shaderFile_default = "Assets/Shaders/full_edit_default.gdshader"
var shaderFile_Read = null
var shaderFile_Write = null

signal signal_reload

# Called when the node enters the scene tree for the first time.
func _ready():
	# Open the shader file for reading and sets the text to the textedit node
	shaderFile_Read = FileAccess.open(shaderFile_path, FileAccess.READ)
	var content = shaderFile_Read.get_as_text()
	shaderFile_Read.close()	
	$TextEdit.text = content

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func save_shader():
	shaderFile_Read = FileAccess.open(shaderFile_path, FileAccess.READ)
	var save_data = shaderFile_Read.get_as_text()
	shaderFile_Read.close()	

	var base_name = "saved_shader"
	var extension = ".gdshader"
	var save_path = base_name + extension
	
	var counter = 1
	# Check if the file exists and increment the counter until we find a non-existing filename
	while FileAccess.file_exists(save_path):
		save_path = base_name + "_" + str(counter) + extension
		counter += 1
	
	var file = FileAccess.open(save_path, FileAccess.WRITE)

	if file:
		file.store_string(save_data)
		file.close()
		print("Shader saved to:", save_path)
	else:
		print("Failed to save the Shader.")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scene/Main/M_Menu.tscn")

func _on_text_edit_text_changed():
	shaderFile_Write = FileAccess.open(shaderFile_path, FileAccess.WRITE)
	shaderFile_Write.store_string($TextEdit.text)
	shaderFile_Write.close()	
	if $Timer.is_stopped():
		$Timer.start()

func _on_clear_pressed():
	shaderFile_Read = FileAccess.open(shaderFile_default, FileAccess.READ)
	var content = shaderFile_Read.get_as_text()
	shaderFile_Read.close()	
	$TextEdit.text = content
	$ShaderControl/ColorRect.material.shader = null

func _on_load_pressed():
	if $Timer.is_stopped():
		$Timer.start()

func _on_timer_timeout():
	shaderFile_Read = FileAccess.open(shaderFile_path, FileAccess.READ)
	var content = shaderFile_Read.get_as_text()
	shaderFile_Read.close()
	var new_shader = Shader.new()
	new_shader.set_code(content)
	$ShaderControl/ColorRect.material.shader = new_shader


func _on_save_pressed():
	save_shader()
