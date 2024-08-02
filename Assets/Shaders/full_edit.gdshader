shader_type canvas_item;
varying vec2 iResolution;
uniform sampler2D iChannel0;

const float FREQ_RANGE = 64.0;

float getfrequency(float x) {
    return texture(iChannel0, vec2(floor(x * FREQ_RANGE + 1.0) / FREQ_RANGE, 0.25)).x + 0.06;
}

float getfrequency_smooth(float x) {
    float index = floor(x * FREQ_RANGE) / FREQ_RANGE;
    float next = floor(x * FREQ_RANGE + 1.0) / FREQ_RANGE;
    return mix(getfrequency(index), getfrequency(next), smoothstep(0.0, 1.0, fract(x * FREQ_RANGE)));
}

float getfrequency_blend(float x) {
    return mix(getfrequency(x), getfrequency_smooth(x), 0.5);
}

vec3 palette(float t) {
    float angle = atan(iResolution.x, iResolution.y);
    float frequency = max(getfrequency_blend(abs(angle / PI)) - 0.02, 0.0);

    vec3 a1 = vec3(0.32, 0.15, 0.15);
    vec3 b2 = vec3(0.27, 0.21, 0.3);
    vec3 c3 = vec3(0.73, 2.72, 2.72);
    vec3 d4 = vec3(2.43, 1.8633, 1.8566);
    vec3 a = a1 * (frequency + 0.1);
    vec3 b = b2 * (frequency + 0.1);
    vec3 c = c3 * .05;
    vec3 d = d4;

    return a + b * cos(6.28318 * (c * t + d));
}

void vertex() {
	// Called for every vertex the material is visible on.
	iResolution = (SCREEN_MATRIX * vec4(1.0, 0.5 , 1.0, 1.0)).xy;
	
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 normalizedCoord = iResolution.xy / VERTEX.xy;
    float angle = atan(iResolution.x, iResolution.y);
    float frequency = max(getfrequency_blend(abs(angle / PI)) - 0.02, 0.0);
    vec2 uv = ((normalizedCoord.xy * UV.xy ) / normalizedCoord.xy);
    vec2 uv0 = uv;
    vec3 finalColor = vec3(0.0);

    for(float i = 0.0; i < 4.0; i ++) {
        uv = fract(uv * 1.5) - 0.5 ; 
        

        float d = length(uv) * exp(- length(uv0));

        vec3 col = palette(length(uv0) + i * .1 + TIME );

        d = sin(d * 8. + TIME) / 8.;
        d = abs(d);

        d = pow((0.01 +( .01*normalize(frequency))) / d, 1.2);

        finalColor += col * d;
		finalColor = clamp(finalColor, vec3(0.0), vec3(0.80));
    }

    COLOR = vec4(finalColor, 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
