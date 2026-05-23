#include <3ds.h>
#include <stdio.h>
#include "gui.hpp"

void guiInit() {
    consoleClear();
}

void guiDraw() {
    consoleClear();

    printf("Chicken3DS\\n");
    printf("=====================\\n");
    printf("Transforme ZIP em CIA\\n\\n");

    printf("A = Converter\\n");
    printf("START = Sair\\n");
}
void guiExit() {
}
