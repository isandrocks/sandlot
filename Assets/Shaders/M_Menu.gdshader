shader_type canvas_item;

uniform float iTime;
uniform float A_text;
uniform float B_text;
uniform float C_text;
uniform float D_text;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float a = A_text;
	float b = B_text;
	float c = C_text;
	float d = D_text;
	
COLOR = vec4(a, b, c, d);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
