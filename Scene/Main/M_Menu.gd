extends Control

# starting shader parameters
var A_Text: float = 0.0
var B_Text: float = 0.32
var C_Text: float = 0.0
var D_Text: float = 1.0
var iTime: float = 0.0
var direction: float = 1.0

# setting the base type for functions
var A_Func: Expression = null
var B_Func: Expression = null
var C_Func: Expression = null
var D_Func: Expression = null

# Called when the node enters the scene tree for the first time.
func _ready():	
	$ColorRect.material.set_shader_parameter("A_text", A_Text)
	$ColorRect.material.set_shader_parameter("B_text", B_Text)
	$ColorRect.material.set_shader_parameter("C_text", C_Text)
	$ColorRect.material.set_shader_parameter("D_text", D_Text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$ColorRect.material.set_shader_parameter("x", iTime)
	
	update_shader_param(A_Func, A_Text, "A_text")
	update_shader_param(B_Func, B_Text, "B_text")
	update_shader_param(C_Func, C_Text, "C_text")
	update_shader_param(D_Func, D_Text, "D_text")
					
	iTime += delta * direction

	# Reverse the direction if iTime reaches 0.0 or 1.0
	if iTime >= 1.0:
			iTime = 1.0
			direction = -1.0
	elif iTime <= 0.0:
			iTime = 0.0
			direction = 1.0
	return iTime	

# various functions
func update_shader_param(func_var, text_var, param_name):
	var value = func_var.execute([iTime]) if func_var != null else text_var
	if value != null:
			$ColorRect.material.set_shader_parameter(param_name, value)

func get_Text_function(u_node, u_float, u_func):
	var new_function = Expression.new()
	var error = new_function.parse(u_node.text, ["x"])
	if u_node.text.is_valid_float() or u_node.text.is_valid_int():
		u_float = u_node.text.to_float()
		return u_float
	elif error == OK:
		if new_function != null and not new_function.has_execute_failed():
			u_func = new_function
			return u_func
	return null

# interaction signals
func A_line_text_changed(text):	
	if text.is_valid_float() or text.is_valid_int():
		A_Text = text.to_float()
		A_Func = null
	else:
		A_Func = get_Text_function($ItemList/A/A_Line, A_Text, A_Func)
	
func B_line_text_changed(text):
	if text.is_valid_float() or text.is_valid_int():
		B_Text = text.to_float()
		B_Func = null
	else:
		B_Func = get_Text_function($ItemList/B/B_Line, B_Text, B_Func)
	
func C_line_text_changed(text):	
	if text.is_valid_float() or text.is_valid_int():
		C_Text = text.to_float()
		C_Func = null
	else:
		C_Func = get_Text_function($ItemList/C/C_Line, C_Text, C_Func)

func D_line_text_changed(text):
	if text.is_valid_float() or text.is_valid_int():
		D_Text = text.to_float()
		D_Func = null
	else:
		D_Func = get_Text_function($ItemList/D/D_Line, D_Text, D_Func)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scene/Main/full edit/fulledit.tscn")


func _on_3d_test_button_pressed():
	get_tree().change_scene_to_file("res://Scene/Main/3D Test/3D_Test.tscn")


func _on_2d_test_button_pressed():
	get_tree().change_scene_to_file("res://Scene/Main/2D Test/2D_Test.tscn")


func _on_light_game_button_pressed():
	get_tree().change_scene_to_file("res://Scene/Main/Light Game/Light_game.tscn")
