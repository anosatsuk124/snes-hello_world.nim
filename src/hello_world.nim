import snes

var tilfont* {.importc: "tilfont".}: u8
var palfont* {.importc: "palfont".}: u8

proc nim_main*(): cint {.exportc, cdecl.} =
  consoleSetTextMapPtr(0x6800)
  consoleSetTextGfxPtr(0x3000)
  consoleSetTextOffset(0x0100)
  consoleInitText(0, (16 * 2), addr tilfont, addr palfont)

  bgSetGfxPtr(0, 0x2000)
  bgSetMapPtr(0, 0x6800, SC_32x32)

  setMode(BG_MODE1, 0)
  bgSetDisable(1)
  bgSetDisable(2)

  consoleDrawText(10, 10, "Hello World from Nim !")
  consoleDrawText(6, 14, "WELCOME TO PVSNESLIB FROM **NIM** WORLD")

  setScreenOn()

  while true:
    WaitForVBlank()

  return 0
