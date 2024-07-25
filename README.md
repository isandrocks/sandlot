# Project Name

working title: Actual A.I. Artist

## Description

You play as a Robot artist trying to get by selling GLSL fragment shaders for fule ect. ect.

# Main Gameplay Loop

- aiming for the basic playstyle of Passpartout
- starts at the void fragment() {...} 
- limited lines of code
- limited stuff like only being able to use vec2 and float at first mybe int idk 
- extra lines and new types (vec3, Fract, sin ect) can be bought at the store to add to your "pallett" 
- unlock ablity to use functions but you will need to split your lines between that and main void fragment() {...} 
- this "should" stop playes from just doing everything in a fuction
- unlock set uniform variables like people walking by or mouse movent or whatever i can program in 
- i want to have it like Blockly coding style where you drag stuff in and fill out the varables so like if you drag in a vec3 it would look like vec3(0.0 , 0.0 , 0.0) only issue would be if you wanna add a vec2 varable to it, it would need to recognise that and do sonething like vec3(theVecTwo , 0.0)
- line of code is counted when a ; is placed. this "should" limit a 1 line cheese 
- fully blank lines are free for readablilty 
- start with like 5 lines?
- should probubly start them with a time uniform
- free line for the out put but will only except a single var for the vec4

```GLSL
uniform float iTime;

void main() {
  1
  2
  3
  4
  5
  vec4 ART = (float or a var, 0.0, 0.0, 0.0)
}

COLOR = ART;
```

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Installation

Instructions on how to install and set up the project.

## Usage

Instructions on how to use the project or any relevant examples.

## Contributing

Guidelines on how to contribute to the project.

## License

Information about the project's license.
