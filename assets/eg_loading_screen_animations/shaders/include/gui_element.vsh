out vec3 loadingscreen_pos1;
out vec3 loadingscreen_pos2;
out vec3 loadingscreen_pos3;

void loadingscreen_main(vec3 positionAttribute) {
    loadingscreen_pos1 = loadingscreen_pos2 = loadingscreen_pos3 = vec3(0.0);
    switch (gl_VertexID % 4) {
        case 0: loadingscreen_pos1 = vec3(positionAttribute.xy, 1.0); break;
        case 1: loadingscreen_pos2 = vec3(positionAttribute.xy, 1.0); break;
        case 2: loadingscreen_pos3 = vec3(positionAttribute.xy, 1.0); break;
    }
}
