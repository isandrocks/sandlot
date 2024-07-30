extends Control

signal A_Line_signal();
signal B_Line_signal();
signal C_Line_signal();
signal D_Line_signal();

var A_Text: float = 0.0
var B_Text: float = 0.0
var C_Text: float = 0.0
var D_Text: float = 0.0
var TIME: float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$ColorRect.material.set_shader_parameter("A_text", A_Text)
	$ColorRect.material.set_shader_parameter("B_text", B_Text)
	$ColorRect.material.set_shader_parameter("C_text", C_Text)
	$ColorRect.material.set_shader_parameter("D_text", D_Text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	TIME += 0.001
	if TIME == 1.0:
		TIME = 0.01
	

func get_A_Text_function() -> float:
	var new_function = get_function_from_string($ItemList/A/A_Line.text)
	if A_Text != 0.0:
		A_Text = new_function
	return A_Text
	
func get_B_Text_function() -> float:
	var new_function = get_function_from_string($ItemList/B/B_Line.text)
	if B_Text != 0.0:
		B_Text = new_function
	return B_Text

func get_C_Text_function() -> float:
	var new_function = get_function_from_string($ItemList/C/C_Line.text)
	if C_Text != 0.0:
		C_Text = new_function.execute()
	return C_Text

func get_D_Text_function() -> float:
	var new_function = get_function_from_string($ItemList/D/D_Line.text)
	if D_Text != 0.0:
		D_Text = new_function
	return D_Text
	
func get_function_from_string(func_string: String) -> Expression:
	var new_function = Expression.new()
	var error = new_function.parse(func_string)
	if error == OK and new_function != null:
		var value = new_function.execute([5.4], null, false)
		if !new_function.has_execute_failed() and value != 0.0 and (value is float or value is int):
			print(new_function.execute())
			return new_function
	print("error: invalid fucntion")
	return null


func A_line_text_changed(A_change):
	get_A_Text_function()
	$ColorRect.material.set_shader_parameter("A_text", A_Text)


func B_line_text_changed(_B_Text):
	get_B_Text_function()
	$ColorRect.material.set_shader_parameter("B_text", B_Text)


func C_line_text_changed(_C_Text):
	get_C_Text_function()
	$ColorRect.material.set_shader_parameter("C_text", C_Text)


func D_line_text_changed(_D_Text):
	get_D_Text_function()
	$ColorRect.material.set_shader_parameter("D_text", D_Text)
