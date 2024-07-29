extends Control

signal A_Line_signal();
signal B_Line_signal();
signal C_Line_signal();
signal D_Line_signal();

var A_Text: float = 0.32
var B_Text: float = 0.0
var C_Text: float = 0.32
var D_Text: float = 1.0
var iTime: float = 0.0

var A_Func: Expression = null
var B_Func: Expression = null
var C_Func: Expression = null
var D_Func: Expression = null


# Called when the node enters the scene tree for the first time.
func _ready():
	print(iTime)
	$ColorRect.material.set_shader_parameter("A_text", A_Text)
	$ColorRect.material.set_shader_parameter("B_text", B_Text)
	$ColorRect.material.set_shader_parameter("C_text", C_Text)
	$ColorRect.material.set_shader_parameter("D_text", D_Text)

	A_Func = Expression.new()
	B_Func = Expression.new()
	C_Func = Expression.new()
	D_Func = Expression.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$ColorRect.material.set_shader_parameter("iTime", iTime)

	if A_Func.has_execute_failed() == true or A_Func == null:		
		$ColorRect.material.set_shader_parameter("A_text", A_Text)
	else :
		$ColorRect.material.set_shader_parameter("A_text", A_Func.execute([iTime]))
		print(A_Func.execute([iTime]))
		print(iTime)
	
	iTime += delta
	if iTime > 1:
		iTime = -1
	return iTime
	
	
# String to float parsing functions
func get_A_Text_function() -> Expression:
	print(iTime)
	var new_function = Expression.new()
	var error = new_function.parse($ItemList/A/A_Line.text, ["iTime"])
	if $ItemList/A/A_Line.text.is_valid_float():
		A_Text = $ItemList/A/A_Line.text.to_float()
		return A_Func
	elif error == OK and new_function != null:
		new_function = get_function_from_string($ItemList/A/A_Line.text)
		if new_function != null:
			A_Text = new_function.execute([iTime])
			return A_Func
	else:
		print("error: invalid A_Text")
	return null
	
func get_B_Text_function() -> float:
	B_Text = $ItemList/B/B_Line.text
	return B_Text

func get_C_Text_function() -> float:
	B_Text = $ItemList/C/C_Line.text
	return C_Text

func get_D_Text_function() -> float:
	D_Text = $ItemList/D/D_Line.text
	return D_Text

	
func get_function_from_string(func_string: String) -> Expression:
	var new_function = Expression.new()
	var error = new_function.parse(func_string, ["iTime"])
	if error == OK and new_function != null:
		var value = new_function.execute([iTime], null, false)
		if !new_function.has_execute_failed() and value != 0.0 and (value is float or value is int):
			print(new_function.execute([iTime], null, false))
			return new_function
	print("error: invalid fucntion")
	return null

# Text changed signals
func A_line_text_changed(text):
	print(text)
	if text.is_valid_float():
		A_Text = text.to_float()
	else:
		A_Func = get_A_Text_function()
	


func B_line_text_changed():
	get_B_Text_function()
	$ColorRect.material.set_shader_parameter("B_text", B_Text)


func C_line_text_changed():
	get_C_Text_function()
	$ColorRect.material.set_shader_parameter("C_text", C_Text)


func D_line_text_changed():
	get_D_Text_function()
	$ColorRect.material.set_shader_parameter("D_text", D_Text)
