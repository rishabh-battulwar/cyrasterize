#version 330
#extension GL_ARB_explicit_attrib_location : require

uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

layout(location = 0) in vec4 point;
layout(location = 1) in vec2 tcoordIn;
layout(location = 2) in vec3 linearMappingCoordIn;
layout(location = 3) in vec3 normal;

smooth out vec2 tcoord;
smooth out vec3 linearMappingCoord;
smooth out vec3 normalInterp;
smooth out vec3 FragPos;

void main() {
    // position is what we would normally pass straight through
    vec4 position = projectionMatrix * viewMatrix * modelMatrix * point;
    gl_Position = position;
    tcoord = tcoordIn;

    FragPos = (viewMatrix * modelMatrix * point).xyz;
    normalInterp = normal;
    linearMappingCoord = linearMappingCoordIn;
}