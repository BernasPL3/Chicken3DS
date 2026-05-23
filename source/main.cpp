#include <3ds.h>
#include <citro2d.h>
#include "gui.hpp"

int main() {
    gfxInitDefault();
    consoleInit(GFX_TOP, NULL);

    guiInit();

    while (aptMainLoop()) {
        hidScanInput();

        u32 kDown = hidKeysDown();

        if (kDown & KEY_START)
            break;

        guiDraw();
        gfxFlushBuffers();
        gfxSwapBuffers();
        gspWaitForVBlank();
    }

    guiExit();
    gfxExit();
    return 0;
}
