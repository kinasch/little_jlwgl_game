#version 400 core

in vec2 pass_textureCoords;
in vec3 surfaceNormal;
in vec3 toLightVector;

layout(location = 0) out vec4 out_Color;

uniform sampler2D textureSampler;
uniform vec3 lightColour;

void main(){

    vec3 unitNormal = normalize(surfaceNormal);
    vec3 unitLight = normalize(toLightVector);

    float nDot1 = dot(unitNormal,unitLight);
    float brightness = max(nDot1,0.0);
    vec3 diffuse = brightness * lightColour;

    out_Color = vec4(diffuse,1.0) * texture(textureSampler, pass_textureCoords);

}