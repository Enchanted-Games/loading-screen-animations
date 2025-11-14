#moj_import <eg_loading_screen_animations:util.glsl>
#moj_import <eg_loading_screen_animations:config.glsl>

in vec3 loadingscreen_pos1;
in vec3 loadingscreen_pos2;
in vec3 loadingscreen_pos3;

float ease(float x) {
    return x;
}

vec4 loadingscreen_modifyColour(vec4 originalColour, vec2 screenSize) {
    vec2 dpos1 = loadingscreen_pos1.xy / loadingscreen_pos1.z;
    vec2 dpos2 = loadingscreen_pos2.xy / loadingscreen_pos2.z;
    vec2 dpos3 = loadingscreen_pos3.xy / loadingscreen_pos3.z;
    vec2 topleft     = min(dpos1.xy, min(dpos2.xy, dpos3.xy));
    vec2 bottomright = max(dpos1.xy, max(dpos2.xy, dpos3.xy));
    ivec2 size = ivec2(bottomright - topleft);

    float animationA = originalColour.a;

    bool isRedLoadingBackground = toint(originalColour.rgb) == 0xef323d;
    bool isProgressBar = toint(originalColour.rgb) == 0xffffff && size.x <= (screenSize.x / 2) && size.x > 2 && size.y <= 6 && size.y >= 4;
    bool isLoadingScreenElement = isRedLoadingBackground || isProgressBar;

    if(isRedLoadingBackground) {
        vec2 coord = gl_FragCoord.xy / screenSize.xy;
        float aspect = screenSize.y / screenSize.x;
        coord.y *= aspect;
        #define LOADINGSCREEN_CENTERED_COORD
        #ifdef LOADINGSCREEN_CENTERED_COORD
        coord -= vec2(0.5, 0.5 * aspect);
        #endif
        float d = max(length(vec2(coord.x, 0.)), length(vec2(0., coord.y)));
        if(d < ease(1 - (originalColour.a))) {
            discard;
        }

        vec4 modifiedColour = tovec(LOADING_SCREEN_COLOUR);
        return vec4(modifiedColour.rgb, modifiedColour.a);
    }

    if(isProgressBar) {
        vec4 modifiedColour = tovec(LOADING_PROGRESS_COLOUR);
        return vec4(modifiedColour.rgb, modifiedColour.a * originalColour.a);
    }

    return originalColour;
}