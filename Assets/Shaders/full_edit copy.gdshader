shader_type canvas_item;
varying vec2 iResolution;
uniform sampler2D iChannel0;
varying vec2 canvas;

vec2 rotate2D(vec2 _st, float _angle){
    _st -= 0.5;
    float a = cos(_angle);
    float b = -sin(_angle);
    float c = sin(_angle);
    float d = cos(_angle);
    vec2 row1 = vec2(a, b);
    vec2 row2 = vec2(c, d);
    mat2 built_mat2 = mat2(row1, row2);
    _st = built_mat2 * _st.xy;
    _st += 0.5;
    return _st;
}

vec2 tile(vec2 _st, float _zoom){
    _st *= _zoom;
    return fract(_st);
}

float box(vec2 _st, vec2 _size, float _smoothEdges){
    _size = vec2(0.5)-_size*0.5;
    vec2 aa = vec2(_smoothEdges*0.5);
    vec2 uv = smoothstep(_size,_size+aa,_st);
    uv *= smoothstep(_size,_size+aa,vec2(1.0)-_st);
    return uv.x*uv.y;
}

void vertex() {
	// Called for every vertex the material is visible on.
	iResolution = (SCREEN_MATRIX * vec4(1.0, 0.5 , 1.0, 1.0)).xy;
	canvas = (CANVAS_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy;
	
}

void fragment() {
    vec2 st = (UV.xy/iResolution.xy);
    vec3 color = vec3(0.0);

    // Divide the space in 4
    st = tile(st,4.);

    // Use a matrix to rotate the space 45 degrees
    st = rotate2D(st,PI*0.25);

    // Draw a square
   vec3 fcolor = vec3(box(st,vec2(0.7),0.01));
    // color = vec3(st,0.0);

    COLOR = vec4(fcolor, 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
