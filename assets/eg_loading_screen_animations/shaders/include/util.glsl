#define BPUI_UTIL

int toint(vec3 col) {
   ivec3 icol = ivec3(col*255.);
   return int((icol.r << 16) + (icol.g << 8) + icol.b);
}
uint toint(vec4 col) {
   ivec4 icol = ivec4(col*255.);
   return uint((icol.r << 24) + (icol.g << 16) + (icol.b << 8) + icol.a);
}
vec4 tovec(uint col) {
    return vec4(col >> 24 % 256, (col >> 16) % 256u, (col >> 8) % 256u, col % 256u) / 255.;
}
