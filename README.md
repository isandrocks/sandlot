# Project Name

**Working Title: Actual A.I. Artist**

## Description

In this game, you play as a robot artist trying to make a living by selling GLSL fragment shaders for essentials like fuel.

### Main Gameplay Loop

- The gameplay is inspired by *Passpartout*.
- You sell shaders to other robots, who use them on their displays (imagine robots with monitors for heads, similar to those in *Stray*).
- You start with a basic shader in the form of `void fragment() { ... }`.
- Initially, you'll have limited code capabilities, using only `vec2` and `float` types. There may be a limited use of `int` types as well.
- Additional lines and new types (such as `vec3`, `fract`, `sin`, etc.) can be purchased in-game to expand your "palette."
- Consider whether to restrict mathematical operations like division and multiplication at first. It may affect gameplay.
- You’ll eventually unlock the ability to use functions, but you'll need to manage your lines of code between the main `void fragment() { ... }` function and additional functions. This should prevent players from doing everything in a single function.
- Unlocking the ability to set uniform variables, such as simulating people walking by or mouse movement, will add depth.
- The interface will resemble a Blockly coding style, where you drag and drop elements and fill out variables. For example, dragging in a `vec3` would look like `vec3(0.0, 0.0, 0.0)`. If you want to add a `vec2` variable to it, the game would handle it by converting it to `vec3(theVecTwo, 0.0)`.
- Code lines are counted by semicolons (`;`), which should limit one-line shortcuts.
- Blank lines are allowed for readability.
- Start with a maximum of 5 lines of code.
- Code lines should begin with a time uniform.
- There will be a free line for output, but it will only accept a single `vec4` variable.
- Live shader preview available.
- The viewport will be 512 x 512 pixels, with potential for custom sizes for specific orders.
- Grading how much a bot likes a shader is still being considered. Maybe use a system with `if` statements where some bots reward certain features more.
- A time-spent feature will be included with a 4-hour cap and a timeout if no changes are made, to prevent exploiting the time system.
- Comments will be allowed but appear as if written in crayon on top of the monitor for a playful touch.

### Basic Starting Palette

```GLSL
uniform float Time;

void fragment() {
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
