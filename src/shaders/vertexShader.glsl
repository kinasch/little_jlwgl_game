#version 400 core

layout(location = 0) in vec3 position;
layout(location = 1) in vec2 textureCoords;
layout(location = 2) in vec3 normal;


out vec2 pass_textureCoords;
out vec3 surfaceNormal;
out vec3 toLightVector;


uniform mat4 transformationMatrix;
uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform vec3 lightPosition;

void main(){

    vec4 worldPosition = transformationMatrix * vec4(position,1.0);
    gl_Position = projectionMatrix * viewMatrix *  worldPosition;
    pass_textureCoords = textureCoords;

    surfaceNormal = (transformationMatrix * vec4(normal,0.0)).xyz;
    toLightVector = lightPosition - worldPosition.xyz;
}