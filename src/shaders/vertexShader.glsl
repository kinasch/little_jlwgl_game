#version 400 core

layout(location = 0) in vec3 position;
layout(location = 1) in vec2 textureCoords;


out vec3 color;
out vec2 pass_textureCoords;

uniform mat4 transformationMatrix;

void main(){

    gl_Position = transformationMatrix * vec4(position,1.0);
    color = vec3(position.x+0.5,1.0,position.y+0.5);
    pass_textureCoords = textureCoords;

}