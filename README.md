# Project Name

**Working Title: Actual A.I. Artist**

## Description

In this game, you play as a robot artist trying to make a living by selling GLSL fragment shaders for essentials like fuel.

### Main Gameplay Loop

- The gameplay is inspired by *Passpartout*.
- You sell shaders to other robots, who use them on their displays (imagine robots with monitors for heads, similar to those in *Stray*).
- You start with a basic shader in the form of `void fragment() { ... }`.
- Initially, you'll have limited code capabilities, using only `vec2`,`int` and `float` types.
- Additional lines, functions and new types (such as `vec3`, `fract()`, `sin()`, etc.) can be purchased in-game to expand your "palette."
- Consider whether to restrict mathematical operations like division and multiplication at first. It may affect gameplay.
- You’ll eventually unlock the ability to use functions, but you'll need to manage your lines of code between the main `void fragment() { ... }` function and additional functions. This should prevent players from doing everything in a single function.
- Unlocking the ability to set uniform variables, such as simulating people walking by or mouse movement.
- The interface will resemble a Blockly coding style, where you drag and drop elements and fill out variables. For example, dragging in a `vec3` would look like `vec3(0.0, 0.0, 0.0)`. If you want to add a `vec2` variable to it, the game would handle it by converting it to `vec3(theVecTwo, 0.0)` or `vec3(vec2(0.0, 0.0), 0.0)`.
- Code lines are counted by semicolons (`;`), which should limit one-line shortcuts.
- Blank lines are allowed for readability.
- Start with a maximum of 5 lines of code.
- The time uniform will be avilable at the begining.
- There will be a free line for output, but it will only accept a single `vec4` variable.
- Live shader preview available.
- The viewport will be 512 x 512 pixels, with potential for custom sizes for specific orders.
- Grading how much a bot likes a shader is still being considered. Maybe use a system with `if` statements where some bots reward certain features more.
- A time-spent will be a added factor for the price of the shader with a 4-hour cap and a timeout if no changes are made, to prevent exploiting the time system.
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

## Other features, thoughts or ideas 

- i would like a way for them to be able to export a shader they made to a GLSL file or .gdshader maybe both idk 
- that would make a sandbox mode be fun to use for real projects 
- i just know someone will try to divide by 0 if not on purpos maybe by accident so I need a way to stop that 
- also i dont want them to fry their graphics card so load should be considered and a limit to doing dumb stuff but im dumb so im not sure what that dumb stuff is yet 
- should i limit line length? like add wrapping for free?

### things to do 

