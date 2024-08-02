extends Control

var shaderFile_path = "Assets/Shaders/full_edit.gdshader"
var shaderFile_default = "Assets/Shaders/full_edit_default.gdshader"
var shaderFile_Read = null
var shaderFile_Write = null
var local_path = ProjectSettings.globalize_path(shaderFile_path)

signal signal_reload

# Called when the node enters the scene tree for the first time.
func _ready():

	if !Global.skip_ready:
			# If the scene is reloaded, skips the following code
		Global.scroll_position = $TextEdit.get_v_scroll()
		shaderFile_Read = FileAccess.open(shaderFile_default, FileAccess.READ)
		var default_shader = shaderFile_Read.get_as_text()
		shaderFile_Read.close()
		shaderFile_Write = FileAccess.open(shaderFile_path, FileAccess.WRITE)
		shaderFile_Write.store_string(default_shader)
		shaderFile_Write.close()
	
	# Open the shader file for reading and sets the text to the textedit node
	shaderFile_Read = FileAccess.open(shaderFile_path, FileAccess.READ)
	var content = shaderFile_Read.get_as_text()
	shaderFile_Read.close()	
	$TextEdit.text = content

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scene/Main/M_Menu.tscn")

func _on_text_edit_text_changed():

	shaderFile_Write = FileAccess.open(shaderFile_path, FileAccess.WRITE)
	shaderFile_Write.store_string($TextEdit.text)
	shaderFile_Write.close()
	
	if $Timer.is_stopped():
		$Timer.start()

func _on_clear_pressed():
	$ShaderControl/ColorRect.material.shader = null

func _on_load_pressed():
	shaderFile_Read = FileAccess.open(shaderFile_path, FileAccess.READ)
	var content = shaderFile_Read.get_as_text()
	shaderFile_Read.close()	
	var new_shader = Shader.new()
	new_shader.set_code(content)
	$ShaderControl/ColorRect.material.shader = new_shader

func _on_timer_timeout():
	Global.skip_ready = true
	shaderFile_Read = FileAccess.open(shaderFile_path, FileAccess.READ)
	var content = shaderFile_Read.get_as_text()
	shaderFile_Read.close()	
	var new_shader = Shader.new()
	new_shader.set_code(content)
	$ShaderControl/ColorRect.material.shader = new_shader
