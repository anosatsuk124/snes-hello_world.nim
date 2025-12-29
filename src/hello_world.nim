import snes

#[
extern char tilfont, palfont;

//---------------------------------------------------------------------------------
int main(void)
{
    // Initialize text console with our font
    consoleSetTextMapPtr(0x6800);
    consoleSetTextGfxPtr(0x3000);
    consoleSetTextOffset(0x0100);
    consoleInitText(0, 16 * 2, &tilfont, &palfont);

    // Init background
    bgSetGfxPtr(0, 0x2000);
    bgSetMapPtr(0, 0x6800, SC_32x32);

    // Now Put in 16 color mode and disable Bgs except current
    setMode(BG_MODE1, 0);
    bgSetDisable(1);
    bgSetDisable(2);

    // Draw a wonderful text :P
    consoleDrawText(10, 10, "Hello World !");
    consoleDrawText(6, 14, "WELCOME TO PVSNESLIB");
    consoleDrawText(3, 18, "HTTPS://WWW.PORTABLEDEV.COM");

    // Wait for nothing :P
    setScreenOn();

    while (1)
    {
        WaitForVBlank();
    }
    return 0;
}
]#

var tilfont* {.importc: "tilfont".}: u8
var palfont* {.importc: "palfont".}: u8

proc main*(): cint {.exportc, cdecl.} =
  consoleSetTextMapPtr(0x6800)
  consoleSetTextGfxPtr(0x3000)
  consoleSetTextOffset(0x0100)
  consoleInitText(0, (16 * 2), addr tilfont, addr palfont)

  bgSetGfxPtr(0, 0x2000)
  bgSetMapPtr(0, 0x6800, SC_32x32)

  setMode(BG_MODE1, 0)
  bgSetDisable(1)
  bgSetDisable(2)

  consoleDrawText(10, 10, "Hello World !")
  consoleDrawText(6, 14, "WELCOME TO PVSNESLIB")
  consoleDrawText(3, 18, "HTTPS://WWW.PORTABLEDEV.COM")

  setScreenOn()

  while true:
    WaitForVBlank()

  return 0
