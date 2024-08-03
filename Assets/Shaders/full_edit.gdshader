shader_type canvas_item;
varying vec2 iResolution;
uniform sampler2D iChannel0;



void vertex() {
	// Called for every vertex the material is visible on.
	iResolution = (SCREEN_MATRIX * vec4(1.0, 0.5 , 1.0, 1.0)).xy;
	
}

void fragment() {
	
	vec2 flippedUV = vec2(UV.x, 1.0 - UV.y);
	vec2 v_blue = vec2(1.0 - UV.x, 1.0 - UV.y);
	lowp vec2 block_UV = flippedUV * 10.;
	if (round(block_UV) == vec2(5.,5.)){
		block_UV = vec2(0.,0.);
	}
	float fog = smoothstep(0.1, -0.02, abs(flippedUV.y + TIME * 9.));
	block_UV = round(block_UV)/10.; 
	
	vec3 finalColor = vec3(block_UV,(v_blue.x)- v_blue.y);
	finalColor = finalColor + (vec3(flippedUV,1. + (v_blue.x)- v_blue.y) - vec3(fog));

    COLOR = vec4(finalColor, 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
