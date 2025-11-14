#version 150

#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:globals.glsl>

in vec4 vertexColor;
in float vertexDistance;
in vec3 xyzPos;

out vec4 fragColor;

#moj_import <eg_loading_screen_animations:gui_element.fsh>

void main() {
    vec4 color = loadingscreen_modifyColour(vertexColor, ScreenSize);
    if (color.a == 0.0) {
        discard;
    }

    fragColor = color * ColorModulator;
}
