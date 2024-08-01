func reload_node(node):
	# Save a reference to the parent node and the node's position
	var parent = node.get_parent()
	var old_position = node.position
	var index = node.get_index()
	var child_scene_path = node.get_filename()

	# Remove the current instance of the node
	node.queue_free()
	
	# Instance a new copy of the node
	var new_node = load(child_scene_path).instance()
	
	
	# Add the new instance to the parent node
	parent.add_child(new_node)
	parent.move_child(new_node, index)
	
	# Restore the position if needed
	if old_position != null:
			new_node.position = old_position
	
	print("Node reloaded successfully")
	
func reload_shader(node):
	# Load the shader resource
	var loaded_item = load("res://Assets/SandBox_shaderMat.tres")
	if loaded_item is Shader:
			# Create a new shader material with the loaded shader
			var shader_material = ShaderMaterial.new()
			shader_material.shader = loaded_item

			# Assign the new shader material to the node
			node.material = shader_material
			node.queue_redraw()

			print("Shader reloaded successfully")
	else:
			print("Failed to load shader")


func _reload_shader():
	var loaded_item = load("res://Assets/SandBox_shaderMat.tres")
	$ColorRect.material = loaded_item
	
func reload_node(node):
	# Save a reference to the parent node and the node's position
	var old_position = node.position
	
	var child_scene_path = "res://Scene/Main/full edit/color_rect_FE.tscn"

	# Load and instance a new copy of the scene
	var new_scene_resource = load(child_scene_path)
	var new_node = new_scene_resource.instantiate()

	# Add the new instance to the parent node at the original position in the hierarchy
	node.add_child(new_node)
	

	# Restore the position if needed
	if old_position != null:
		new_node.position = old_position

	print("Node reloaded successfully")
