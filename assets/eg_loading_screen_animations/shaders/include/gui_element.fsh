#moj_import <eg_loading_screen_animations:util.glsl>
#moj_import <eg_loading_screen_animations:config.glsl>

in vec2 bpui_textureUV;
flat in int bpui_textureID;
in vec3 bpui_pos1;
in vec3 bpui_pos2;
in vec3 bpui_pos3;

float ease(float x) {
    return x;
}

vec4 loadingscreen_modifyColour(vec4 originalColour, vec2 screenSize) {
    if(toint(originalColour.rgb) == 0xef323d) {
        vec2 coord = gl_FragCoord.xy / screenSize.xy;
        float aspect = screenSize.y / screenSize.x;
        coord.y *= aspect;
        coord -= vec2(0.5, 0.5 * aspect);
        // float d = length(coord);
        float d = max(length(vec2(coord.x, 0.)), length(vec2(0., coord.y)));
        if(d < ease(1 - (originalColour.a))) {
            discard;
        }

        vec4 modifiedColour = tovec(LOADING_SCREEN_COLOUR);
        return vec4(modifiedColour.rgb, modifiedColour.a);
    }

    return originalColour;
}