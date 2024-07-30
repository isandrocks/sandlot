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
	print(iTime)
	$ColorRect.material.set_shader_parameter("A_text", A_Text)
	$ColorRect.material.set_shader_parameter("B_text", B_Text)
	$ColorRect.material.set_shader_parameter("C_text", C_Text)
	$ColorRect.material.set_shader_parameter("D_text", D_Text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$ColorRect.material.set_shader_parameter("iTime", iTime)
	
	if A_Func == null:		
		$ColorRect.material.set_shader_parameter("A_text", A_Text)
	else :
		if A_Func.execute([iTime]) != null:
			$ColorRect.material.set_shader_parameter("A_text", A_Func.execute([iTime]))
			
	if B_Func == null:
		$ColorRect.material.set_shader_parameter("B_text", B_Text)
	else:		
		if B_Func.execute([iTime]) != null:
			$ColorRect.material.set_shader_parameter("B_text", B_Func.execute([iTime]))
			
	if C_Func == null:
		$ColorRect.material.set_shader_parameter("C_text", C_Text)
	else:
		if C_Func.execute([iTime]) != null:
			$ColorRect.material.set_shader_parameter("C_text", C_Func.execute([iTime]))
			
	if D_Func == null:
		$ColorRect.material.set_shader_parameter("D_text", D_Text)
	else:		
		if D_Func.execute([iTime]) != null:
			$ColorRect.material.set_shader_parameter("D_text", D_Func.execute([iTime]))
					
	iTime += delta * direction

	# Reverse the direction if iTime reaches 0.0 or 1.0
	if iTime >= 1.0:
			iTime = 1.0
			direction = -1.0
	elif iTime <= 0.0:
			iTime = 0.0
			direction = 1.0

	return iTime
	
	
# String to expression parsing functions
func get_A_Text_function():
	
	# Create a new Expression instance
	var new_function = Expression.new()
	var error = new_function.parse($ItemList/A/A_Line.text, ["iTime"])

	# Check if the text is a valid float or integer
	if $ItemList/A/A_Line.text.is_valid_float() or $ItemList/A/A_Line.text.is_valid_int():
		A_Text = $ItemList/A/A_Line.text.to_float()
		return A_Text
	elif error == OK:
		# Check if the parsed expression is valid and has not failed execution
		if new_function != null and not new_function.has_execute_failed():
			A_Func = new_function
			return A_Func

	return null  # Return null if none of the conditions are met

	
func get_B_Text_function():
	var new_function = Expression.new()
	var error = new_function.parse($ItemList/B/B_Line.text, ["iTime"])
	
	if $ItemList/B/B_Line.text.is_valid_float() or $ItemList/B/B_Line.text.is_valid_int():
		B_Text = $ItemList/B/B_Line.text.to_float()
		return B_Text
	elif error == OK:
		if new_function != null and not new_function.has_execute_failed():
			B_Func = new_function
			return B_Func

	return null

func get_C_Text_function():
	var new_function = Expression.new()
	var error = new_function.parse($ItemList/C/C_Line.text, ["iTime"])

	if $ItemList/C/C_Line.text.is_valid_float() or $ItemList/C/C_Line.text.is_valid_int():
		C_Text = $ItemList/C/C_Line.text.to_float()
		return C_Text
	elif error == OK:
		if new_function != null and not new_function.has_execute_failed():
			C_Func = new_function
			return C_Func

	return null

func get_D_Text_function():
	var new_function = Expression.new()
	var error = new_function.parse($ItemList/D/D_Line.text, ["iTime"])

	if $ItemList/D/D_Line.text.is_valid_float() or $ItemList/D/D_Line.text.is_valid_int():
		D_Text = $ItemList/D/D_Line.text.to_float()
		return D_Text
	elif error == OK:
		if new_function != null and not new_function.has_execute_failed():
			D_Func = new_function
			return D_Func

	return null

# Text changed signals
func A_line_text_changed(text):
	print(text)
	if text.is_valid_float() or text.is_valid_int():
		A_Text = text.to_float()
		A_Func = null
	else:
		A_Func = get_A_Text_function()
	
func B_line_text_changed(text):
	print(text)
	if text.is_valid_float() or text.is_valid_int():
		B_Text = text.to_float()
		B_Func = null
	else:
		B_Func = get_B_Text_function()
	
func C_line_text_changed(text):
	print(text)
	if text.is_valid_float() or text.is_valid_int():
		C_Text = text.to_float()
		C_Func = null
	else:
		C_Func = get_C_Text_function()

func D_line_text_changed(text):
	print(text)
	if text.is_valid_float() or text.is_valid_int():
		D_Text = text.to_float()
		D_Func = null
	else:
		D_Func = get_D_Text_function()
