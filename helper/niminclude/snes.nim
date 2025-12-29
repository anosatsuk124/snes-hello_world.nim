import helper
export helper
## ---------------------------------------------------------------------------------
##
##     Copyright (C) 2012-2024
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##
##     1.	The origin of this software must not be misrepresented; you
##         must not claim that you wrote the original software. If you use
##         this software in a product, an acknowledgment in the product
##         documentation would be appreciated but is not required.
##
##     2.	Altered source versions must be plainly marked as such, and
##         must not be misrepresented as being the original software.
##
##     3.	This notice may not be removed or altered from any source
##         distribution.
##
## ---------------------------------------------------------------------------------
## ! \file snes/snes.h
## \brief the master include file for snes applications.
##
## !
##  \mainpage PVSnesLib Documentation
##
##
##  \section intro Introduction
##  Welcome to the PVSnesLib reference documentation.
##
##  \section video_2D_api 2D engine API
##  - \ref snes/video.h "General video"
##  - \ref snes/background.h "2D Background Layers"
##  - \ref snes/lzss.h "LZ decompression routine"
##  - \ref snes/pixel.h "Pixel mode management"
##  - \ref snes/sprite.h "2D Sprites"
##
##  \section audio_api Audio API
##  - \ref snes/sound.h "Mod tracker and Sound Engine"
##
##  \section memory_api Memory
##  - \ref snes/dma.h "Direct Memory Access"
##
##  \section system_api System
##  - \ref snes/snestypes.h "Custom SNES types"
##  - \ref snes/interrupt.h "Interrupts"
##
##  \section user_io_api User Input/output
##  - \ref snes/input.h "Keypad"
##  - \ref snes/console.h "Console and Debug Printing"
##
##  \section engine_api Engine API functions
##  - \ref snes/object.h "Objects management"
##  - \ref snes/map.h "map management"
##
##  \section misc_api Miscellaneous functions
##  - \ref snes/scores.h "Scoring management"
##
##  \section external_links Useful links
##  - <a href="https://github.com/alekmaul/pvsneslib/wiki">PVSnesLib wiki</a>
##  - <a href="https://problemkaputt.de/fullsnes.htm">SNES hardware specifications documentation.</a>
##  - <a href="http://code.google.com/p/snes-sdk/">SNES Sdk from Ulrich Hecht.</a>
##
##  \section special_thanks Special Thanks
##  - <a href="http://shiru.untergrund.net/">shiru for some source code and sound tools, which are parts of PVSnesLib.</a>
##  - <a href="http://jiggawatt.org/badc0de/index.html">mic_ for some source code examples, parts of PVSnesLib are from them.</a>
##  - <a href="http://snes.mukunda.com/">mukunda for snesmod source code. </a>
##  - Kung Fu Furby for help on Snesmod conversion to PVSnesLib.
##  - <a href="http://code.google.com/p/neo-myth-menu/">Neoflash Menu google code. </a>
##  - <a href="http://www.devkitpro.org/">Devkitpro team for pvsneslib structure (lib, makefile, examples, and so on ...). </a>
##  - <a href="https://github.com/undisbeliever/castle_platformer">undisbeliever for his great platform code example on github. </a>
##  - <a href="https://github.com/DigiDwrf">digidwrf for fastrom / hirom support, mouse and superscope support. </a>
##
##  adding the example page.
## !
##  <!-- EXAMPLES -->
##     <!-- hello world -->
##     \example hello_world/src/hello_world.c
##
##     <!-- backgrounds -->
##     \example graphics/Backgrounds/Mode0/Mode0.c
##     \example graphics/Backgrounds/Mode1/Mode1.c
##     \example graphics/Backgrounds/Mode1BG3HighPriority/Mode1BG3HighPriority.c
##     \example graphics/Backgrounds/Mode1ContinuosScroll/Mode1ContinuosScroll.c
##     \example graphics/Backgrounds/Mode1LZ77/Mode1LZ77.c
##     \example graphics/Backgrounds/Mode1MixedScroll/Mode1MixedScroll.c
##     \example graphics/Backgrounds/Mode1Png/Mode1.c
##     \example graphics/Backgrounds/Mode1Scroll/Mode1Scroll.c
##     \example graphics/Backgrounds/Mode3/Mode3.c
##     \example graphics/Backgrounds/Mode5/Mode5.c
##     \example graphics/Backgrounds/Mode7/Mode7.c
##     \example graphics/Backgrounds/Mode7Perspective/Mode7Perspective.c
##
##     <!-- effects -->
##     \example graphics/Effects/Fading/Fading.c
##     \example graphics/Effects/GradientColors/GradientColors.c
##     \example graphics/Effects/HDMAGradient/HDMAGradient.c
##     \example graphics/Effects/MosaicShading/MosaicShading.c
##     \example graphics/Effects/ParallaxScrolling/ParallaxScrolling.c
##     \example graphics/Effects/Transparency/Transparency.c
##     \example graphics/Effects/TransparentWindow/src/main.c
##     \example graphics/Effects/Waves/Waves.c
##     \example graphics/Effects/Window/Window.c
##
##     <!-- sprites -->
##     \example graphics/Sprites/AnimatedSprite/AnimatedSprite.c
##     \example graphics/Sprites/DynamicEngineMetaSprite/DynamicEngineMetaSprite.c
##     \example graphics/Sprites/DynamicEngineSprite/DynamicEngineSprite.c
##     \example graphics/Sprites/DynamicSprite/DynamicSprite.c
##     \example graphics/Sprites/ObjectSize/ObjectSize.c
##     \example graphics/Sprites/SimpleSprite/SimpleSprite.c
##
##     <!-- palettes -->
##     \example graphics/Palette/GetColors/GetColors.c
##
##     <!-- inputs -->
##     \example input/controller/controller.c
##     \example input/mouse/mouse.c
##     \example input/multiplay5/multiplay5.c
##     \example input/superscope/superscope.c
##
##     <!-- timing -->
##     \example timer/timer.c
##
##     <!-- games -->
##     \example games/likemario/LikeMario.c
##     \example games/breakout/breakout.c
##
##     <!-- audio -->
##     \example audio/effects/effects.c
##     \example audio/effectsandmusic/effectsandmusic.c
##     \example audio/music/Music.c
##     \example audio/tada/Tada.c
##     \example audio/musicGreaterThan32k/musicGreaterThan32k.c
##
##     <!-- maps -->
##     \example maps/mapscroll/mapscroll.c
##     \example maps/tiled/tiled.c
##
##     <!-- objects -->
##     \example objects/mapandobjects/mapandobjects.c
##     \example objects/moveobjects/moveobjects.c
##     \example objects/nogravityobject/nogravityobjects.c
##
##     <!-- debugging -->
##     \example debug/debug.c
##     \example breakpoints/src/breakpoints.c
##
##     <!-- random display -->
##     \example random/random.c
##
##     <!-- sram -->
##     \example sram/sramoffset/sramoffset.c
##     \example sram/sramsimple/sram.c
##
##     <!-- scoring -->
##     \example scoring/scoring.c
##
##     <!-- region test, console type and rom type -->
##     \example testregion/testregion.c
##     \example typeconsole/src/pal_ntsc.c
##     \example memory_mapping/src/memory_mapping.c
##
##

## ---------------------------------------------------------------------------------
##
##     snes/background.h -- definitions for SNES backgrounds
##
##     Copyright (C) 2012-2017
##         Alekmaul
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##     must not claim that you wrote the original software. If you use
##     this software in a product, an acknowledgment in the product
##     documentation would be appreciated but is not required.
##
##     2.	Altered source versions must be plainly marked as such, and
##     must not be misrepresented as being the original software.
##
##     3.	This notice may not be removed or altered from any source
##     distribution.
##
## ---------------------------------------------------------------------------------
##  \file snes/background.h
##     \brief snes background defines and functionality.
##
##
##

##  \brief The shift to apply to map base when storing it in a tile map location register

const
  SC_BASE_SHIFT* = 2

##  \brief Macro to set the tile map address in tile map location

template SC_TILE_BASE*(base: untyped): untyped =
  ((base) shl SC_BASE_SHIFT)

##  Bit defines for the background control registers

const
  SC_32x32* = (0 shl 0)           ##  \brief 32 x 32 tile size
  SC_64x32* = (1 shl 0)           ##  \brief 64 x 32 tile size
  SC_32x64* = (2 shl 0)           ##  \brief 32 x 64 tile size
  SC_64x64* = (3 shl 0)           ##  \brief 64 x 64 tile size
  BG_MODE0* = (0 shl 0)           ##  \brief 4-color     4-color     4-color     4-color   ;Normal
  BG_MODE1* = (1 shl 0)           ##  \brief 16-color    16-color    4-color     -         ;Normal
  BG_MODE2* = (2 shl 0)           ##  \brief 16-color    16-color    (o.p.t)     -         ;Offset-per-tile
  BG_MODE3* = (3 shl 0)           ##  \brief 256-color   16-color    -           -         ;Normal
  BG_MODE4* = (4 shl 0)           ##  \brief 256-color   4-color     (o.p.t)     -         ;Offset-per-tile
  BG_MODE5* = (5 shl 0)           ##  \brief 16-color    4-color     -           -         ;512-pix-hires
  BG_MODE6* = (6 shl 0)           ##  \brief 16-color    -           (o.p.t)     -         ;512-pix plus Offs-p-t
  BG_MODE7* = (7 shl 0)           ##  \brief 256-color   EXTBG       -           -         ;Rotation/Scaling
  BG1_TSIZE8x8* = (0 shl 4)
  BG2_TSIZE8x8* = (0 shl 5)
  BG3_TSIZE8x8* = (0 shl 6)
  BG4_TSIZE8x8* = (0 shl 7)
  BG1_TSIZE16x16* = (1 shl 4)
  BG2_TSIZE16x16* = (1 shl 5)
  BG3_TSIZE16x16* = (1 shl 6)
  BG4_TSIZE16x16* = (1 shl 7)
  BG1_ENABLE* = (1 shl 0)
  BG2_ENABLE* = (1 shl 1)
  BG3_ENABLE* = (1 shl 2)
  BG4_ENABLE* = (1 shl 3)
  OBJ_ENABLE* = (1 shl 4)
  BG_4COLORS0* = 32
  BG_4COLORS* = 4
  BG_16COLORS* = 16
  BG_256COLORS* = 256
  BG3_MODE1_PRIORITY_HIGH* = (1 shl 3)
  BG_TIL_PRIO* = (1 shl 13)       ##  \brief 1 for priority in tile attributes

template BG_TIL_PAL*(n: untyped): untyped =
  (n shl 10)                    ##  \brief 0 to 7 for palette in tile attributes

template BG_TIL_NUM*(n: untyped): untyped =
  (n shl 0)                     ##  \brief 0 to nnn for tile number in tile attributes

const
  BG_TIL_FLIPX* = (1 shl 14)      ##  \brief 1 to flip on X in tile attributes
  BG_TIL_FLIPY* = (1 shl 15)      ##  \brief 1 to flip on Y in tile attributes

##  \def REG_BGMODE
##     \brief BG Mode and BG Character Size (W)
##     7    BG4 Tile Size (0=8x8, 1=16x16)  ;\(BgMode0..4: variable 8x8 or 16x16)
##     6    BG3 Tile Size (0=8x8, 1=16x16)  ; (BgMode5: 8x8 acts as 16x8)
##     5    BG2 Tile Size (0=8x8, 1=16x16)  ; (BgMode6: fixed 16x8?)
##     4    BG1 Tile Size (0=8x8, 1=16x16)  ;/(BgMode7: fixed 8x8)
##     3    BG3 Priority in Mode 1 (0=Normal, 1=High)
##     2-0  BG Screen Mode (0..7 = see below)
##
##     The BG Screen Modes are:
##
##     Mode   BG1         BG2         BG3         BG4
##     0      4-color     4-color     4-color     4-color   ;Normal
##     1      16-color    16-color    4-color     -         ;Normal
##     2      16-color    16-color    (o.p.t)     -         ;Offset-per-tile
##     3      256-color   16-color    -           -         ;Normal
##     4      256-color   4-color     (o.p.t)     -         ;Offset-per-tile
##     5      16-color    4-color     -           -         ;512-pix-hires
##     6      16-color    -           (o.p.t)     -         ;512-pix plus Offs-p-t
##     7      256-color   EXTBG       -           -         ;Rotation/Scaling
##
##     Mode 7 supports rotation/scaling and extbg (but doesn't support hv-flip).
##     Mode 5/6 don't support screen addition/subtraction.
##     CG Direct Select is support on BG1 of Mode 3/4, and on BG1/BG2? of Mode 7.
##

template REG_BGMODE*: untyped = (cast[ptr vuint8](0x2105)[])

##  \def REG_MOSAIC
##     \brief Mosaic Size and Mosaic Enable (W)
##     Allows to divide the BG layer into NxN pixel blocks, in each block,
##     the hardware picks the upper-left pixel of each block, and fills the
##     whole block by the color - thus effectively reducing the screen resolution.
##
##     7-4  Mosaic Size        (0=Smallest/1x1, 0Fh=Largest/16x16)
##     3    BG4 Mosaic Enable  (0=Off, 1=On)
##     2    BG3 Mosaic Enable  (0=Off, 1=On)
##     1    BG2 Mosaic Enable  (0=Off, 1=On)
##     0    BG1 Mosaic Enable  (0=Off, 1=On)
##
##     Horizontally, the first block is always located on the left edge of the
##     TV screen. Vertically, the first block is located on the top of the TV screen.
##     When changing the mosaic size mid-frame, the hardware does first finish current
##     block (using the old vertical size) before applying the new vertical size.
##     Technically, vertical mosaic is implemented as so: subtract the vertical
##     index (within the current block) from the vertical scroll register (BGnVOFS).
##

template REG_MOSAIC*: untyped = (cast[ptr vuint8](0x2106)[])

##  \def REG_BG1SC
##     \def REG_BG2SC	(*(vuint8*)0x2108)
##     \def REG_BG3SC	(*(vuint8*)0x2109)
##     \def REG_BG4SC	(*(vuint8*)0x210A)
##     \brief BGx Screen Base and Screen Size (W)
##     2107h - BG1SC - BG1 Screen Base and Screen Size (W)
##     2108h - BG2SC - BG2 Screen Base and Screen Size (W)
##     2109h - BG3SC - BG3 Screen Base and Screen Size (W)
##     210Ah - BG4SC - BG4 Screen Base and Screen Size (W)
##
##     7-2  SC Base Address in VRAM (in 1K-word steps, aka 2K-byte steps)
##     1-0  SC Size (0=One-Screen, 1=V-Mirror, 2=H-Mirror, 3=Four-Screen)
##                     (0=32x32, 1=64x32, 2=32x64, 3=64x64 tiles)
##                 (0: SC0 SC0    1: SC0 SC1  2: SC0 SC0  3: SC0 SC1   )
##                 (   SC0 SC0       SC0 SC1     SC1 SC1     SC2 SC3   )
##
##

const
  BG1SC_ADDR* = 0x2107

template REG_BG1SC*: untyped = (cast[ptr vuint8](0x2107)[])
template REG_BG2SC*: untyped = (cast[ptr vuint8](0x2108)[])
template REG_BG3SC*: untyped = (cast[ptr vuint8](0x2109)[])
template REG_BG4SC*: untyped = (cast[ptr vuint8](0x210A)[])

##  \def REG_BG12NBA
##     \brief BG Character Data Area Designation (W)
##     15-12 BG4 Tile Base Address (in 4K-word steps)
##     11-8  BG3 Tile Base Address (in 4K-word steps)
##     7-4   BG2 Tile Base Address (in 4K-word steps)
##     3-0   BG1 Tile Base Address (in 4K-word steps)
##
## Ignored in Mode 7 (Base is always zero)
##

template REG_BG12NBA*: untyped = (cast[ptr vuint8](0x210B)[])
template REG_BG34NBA*: untyped = (cast[ptr vuint8](0x210C)[])

##  \brief BGx Horizontal Scroll (X) (W) and M7HOFS

const
  REG_BGxHOFS* = 0x210D

##  \brief BGx Vertical Scroll (Y) (W) and M7VOFS

const
  REG_BGxVOFS* = 0x210E

##  \brief BG1 Horizontal Scroll (X) (W) and M7HOFS

template REG_BG1HOFS*: untyped = (cast[ptr vuint8](0x210D)[])

##  \brief BG1 Vertical Scroll (Y) (W) and M7VOFS

template REG_BG1VOFS*: untyped = (cast[ptr vuint8](0x210E)[])

##  \brief BG2 Horizontal Scroll (X) (W)

template REG_BG2HOFS*: untyped = (cast[ptr vuint8](0x210F)[])

##  \brief BG2 Vertical Scroll (Y) (W)

template REG_BG2VOFS*: untyped = (cast[ptr vuint8](0x2110)[])

##  \brief BG3 Horizontal Scroll (X) (W)

template REG_BG3HOFS*: untyped = (cast[ptr vuint8](0x2111)[])

##  \brief BG3 Vertical Scroll (Y) (W)

template REG_BG3VOFS*: untyped = (cast[ptr vuint8](0x2112)[])

##  \brief BG4 Horizontal Scroll (X) (W)

template REG_BG4HOFS*: untyped = (cast[ptr vuint8](0x2113)[])

##  \brief BG4 Vertical Scroll (Y) (W)

template REG_BG4VOFS*: untyped = (cast[ptr vuint8](0x2114)[])

const
  COLWIN_OB13W1ENABLEIN* = (1 shl 0) ##  \brief BG1   BG3   OBJ   Window-1 Area Inside
  COLWIN_OB13W1ENABLEOUT* = (2 shl 0) ##  \brief BG1   BG3   OBJ   Window-1 Area Outside
  COLWIN_OB13W2ENABLEIN* = (1 shl 2) ##  \brief BG1   BG3   OBJ   Window-2 Area Inside
  COLWIN_OB13W2ENABLEOUT* = (2 shl 2) ##  \brief BG1   BG3   OBJ   Window-2 Area Outside
  COLWIN_MB24W1ENABLEIN* = (1 shl 4) ##  \brief BG2   BG4   MATH  Window-1 Area Inside
  COLWIN_MB24W1ENABLEOUT* = (2 shl 4) ##  \brief BG2   BG4   MATH  Window-1 Area Outside
  COLWIN_MB24W2ENABLEIN* = (1 shl 6) ##  \brief BG2   BG4   MATH  Window-2 Area Inside
  COLWIN_MB24W2ENABLEOUT* = (2 shl 6) ##  \brief BG2   BG4   MATH  Window-2 Area Outside

##  \def REG_W12SEL
##     \brief Window BG1/BG2 Mask Settings (W)
##     2123h - W12SEL - Window BG1/BG2 Mask Settings (W)
##     2124h - W34SEL - Window BG3/BG4 Mask Settings (W)
##     2125h - WOBJSEL - Window OBJ/MATH Mask Settings (W)
##     Bit  2123h 2124h 2125h
##     7-6  BG2   BG4   MATH  Window-2 Area (0..1=Disable, 1=Inside, 2=Outside)
##     5-4  BG2   BG4   MATH  Window-1 Area (0..1=Disable, 1=Inside, 2=Outside)
##     3-2  BG1   BG3   OBJ   Window-2 Area (0..1=Disable, 1=Inside, 2=Outside)
##     1-0  BG1   BG3   OBJ   Window-1 Area (0..1=Disable, 1=Inside, 2=Outside)
##

template REG_W12SEL*: untyped = (cast[ptr vuint8](0x2123)[])
template REG_W34SEL*: untyped = (cast[ptr vuint8](0x2124)[])
template REG_WOBJSEL*: untyped = (cast[ptr vuint8](0x2125)[])

##  \def REG_WH0
##     \brief Window 1 Left Position (X1) (W)
##     2126h - WH0 - Window 1 Left Position (X1) (W)
##     2127h - WH1 - Window 1 Right Position (X2) (W)
##     2128h - WH2 - Window 2 Left Position (X1) (W)
##     2129h - WH3 - Window 2 Right Position (X2) (W)
##     7-0   Window Position (00h..0FFh; 0=leftmost, 255=rightmost)
##
##     Specifies the horizontal boundaries of the windows. Note that there
##     are no vertical boundaries (these could be implemented by manipulating the window registers
##     via IRQ and/or HDMA).
##     The "inside-window" region extends from X1 to X2 (that, including the X1 and X2 coordinates), so
##     the window width is X2-X1+1. If the width is zero (or negative), then the "inside-window" becomes
##     empty, and the whole screen will be treated "outside-window".
##

template REG_WH0*: untyped = (cast[ptr vuint8](0x2126)[])
template REG_WH1*: untyped = (cast[ptr vuint8](0x2127)[])
template REG_WH2*: untyped = (cast[ptr vuint8](0x2128)[])
template REG_WH3*: untyped = (cast[ptr vuint8](0x2129)[])

##  \def REG_WBGLOG
##     \brief Window 1/2 Mask Logic (W)
##     212Ah/212Bh - WBGLOG/WOBJLOG - Window 1/2 Mask Logic (W)
##     Bit  212Ah 212Bh
##     7-6  BG4   -     Window 1/2 Mask Logic (0=OR, 1=AND, 2=XOR, 3=XNOR)
##     5-4  BG3   -     Window 1/2 Mask Logic (0=OR, 1=AND, 2=XOR, 3=XNOR)
##     3-2  BG2   MATH  Window 1/2 Mask Logic (0=OR, 1=AND, 2=XOR, 3=XNOR)
##     1-0  BG1   OBJ   Window 1/2 Mask Logic (0=OR, 1=AND, 2=XOR, 3=XNOR)
##     Allows to merge the Window 1 and 2 areas into a single "final" window area
##     (which is then used by TMW, TSW, and CGWSEL). The OR/AND/XOR/XNOR logic is
##     applied ONLY if BOTH window 1 and 2 are enabled (in WxxSEL registers).
##     If only one window is enabled, then that window is used as is as "final"
##     area. If both are disabled, then the "final" area will be empty. Note:
##     "XNOR" means "1 XOR area1 XOR area2" (ie. the inverse of the normal XOR result).
##

template REG_WBGLOG*: untyped = (cast[ptr vuint8](0x212A)[])
template REG_WOBJLOG*: untyped = (cast[ptr vuint8](0x212B)[])

##  \def REG_TM
##     \def REG_TS
##     \brief  TM - Main Screen Designation (W)
##             TS - Sub Screen Designation (W)
##
##   7-5  Not used
##   4    OBJ (0=Disable, 1=Enable)
##   3    BG4 (0=Disable, 1=Enable)
##   2    BG3 (0=Disable, 1=Enable)
##   1    BG2 (0=Disable, 1=Enable)
##   0    BG1 (0=Disable, 1=Enable)
##   -    Backdrop (Always enabled)
##
##     Allows to enable/disable video layers. The Main screen is the "normal" display.
##     The Sub screen is used only for Color Math and for 512-pixel Hires Mode.
##

template REG_TM*: untyped = (cast[ptr vuint8](0x212C)[])
template REG_TS*: untyped = (cast[ptr vuint8](0x212D)[])

##  \def REG_TMW
##     \brief Window Area Main Screen Disable (W)
##     212Eh - TMW - Window Area Main Screen Disable (W)
##     212Fh - TSW - Window Area Sub Screen Disable (W)
##     7-5  Not used
##     4    OBJ (0=Enable, 1=Disable)  ;\"Disable" forcefully disables the layer
##     3    BG4 (0=Enable, 1=Disable)  ; within the window area (otherwise it is
##     2    BG3 (0=Enable, 1=Disable)  ; enabled or disabled as selected in the
##     1    BG2 (0=Enable, 1=Disable)  ; master enable bits in port 212Ch/212Dh)
##     0    BG1 (0=Enable, 1=Disable)  ;/
##     -    Backdrop (Always enabled)
##     Allows to disable video layers within the window region.
##

template REG_TMW*: untyped = (cast[ptr vuint8](0x212E)[])
template REG_TSW*: untyped = (cast[ptr vuint8](0x212F)[])

##  background address

var bg0gfxaddr* {.header: "snes/background.h".}: u16

## \brief Definition of each background address

var bg1gfxaddr* {.header: "snes/background.h".}: u16

## \brief Definition of each background address

var bg2gfxaddr* {.header: "snes/background.h".}: u16

## \brief Definition of each background address

var bg3gfxaddr* {.header: "snes/background.h".}: u16

## \brief Definition of each background address
## \brief Change Background Char address
##     \param bgNumber	background number (0 to 3)
##     \param address	address of tile graphics (4K aligned)
##

proc bgSetGfxPtr*(bgNumber: u8; address: u16) {.cdecl, importc: "bgSetGfxPtr",
    header: "snes/background.h".}
## \brief Change Background Map address
##     \param bgNumber	background number (0 to 3)
##     \param address	address of tile map
##     \param mapSize-> map size (0=32x32, 1=64x32, 2=32x64, 3=64x64 tiles)
##

proc bgSetMapPtr*(bgNumber: u8; address: u16; mapSize: u8) {.cdecl,
    importc: "bgSetMapPtr", header: "snes/background.h".}
## \brief Initializes a Tile Set and Loads the Tile GFX into VRAM
##     \param bgNumber	background number (0 to 3)
##     \param tileSource	address of tile graphics entry
##     \param tilePalette	address of palette entry
##     \param paletteEntry palette number (0..16 for 16 colors mode) of the beginning of each colors
##     \param tileSize	size of tile graphics
##     \param paletteSize	size of palette
##     \param colorMode	used for correct palette entry (BG_4COLORS0, BG_16COLORS, BG_256COLORS)
##     \param address	address of tile graphics (4K aligned)
##

proc bgInitTileSet*(bgNumber: u8; tileSource: ptr u8; tilePalette: ptr u8;
 paletteSize: u16; colorMode: u16; address: u16) {.
    cdecl, importc: "bgInitTileSetLz", header: "snes/background.h".}
## \brief Add some Tile Set and Loads the Tile GFX into VRAM
##     \param bgNumber	background number (0 to 3, 0xff to not change gfx pointer)
##     \param tileSource	address of tile graphics entry
##     \param tileSize	size of tile graphics
##     \param address	address of tile graphics (4K aligned)
##

proc bgInitTileSetData*(bgNumber: u8; tileSource: ptr u8; tileSize: u16; address: u16) {.
    cdecl, importc: "bgInitTileSetData", header: "snes/background.h".}
## \brief Initializes a Tile & Map Set and Loads the Tile & Map GFX into VRAM for Mode 7
##     \param tileSource	address of tile graphics entry
##     \param mapSource	address of map entry
##     \param tilePalette	address of palette entry
##     \param tileSize	size of tile graphics
##     \param address	address of tile graphics (4K aligned)
##

proc bgInitMapTileSet7*(tileSource: ptr u8; mapSource: ptr u8; tilePalette: ptr u8;
                       tileSize: u16; address: u16) {.cdecl,
    importc: "bgInitMapTileSet7", header: "snes/background.h".}
## \brief Initializes a Map Set and loads it into SNES VRAM
##     \param bgNumber	background number (0 to 3, 0xff to not change map pointer)
##     \param mapSource	address of map entry
##     \param mapSize	size of map
##     \param sizeMode	used for correct tile mapping (SC_32x32, SC_64x32, SC_32x64, SC_64x64)
##     \param address	address of map
##

proc bgInitMapSet*(bgNumber: u8; mapSource: ptr u8; mapSize: u16; sizeMode: u8;
                  address: u16) {.cdecl, importc: "bgInitMapSet",
                                header: "snes/background.h".}
## 	\brief Sets the scroll hardware to the specified location
##     \param bgNumber	background number (0 to 3)
##     \param x	the horizontal scroll
##     \param y	the vertical scroll
##

proc bgSetScroll*(bgNumber: u8; x: u16; y: u16) {.cdecl, importc: "bgSetScroll",
    header: "snes/background.h".}
## 	\brief Enable a BG in the actual SNES mode
##     \param bgNumber	background number (0 to 3 regarding current mode)
##

proc bgSetEnable*(bgNumber: u8) {.cdecl, importc: "bgSetEnable",
                               header: "snes/background.h".}
## 	\brief Disable a BG in the actual SNES mode
##     \param bgNumber	background number (0 to 3 regarding current mode)
##

proc bgSetDisable*(bgNumber: u8) {.cdecl, importc: "bgSetDisable",
                                header: "snes/background.h".}
## 	\brief Enable a BG from sub screen (translucent) in the actual SNES mode
##     \param bgNumber	background number (0 to 3 regarding current mode)
##

proc bgSetEnableSub*(bgNumber: u8) {.cdecl, importc: "bgSetEnableSub",
                                  header: "snes/background.h".}
## 	\brief Disable a BG from sub screen (translucent) in the actual SNES mode
##     \param bgNumber	background number (0 to 3 regarding current mode)
##

proc bgSetDisableSub*(bgNumber: u8) {.cdecl, importc: "bgSetDisableSub",
                                   header: "snes/background.h".}
## 	\brief Define a region on screen where map / sprite can be disable
##     \param bgNumber	background number (0 to 3 regarding current mode)
##     \param winNumber	windows number (0 to 1 regarding current window)
##     \param xLeft	left value where we begin to add map/sprites
##     \param xRight	right value where we stop to add map/sprites
##

proc bgSetWindowsRegions*(bgNumber: u8; winNumber: u8; xLeft: u8; xRight: u8) {.cdecl,
    importc: "bgSetWindowsRegions", header: "snes/background.h".}
## ---------------------------------------------------------------------------------
##
##     Generic console functions.
##
##     Copyright (C) 2012-2017
##         Alekmaul
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##         must not claim that you wrote the original software. If you use
##         this software in a product, an acknowledgment in the product
##         documentation would be appreciated but is not required.
##     2.	Altered source versions must be plainly marked as such, and
##         must not be misrepresented as being the original software.
##     3.	This notice may not be removed or altered from any source
##         distribution.
##
##
## ---------------------------------------------------------------------------------
## ! \file snes/console.h
##     \brief snes generic console support.
##

var scr_txt_font_map* {.header: "snes/console.h".}: array[0x800, u8]

## !< \brief tilemap used for text display

var scr_txt_dirty* {.header: "snes/console.h".}: u8

## !< \brief flag to redraw text during vblank

var snes_vblank_count* {.header: "snes/console.h".}: u16

## !< \brief Number of VBL since consoleInit called (16 bits longs so reset each 18 minutes in NTSC)

var snes_50hz* {.header: "snes/console.h".}: u8

## !< \brief 1 if on a PAL/50Hz SNES

var snes_fps* {.header: "snes/console.h".}: u8

## !< \brief 50 if PAL console (50 Hz) or 60 if NTSC console (60Hz)
## ! \fn rand(void)
##     \brief return a randomized number
##     \return unsigned short of a randozied number
##

proc rand*(): u16 {.cdecl, importc: "rand", header: "snes/console.h".}
## ! \fn consoleUpdate(void);
##     \brief Update current text buffer on screen
##

proc consoleUpdate*() {.cdecl, importc: "consoleUpdate", header: "snes/console.h".}
## ! \brief Initialize the Text System
##     \param palnum	palette entry (0..7)
##     \param palsize	size of palette of text (4,16,etc ...)
##     \param tilfont	Pointer to tiles gfx for printing
##     \param palfont	Pointer to palette of text
##
##     Reserve a BG and load the font characters into VRAM. It will only work in tiled display modes.
##     You can change address of graphics and map with consoleSetTextVramAdr() and consoleSetTextVramBGAdr().
##     Also, consoleSetTextPal can change the text palette.
##

proc consoleInitText*(palnum: u8; palsize: u8; tilfont: ptr u8; palfont: ptr u8) {.cdecl,
    importc: "consoleInitText", header: "snes/console.h".}
## ! \fn consoleSetTextGfxPtr(u16 vramfont)
##     \brief Change text graphics address (4K aligned)
##     \param vramfont	VRAM Background address (4K aligned)  (default is $0800)
##

proc consoleSetTextGfxPtr*(vramfont: u16) {.cdecl, importc: "consoleSetTextGfxPtr",
    header: "snes/console.h".}
## ! \fn consoleSetTextMapPtr(u16 vrambgfont)
##     \brief Change text Background map address for display (must be BG address)
##     \param vrambgfont	VRAM Background map address (default is $0800)
##

proc consoleSetTextMapPtr*(offsetfont: u16) {.cdecl,
    importc: "consoleSetTextMapPtr", header: "snes/console.h".}
## ! \fn consoleSetTextOffset(u16 offsetfont)
##     \brief Change text Background map address for display (must be BG address)
##     \param offsetfont	VRAM offset for text (default is 0, as it is aligned with BG tiles)
##

proc consoleSetTextOffset*(offsetfont: u16) {.cdecl,
    importc: "consoleSetTextOffset", header: "snes/console.h".}
## ! \fn consoleSetTextPal(u8 palnum, u8 *palfont, u8 palsize)
##     \brief Change text font palette
##     \param palnum	palette entry (0..7)
##     \param palfont	pointer to the new palette
##     \param palsize	size of palette of text (4,16,etc ...)
##

proc consoleSetTextPal*(palnum: u8; palfont: ptr u8; palsize: u8) {.cdecl,
    importc: "consoleSetTextPal", header: "snes/console.h".}
## ! \brief Output formatted string on a screen (tiles mode)
##     \param x 	The X character number the string should start on
##     \param y 	The Y character number the string should start on
##     \param fmt 	The Format string (see printf() documentation in your local C tutorial)
##
##     Output a text string to the screen. Before using this, you need to call consoleInitText().
##     You can also print the value of variables this way, by putting a format string and additional parameters.
##

proc consoleDrawText*(x: u16; y: u16; fmt: cstring) {.varargs, cdecl,
    importc: "consoleDrawText", header: "snes/console.h".}
## ! \brief Output formatted string on a screen (2 colors tiles mode)
##     \param x 	The X character number the string should start on
##     \param y 	The Y character number the string should start on
##     \param map 	The 0x800 char map entry to put string
##     \param attributes	attributes for tiles
##     \param fmt 	The Format string (see printf() documentation in your local C tutorial)
##
##     Output a text string to the screen. Before using this, you need to call consoleInitText().
##     You can also print the value of variables this way, by putting a format string and additional parameters.
##

proc consoleDrawTextMap*(x: u16; y: u16; map: ptr u8; attributes: u8; fmt: cstring) {.
    varargs, cdecl, importc: "consoleDrawTextMap", header: "snes/console.h".}
## ! \brief Output formatted string on a screen, centered it (2 colors tiles mode)
##     \param y 	The Y character number the string should start on
##     \param map 	The 0x800 char map entry to put string
##     \param attributes	attributes for tiles
##     \param fmt 	The Format string (see printf() documentation in your local C tutorial)
##
##     Output a text string to the screen. Before using this, you need to call consoleInitText().
##     You can also print the value of variables this way, by putting a format string and additional parameters.
##     The text will be centered on x axis.
##

proc consoleDrawTextMapCenter*(y: u16; map: ptr u16; attributes: u8; fmt: cstring) {.
    varargs, cdecl, importc: "consoleDrawTextMapCenter", header: "snes/console.h".}
## ! \fn  consoleInit()
##     \brief Initialize console
##
##     Generic init for SNES console.
##
##

proc consoleInit*() {.cdecl, importc: "consoleInit", header: "snes/console.h".}
## ! \brief Send a message to the no$sns debug window
##     \param fmt 	The Format string (see printf() documentation in your local C tutorial)
##

proc consoleNocashMessage*(fmt: cstring) {.varargs, cdecl,
                                        importc: "consoleNocashMessage",
                                        header: "snes/console.h".}
## ! \brief Execute the special WDM opcode which Mesen can break on
##

proc consoleMesenBreakpoint*() {.cdecl, importc: "consoleMesenBreakpoint",
                               header: "snes/console.h".}
## ! \brief Send data to SRAM
##     \param source the source to copy from
##     \param size the size in bytes of the data to copy.
##

proc consoleCopySram*(source: ptr u8; size: u16) {.cdecl, importc: "consoleCopySram",
    header: "snes/console.h".}
## ! \brief Load data from SRAM
##     \param dest the destination to load into
##     \param size the size in bytes of the data to copy.
##

proc consoleLoadSram*(dest: ptr u8; size: u16) {.cdecl, importc: "consoleLoadSram",
    header: "snes/console.h".}
## ! \brief Send data to SRAM with offset
##     \param source the source to copy from
##     \param size the size in bytes of the data to copy.
##     \param offset the offset in bytes where the data should be copied
##

proc consoleCopySramWithOffset*(source: ptr u8; size: u16; offset: u16) {.cdecl,
    importc: "consoleCopySramWithOffset", header: "snes/console.h".}
## ! \brief Load data from SRAM with offset
##     \param dest the destination to load into
##     \param size the size in bytes of the data to copy.
##     \param offset the offset from which the data should be loaded
##

proc consoleLoadSramWithOffset*(dest: ptr u8; size: u16; offset: u16) {.cdecl,
    importc: "consoleLoadSramWithOffset", header: "snes/console.h".}
## ! \fn  consoleRegionIsOK()
##     \brief Check compatibility between console (NTSC/PAL) and cartridge (country)
##     \return 1 if cartridge and console are from the same region, 2 if not
##
##     Check if console (PAL / NSTC) is the same as cartrdige region code
##

proc consoleRegionIsOK*(): u16 {.cdecl, importc: "consoleRegionIsOK",
                              header: "snes/console.h".}
proc sprintf*(buf: cstring; fmt: cstring): cint {.varargs, cdecl, importc: "sprintf",
    header: "snes/console.h".}
## ---------------------------------------------------------------------------------
##
##     Copyright (C) 2012-2017
##         Alekmaul
##
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##         must not claim that you wrote the original software. If you use
##         this software in a product, an acknowledgment in the product
##         documentation would be appreciated but is not required.
##
##     2.	Altered source versions must be plainly marked as such, and
##         must not be misrepresented as being the original software.
##
##     3.	This notice may not be removed or altered from any source
##         distribution.
##
## ---------------------------------------------------------------------------------
## ! \file snes/dma.h
## \brief Wrapper functions for direct memory access hardware
##
##

## !	\brief Bit defines for the HDMA channels

const
  HDMA_CHANNEL0* = (1 shl 0)
  HDMA_CHANNEL1* = (1 shl 1)
  HDMA_CHANNEL2* = (1 shl 2)
  HDMA_CHANNEL3* = (1 shl 3)
  HDMA_CHANNEL4* = (1 shl 4)
  HDMA_CHANNEL5* = (1 shl 5)
  HDMA_CHANNEL6* = (1 shl 6)
  HDMA_CHANNEL7* = (1 shl 7)
  HDMA_CHANNELALL* = (HDMA_CHANNEL0 or HDMA_CHANNEL1 or HDMA_CHANNEL2 or
      HDMA_CHANNEL3 or HDMA_CHANNEL4 or HDMA_CHANNEL5 or HDMA_CHANNEL6 or
      HDMA_CHANNEL7)

## !	\brief Bit defines for the window area main screen effect

const
  MSWIN_BG1* = (1 shl 0)          ## !< \brief Main Screen BG1 disable background
  MSWIN_BG2* = (1 shl 1)          ## !< \brief Main Screen BG2 disable background
  MSWIN_BG3* = (1 shl 2)          ## !< \brief Main Screen BG3 disable background
  MSWIN_BG4* = (1 shl 3)          ## !< \brief Main Screen BG4 disable background
  MSWIN1_BG1MSKOUT* = (1 shl 0)   ## !< \brief Window 1 area BG1 inside (0) outside(1)
  MSWIN1_BG1MSKENABLE* = (2 shl 0) ## !< \brief Window 1 area BG1 enable
  MSWIN2_BG1MSKOUT* = (1 shl 2)   ## !< \brief Window 2 area BG1 inside (0) outside(1)
  MSWIN2_BG1MSKENABLE* = (2 shl 2) ## !< \brief Window 2 area BG1 enable
  MSWIN1_BG2MSKOUT* = (1 shl 4)   ## !< \brief Window 1 area BG2 inside (0) outside(1)
  MSWIN1_BG2MSKENABLE* = (2 shl 4) ## !< \brief Window 1 area BG2 enable
  MSWIN2_BG2MSKOUT* = (1 shl 4)   ## !< \brief Window 2 area BG2 inside (0) outside(1)
  MSWIN2_BG2MSKENABLE* = (2 shl 4) ## !< \brief Window 2 area BG2 enable
  MSWIN1_BG3MSKOUT* = (1 shl 0)   ## !< \brief Window 1 area BG3 inside (0) outside(1)
  MSWIN1_BG3MSKENABLE* = (2 shl 0) ## !< \brief Window 1 area BG3 enable
  MSWIN2_BG3MSKOUT* = (1 shl 2)   ## !< \brief Window 2 area BG3 inside (0) outside(1)
  MSWIN2_BG3MSKENABLE* = (2 shl 2) ## !< \brief Window 2 area BG3 enable
  MSWIN1_BG4MSKOUT* = (1 shl 4)   ## !< \brief Window 1 area BG4 inside (0) outside(1)
  MSWIN1_BG4MSKENABLE* = (2 shl 4) ## !< \brief Window 1 area BG4 enable
  MSWIN2_BG4MSKOUT* = (1 shl 4)   ## !< \brief Window 2 area BG4 inside (0) outside(1)
  MSWIN2_BG4MSKENABLE* = (2 shl 4) ## !< \brief Window 2 area BG4 enable

## !	\brief Bit defines for the DMA control registers

const
  DMA_ENABLE* = 1

type
  INNER_C_STRUCT_dma_3* {.importc: "dmaMemory::no_name", header: "snes/dma.h", bycopy.} = object
    `addr`* {.importc: "addr".}: cushort
    bank* {.importc: "bank".}: cuchar
    pad* {.importc: "__pad".}: cuchar

  INNER_C_UNION_dma_2* {.importc: "dmaMemory::no_name", header: "snes/dma.h", bycopy, union.} = object
    c* {.importc: "c".}: INNER_C_STRUCT_dma_3
    p* {.importc: "p".}: pointer

  dmaMemory* {.importc: "dmaMemory", header: "snes/dma.h", bycopy.} = object
    mem* {.importc: "mem".}: INNER_C_UNION_dma_2


## ! \def REG_MDMAEN
##
##     \brief Select General Purpose DMA Channel(s) and Start Transfer (W)
##      7-0   General Purpose DMA Channel 7-0 Enable (0=Disable, 1=Enable)
##
##     When writing a non-zero value to this register, general purpose DMA
##     will be started immediately (after a few clk cycles). The CPU is paused
##     during the transfer. The transfer can be interrupted by H-DMA transfers.
##     If more than 1 bit is set in MDMAEN, then the separate transfers will be
##     executed in WHICH? priority order. The MDMAEN bits are cleared automatically
##     at transfer completion.
##     Do not use channels for GP-DMA which are activated as H-DMA in HDMAEN.
##
##

template REG_MDMAEN*: untyped = (cast[ptr vuint8](0x420B)[])

## ! \def REG_HDMAEN
##
##     \brief Select H-Blank DMA (H-DMA) Channel(s) (W)
##      7-0   H-DMA Channel 7-0 Enable (0=Disable, 1=Enable)
##

template REG_HDMAEN*: untyped = (cast[ptr vuint8](0x420C)[])

## ! \def REG_DMAP0
##     \def REG_DMAP1	(*(vuint8*)0x4310)
##     \def REG_DMAP2	(*(vuint8*)0x4320)
##     \def REG_DMAP3	(*(vuint8*)0x4330)
##     \def REG_DMAP4	(*(vuint8*)0x4340)
##     \def REG_DMAP5	(*(vuint8*)0x4350)
##     \def REG_DMAP6	(*(vuint8*)0x4360)
##     \def REG_DMAP7	(*(vuint8*)0x4370)
##     \brief DMA/HDMA Parameters (R/W)
##     7     Transfer Direction (0=A:CPU to B:I/O, 1=B:I/O to A:CPU)
##     6     Addressing Mode    (0=Direct Table, 1=Indirect Table)    (HDMA only)
##     5     Not used (R/W) (unused and unchanged by all DMA and HDMA)
##     4-3   A-BUS Address Step  (0=Increment, 2=Decrement, 1/3=Fixed) (DMA only)
##     2-0   Transfer Unit Select (0-4=see below, 5-7=Reserved)
##
##     DMA Transfer Unit Selection:
##     Mode  Bytes              B-Bus 21xxh Address   ;Usage Examples...
##     0  =  Transfer 1 byte    xx                    ;eg. for WRAM (port 2180h)
##     1  =  Transfer 2 bytes   xx, xx+1              ;eg. for VRAM (port 2118h/19h)
##     2  =  Transfer 2 bytes   xx, xx                ;eg. for OAM or CGRAM
##     3  =  Transfer 4 bytes   xx, xx,   xx+1, xx+1  ;eg. for BGnxOFS, M7x
##     4  =  Transfer 4 bytes   xx, xx+1, xx+2, xx+3  ;eg. for BGnSC, Window, APU..
##     5  =  Transfer 4 bytes   xx, xx+1, xx,   xx+1  ;whatever purpose, VRAM maybe
##     6  =  Transfer 2 bytes   xx, xx                ;same as mode 2
##     7  =  Transfer 4 bytes   xx, xx,   xx+1, xx+1  ;same as mode 3
##

template REG_DMAP0*: untyped = (cast[ptr vuint8](0x4300)[])
template REG_DMAP1*: untyped = (cast[ptr vuint8](0x4310)[])
template REG_DMAP2*: untyped = (cast[ptr vuint8](0x4320)[])
template REG_DMAP3*: untyped = (cast[ptr vuint8](0x4330)[])
template REG_DMAP4*: untyped = (cast[ptr vuint8](0x4340)[])
template REG_DMAP5*: untyped = (cast[ptr vuint8](0x4350)[])
template REG_DMAP6*: untyped = (cast[ptr vuint8](0x4360)[])
template REG_DMAP7*: untyped = (cast[ptr vuint8](0x4370)[])

## ! \def REG_BBAD0
##     \def REG_BBAD1
##     \def REG_BBAD2
##     \def REG_BBAD3
##     \def REG_BBAD4
##     \def REG_BBAD5
##     \def REG_BBAD6
##     \def REG_BBAD7
##     \brief DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus) (R/W)
##     For both DMA and HDMA:
##     7-0   B-Bus Address (selects an I/O Port which is mapped to 2100h-21FFh)
##

template REG_BBAD0*: untyped = (cast[ptr vuint8](0x4301)[])
template REG_BBAD1*: untyped = (cast[ptr vuint8](0x4311)[])
template REG_BBAD2*: untyped = (cast[ptr vuint8](0x4321)[])
template REG_BBAD3*: untyped = (cast[ptr vuint8](0x4331)[])
template REG_BBAD4*: untyped = (cast[ptr vuint8](0x4341)[])
template REG_BBAD5*: untyped = (cast[ptr vuint8](0x4351)[])
template REG_BBAD6*: untyped = (cast[ptr vuint8](0x4361)[])
template REG_BBAD7*: untyped = (cast[ptr vuint8](0x4371)[])

## ! \def REG_A1T0LH
##     \def REG_A1T1LH
##     \def REG_A1T2LH
##     \def REG_A1T3LH
##     \def REG_A1T4LH
##     \def REG_A1T5LH
##     \def REG_A1T6LH
##     \def REG_A1T7LH
##
##     \def REG_A1B0
##     \def REG_A1B1
##     \def REG_A1B2
##     \def REG_A1B3
##     \def REG_A1B4
##     \def REG_A1B5
##     \def REG_A1B6
##     \def REG_A1B7
##     \brief 	A1TxL - HDMA Table Start Address (low) / DMA Current Addr (low) (R/W)
##     A1TxH - HDMA Table Start Address (hi) / DMA Current Addr (hi) (R/W)
##     A1Bx - HDMA Table Start Address (bank) / DMA Current Addr (bank) (R/W)
##
##     For normal DMA:
##     23-16  CPU-Bus Data Address Bank (constant, not incremented/decremented)
##     15-0   CPU-Bus Data Address (incremented/decremented/fixed, as selected)
##
##     For HDMA:
##     23-16  CPU-Bus Table Address Bank (constant, bank number for 43x8h/43x9h)
##     15-0   CPU-Bus Table Address      (constant, reload value for 43x8h/43x9h)
##

template REG_A1T0LH*: untyped = (cast[ptr vuint16](0x4302)[])
template REG_A1T1LH*: untyped = (cast[ptr vuint16](0x4312)[])
template REG_A1T2LH*: untyped = (cast[ptr vuint16](0x4322)[])
template REG_A1T3LH*: untyped = (cast[ptr vuint16](0x4332)[])
template REG_A1T4LH*: untyped = (cast[ptr vuint16](0x4342)[])
template REG_A1T5LH*: untyped = (cast[ptr vuint16](0x4352)[])
template REG_A1T6LH*: untyped = (cast[ptr vuint16](0x4362)[])
template REG_A1T7LH*: untyped = (cast[ptr vuint16](0x4372)[])
template REG_A1B0*: untyped = (cast[ptr vuint8](0x4304)[])
template REG_A1B1*: untyped = (cast[ptr vuint8](0x4314)[])
template REG_A1B2*: untyped = (cast[ptr vuint8](0x4324)[])
template REG_A1B3*: untyped = (cast[ptr vuint8](0x4334)[])
template REG_A1B4*: untyped = (cast[ptr vuint8](0x4344)[])
template REG_A1B5*: untyped = (cast[ptr vuint8](0x4354)[])
template REG_A1B6*: untyped = (cast[ptr vuint8](0x4364)[])
template REG_A1B7*: untyped = (cast[ptr vuint8](0x4374)[])

## ! \def REG_DAS0LH
##     \def REG_DAS1LH
##     \def REG_DAS2LH
##     \def REG_DAS3LH
##     \def REG_DAS4LH
##     \def REG_DAS5LH
##     \def REG_DAS6LH
##     \def REG_DAS7LH
##     \brief Indirect HDMA Address (low) / DMA Byte-Counter (low) (R/W)
##     DASxL - Indirect HDMA Address (low) / DMA Byte-Counter (low) (R/W)
##     DASxH - Indirect HDMA Address (hi) / DMA Byte-Counter (hi) (R/W)
##     43x7h - DASBx - Indirect HDMA Address (bank) (R/W)
##
##     For normal DMA:
##     23-16  Not used
##     15-0   Number of bytes to be transferred (1..FFFFh=1..FFFFh, or 0=10000h)
##     (This is really a byte-counter; with a 4-byte "Transfer Unit", len=5 would
##     transfer one whole Unit, plus the first byte of the second Unit.)
##     (The 16bit value is decremented during transfer, and contains 0000h on end.)
##

template REG_DAS0LH*: untyped = (cast[ptr vuint16](0x4305)[])
template REG_DAS1LH*: untyped = (cast[ptr vuint16](0x4315)[])
template REG_DAS2LH*: untyped = (cast[ptr vuint16](0x4325)[])
template REG_DAS3LH*: untyped = (cast[ptr vuint16](0x4335)[])
template REG_DAS4LH*: untyped = (cast[ptr vuint16](0x4345)[])
template REG_DAS5LH*: untyped = (cast[ptr vuint16](0x4355)[])
template REG_DAS6LH*: untyped = (cast[ptr vuint16](0x4365)[])
template REG_DAS7LH*: untyped = (cast[ptr vuint16](0x4375)[])

var HDMATable16* {.header: "snes/dma.h".}: array[224 + 1, u8]

## !< \brief HDMA table accessible to change values
## ! \fn  dmaCopyCGram(u8 * source, u16 address, u16 size)
##     \brief copy data from source to destination using channel 0 of DMA available channels in half words
##     \param source the source to copy from
##     \param address cgram address to copy
##     \param size the size in bytes of the data to copy.
##

proc dmaCopyCGram*(source: ptr u8; address: u16; size: u16) {.cdecl,
    importc: "dmaCopyCGram", header: "snes/dma.h".}
## ! \fn  dmaCopyVram(u8 * source, u16 address, u16 size)
##     \brief copy data from source to destination using channel 0 of DMA available channels in half words
##     \param source the source to copy from
##     \param address vram address to copy
##     \param size the size in bytes of the data to copy.
##

proc dmaCopyVram*(source: ptr u8; address: u16; size: u16) {.cdecl,
    importc: "dmaCopyVram", header: "snes/dma.h".}
## ! \fn  dmaCopySpr32Vram(u8 * source, u16 address)
##     \brief copy sprite 32pix size data from source to destination using channel 0 of DMA available channels in half words
##     \param source the source to copy from
##     \param address vram address to copy
##

proc dmaCopySpr32Vram*(source: ptr u8; address: u16) {.cdecl,
    importc: "dmaCopySpr32Vram", header: "snes/dma.h".}
## ! \fn  dmaCopySpr16Vram(u8 * source, u16 address)
##     \brief copy sprite 16pix size data from source to destination using channel 0 of DMA available channels in half words
##     \param source the source to copy from
##     \param address vram address to copy
##

proc dmaCopySpr16Vram*(source: ptr u8; address: u16) {.cdecl,
    importc: "dmaCopySpr16Vram", header: "snes/dma.h".}
## ! \fn  dmaFillVram8(u8 * source, u16 address, u16 size)
##     \brief fill the source data to destination using channel 0 of DMA available channels in half words<br>dmaFillVram is deprecated
##     \param source the value of source to copy from
##     \param address vram address to copy
##     \param size the size in bytes of the data to copy.
##

proc dmaFillVram8*(source: ptr u8; address: u16; size: u16) {.cdecl,
    importc: "dmaFillVram8", header: "snes/dma.h".}
## ! \fn  dmaFillVram16(u16 * source, u16 address, u16 size)
##     \brief fill the source data to destination using channel 0 of DMA available channels in words
##     \param source the value of source to copy from
##     \param address vram address to copy
##     \param size the size in words of the data to copy.
##

proc dmaFillVram16*(source: ptr u16; address: u16; size: u16) {.cdecl,
    importc: "dmaFillVram16", header: "snes/dma.h".}
## ! \fn  dmaClearVram(void)
##     \brief clear all vram data with #0
##

proc dmaClearVram*() {.cdecl, importc: "dmaClearVram", header: "snes/dma.h".}
## ! \fn  dmaCopyOAram(u8 *source, u16 address, u16 size)
##     \brief copies Sprites from source to destination using channel 0 of DMA available channels in half words
##     \param source the source to copy from
##     \param address vram address to copy
##     \param size the size in bytes of the data to copy.
##

proc dmaCopyOAram*(source: ptr u8; address: u16; size: u16) {.cdecl,
    importc: "dmaCopyOAram", header: "snes/dma.h".}
## ! \fn  dmaCopyVram7(u8 *source, u16 address, u16 size, u8 vrammodeinc, u16 dmacontrol)
##     \brief copies data from source to destination using channel 0 of DMA available channels in half words with VMAIN value
##     \param source the source to copy from
##     \param address vram address to copy
##     \param size the size in bytes of the data to copy.
##     \param vrammodeinc the value of REG_VMAIN (incr or not incr).
##     \param dmacontrol the value of DMA control register (incr or not incr, $18 or $19, and so on).
##

proc dmaCopyVram7*(source: ptr u8; address: u16; size: u16; vrammodeinc: u8;
                  dmacontrol: u16) {.cdecl, importc: "dmaCopyVram7", header: "snes/dma.h".}
## ! \fn  setModeHdmaGradient(u8 maxLevels)
##     \brief Do a brightness gradient on screen. Use HDMA Channels 3.
##     \param maxLevels value between 1..15 for the maximum level of brightness (15=light, 1=near dark)
##

proc setModeHdmaGradient*(maxLevels: u8) {.cdecl, importc: "setModeHdmaGradient",
                                        header: "snes/dma.h".}
## ! \fn  setModeHdmaShadeUpDown(void)
##     \brief Do a brightness gradient from up/down to center of the screen. Use HDMA Channels 3.
##

proc setModeHdmaShadeUpDown*() {.cdecl, importc: "setModeHdmaShadeUpDown",
                               header: "snes/dma.h".}
## ! \fn  setModeHdmaShading(unsigned char mode)
##     \brief Do a shading effect on screen. Use HDMA Channels 0 to 2.
##     \param mode value 0 disactivate 1, other value activate it
##

proc setModeHdmaShading*(mode: cuchar) {.cdecl, importc: "setModeHdmaShading",
                                      header: "snes/dma.h".}
## ! \fn  setParallaxScrolling(u8 bgrnd)
##     \brief Do a parallax scrolling effect on screen. Use HDMA Channels 3.
##     \brief use HDMATable16 variable to store scrolling value
##     \brief each entry is number of lines (8bits) and scrolling value 16 bits (low & high)
##     \brief WARNING : no more than 112 values and last value MUST be $0000
##     \param bgrnd background for the parallax scrolling  (value 0..2)
##

proc setParallaxScrolling*(bgrnd: u8) {.cdecl, importc: "setParallaxScrolling",
                                     header: "snes/dma.h".}
## ! \fn  setModeHdmaReset(u8 channels)
##     \brief Reset or Set HDMA channels
## 	\param channels channels from HDMA_CHANNEL0 to HDMA_CHANNEL7. HDMA_CHANNELALL for all channels
##

proc setModeHdmaReset*(channels: u8) {.cdecl, importc: "setModeHdmaReset",
                                    header: "snes/dma.h".}
## ! \fn  void setModeHdmaWindowReset(u8 channels)
##     \brief Reset or Set HDMA channels and remove WINDOW effect
## 	\param channels channels from HDMA_CHANNEL0 to HDMA_CHANNEL7. HDMA_CHANNELALL for all channels
##

proc setModeHdmaWindowReset*(channels: u8) {.cdecl,
    importc: "setModeHdmaWindowReset", header: "snes/dma.h".}
## ! \fn  setModeHdmaColor(u8* hdmatable)
##     \brief Do a color gradient effect on screen (with color 0). Use HDMA Channels 6.
##     \param hdmatable table with gradient colors
##

proc setModeHdmaColor*(hdmatable: ptr u8) {.cdecl, importc: "setModeHdmaColor",
                                        header: "snes/dma.h".}
## ! \fn  setModeHdmaWaves(u8 bgrnd)
##     \brief Do a waves effect on screen (init function). Use HDMA Channels 6.
##     \param bgrnd background for the wave effect (value 0..1)
##

proc setModeHdmaWaves*(bgrnd: u8) {.cdecl, importc: "setModeHdmaWaves",
                                 header: "snes/dma.h".}
## ! \fn  setModeHdmaWavesMove(void)
##     \brief Animate the waves effect. Must be called during each frame.<br> setModeHdmaWaves must have been done to init it.
##

proc setModeHdmaWavesMove*() {.cdecl, importc: "setModeHdmaWavesMove",
                             header: "snes/dma.h".}
## ! \fn  setModeHdmaWindow(u8 bgrnd, u8* hdmatableL,u8* hdmatableR)
##     \brief Do a window  effect on screen. Use HDMA Channels 4 & 5.
##     \param bgrnd background for the windows effect  (value MSWIN_BG1..MSWIN_BG4)
##     \param bgrndmask background mask (inside, outside) for the windows effect  (value MSWIN1_BG13MSKIN..MSWIN1_BG13MSKIN)
##     \param hdmatableL table with windows effect on the left
##     \param hdmatableR table with windows effect on the right
##

proc setModeHdmaWindow*(bgrnd: u8; bgrndmask: u8; hdmatableL: ptr u8; hdmatableR: ptr u8) {.
    cdecl, importc: "setModeHdmaWindow", header: "snes/dma.h".}
## ---------------------------------------------------------------------------------
##
##     Input registers
##
##     Copyright (C) 2012-2013
##         Alekmaul
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##         must not claim that you wrote the original software. If you use
##         this software in a product, an acknowledgment in the product
##         documentation would be appreciated but is not required.
##
##     2.	Altered source versions must be plainly marked as such, and
##         must not be misrepresented as being the original software.
##
##     3.	This notice may not be removed or altered from any source
##         distribution.
##
##
## ---------------------------------------------------------------------------------
## !
##  \file snes/input.h
##  \brief input support.
##
##  The inputs are automatically read by the \ref VBlank-ISR on non-lag frames.
##

## !
##     \brief common values for pad input.
##
##     common values that can be used to test auto pad.
##
## ! enum values for the pad buttons.

type
  KEYPAD_BITS* {.size: sizeof(cint).} = enum
    KEY_A = BIT(7),             ## !< pad A button.
    KEY_B = BIT(15),            ## !< pad B button.
    KEY_SELECT = BIT(13),       ## !< pad SELECT button.
    KEY_START = BIT(12),        ## !< pad START button.
    KEY_RIGHT = BIT(8),         ## !< pad RIGHT button.
    KEY_LEFT = BIT(9),          ## !< pad LEFT button.
    KEY_DOWN = BIT(10),         ## !< pad DOWN button.
    KEY_UP = BIT(11),           ## !< pad UP button.
    KEY_R = BIT(4),             ## !< Right shoulder button.
    KEY_L = BIT(5),             ## !< Left shoulder button.
    KEY_X = BIT(6),             ## !< pad X button.
    KEY_Y = BIT(14)             ## !< pad Y button.


## !
##     \brief common values for SuperScope input.
##
## ! enum values for the SuperScope buttons and flags.

type
  SUPERSCOPE_BITS* {.size: sizeof(cint).} = enum
    SSC_FIRE = BIT(15),         ## !< superscope FIRE button.
    SSC_CURSOR = BIT(14),       ## !< superscope CURSOR button.
    SSC_PAUSE = BIT(12),        ## !< superscope PAUSE button.
    SSC_TURBO = BIT(13),        ## !< superscope TURBO flag.
    SSC_OFFSCREEN = BIT(9),     ## !< superscope OFFSCREEN flag.
    SSC_NOISE = BIT(8)          ## !< superscope NOISE flag.


## !
##  \brief Mouse sensitivity values
##
##  enum values for the mouse sensitivity.
##

type
  MOUSE_SENSITIVITY* {.size: sizeof(cint).} = enum
    MOUSE_SLOW = 0,             ## !< slow sensitivity
    MOUSE_MEDIUM = 1,           ## !< medium sensitivity
    MOUSE_FAST = 2              ## !< fast sensitivity


var pad_keys* {.header: "snes/input.h".}: array[5, u16]

## !< current pad value

var pad_keysold* {.header: "snes/input.h".}: array[5, u16]

## !< previous pad value

var pad_keysdown* {.header: "snes/input.h".}: array[5, u16]

## !< newly pressed down pad keys

var snes_mplay5* {.header: "snes/input.h".}: u8

## !< \brief 1 if MultiPlay5 is connected

var snes_mouse* {.header: "snes/input.h".}: u8

## !< \brief 1 if Mouse is going to be used

var snes_sscope* {.header: "snes/input.h".}: u8

## !< \brief 1 if SuperScope is connected

var mouseConnect* {.header: "snes/input.h".}: array[2, u8]

## !< \brief 1 if Mouse present

var mouseButton* {.header: "snes/input.h".}: array[2, u8]

## !< \brief Mouse buttons that are pressed on this frame (Click mode).

var mousePressed* {.header: "snes/input.h".}: array[2, u8]

## !< \brief Mouse buttons that are currently pressed, stays until is unpressed (Turbo mode).

var mousePreviousPressed* {.header: "snes/input.h".}: array[2, u8]

## !< \brief Mouse buttons held or pressed in the previous frame

var mouse_x* {.header: "snes/input.h".}: array[2, u8]

## !< \brief Mouse horizontal displacement. daaaaaaa, d = direction (1: left, 0: right), a = acceleration.

var mouse_y* {.header: "snes/input.h".}: array[2, u8]

## !< \brief Mouse vertical displacement. daaaaaaa, d = direction (1: up, 0: down), a = acceleration.
## !
##  \brief Mouse sensitivity
##
##   * When a mouse is connected to the port: sensitivity bits read from the mouse.
##   * When no mouse is connected: The sensitivity to set the mouse to when the mouse is connected to the console.
##
##  CAUTION: The Hyperkin clone mouse ignores sensitivity changes and always reports a sensitivity of 0.
##

var mouseSensitivity* {.header: "snes/input.h".}: array[2, u8]

## !
##  \brief Request a change mouse sensitivity.
##
##  To prevent auto-joypad read corruption the change sensitivity commands are delayed until the
##  next non-lag VBlank ISR (after the mouse data has been read).
##
##  Values:
##   * `0x00`: No changes to mouse sensitivity.
##   * `0x01`: Cycle the mouse sensitivity once.
##   * `0x02-0x7f`: Cycle the mouse sensitivity twice.
##   * `0x80-0xff`: Set the sensitivity to `value & 3`.
##
##  CAUTION: The Hyperkin clone mouse ignores sensitivity changes and always reports a sensitivity of 0.
##

var mouseRequestChangeSensitivity* {.header: "snes/input.h".}: array[2, u8]

const
  mouse_L* = 0x01
  mouse_R* = 0x02

var scope_holddelay* {.header: "snes/input.h".}: u16

## !< \brief Hold delay.

var scope_repdelay* {.header: "snes/input.h".}: u16

## !< \brief Repeat rate.

var scope_shothraw* {.header: "snes/input.h".}: u16

## !< \brief Horizontal shot position, not adjusted.

var scope_shotvraw* {.header: "snes/input.h".}: u16

## !< \brief Vertical shot position, not adjusted.

var scope_shoth* {.header: "snes/input.h".}: u16

## !< \brief Horizontal shot position, adjusted for aim.

var scope_shotv* {.header: "snes/input.h".}: u16

## !< \brief Vertical shot position, adjusted for aim.

var scope_centerh* {.header: "snes/input.h".}: u16

## !< \brief 0x0000 is the center of the screen, positive values go to bottom right.

var scope_centerv* {.header: "snes/input.h".}: u16

## !< \brief 0x0000 is the center of the screen, positive values go to bottom right.

var scope_down* {.header: "snes/input.h".}: u16

## !< \brief flags that are currently true.

var scope_now* {.header: "snes/input.h".}: u16

## !< \brief flags that have become true this frame.

var scope_held* {.header: "snes/input.h".}: u16

## !< \brief flagsthat have been true for a certain length of time.

var scope_last* {.header: "snes/input.h".}: u16

## !< \brief flags that were true on the previous frame.

var scope_sinceshot* {.header: "snes/input.h".}: u16

## !< \brief Number of frames elapsed since last shot was fired.
## ! \def REG_JOYxLH
##
##     \brief SNES Controllers I/O Ports - Automatic Reading.
##     4218h/4219h - JOY1L/JOY1H - Joypad 1 (gameport 1, pin 4) (R)
##     421Ah/421Bh - JOY2L/JOY2H - Joypad 2 (gameport 2, pin 4) (R)
##     421Ch/421Dh - JOY3L/JOY3H - Joypad 3 (gameport 1, pin 5) (R)
##     421Eh/421Fh - JOY4L/JOY4H - Joypad 4 (gameport 2, pin 5) (R)
##
##     Register    Serial     Default
##     Bit         Transfer   Purpose
##     Number______Order______(Joypads)_____
##     15          1st        B Button         (1=Low=Pressed)
##     14          2nd        Y Button
##     13          3rd        Select Button
##     12          4th        Start Button
##     11          5th        Up
##     10          6th        Down
##     9           7th        Left
##     8           8th        Right
##     7           9th        A Button
##     6           10th       X Button
##     5           11th       L Button
##     4           12th       R Button
##     3           13th       0 (High)
##     2           14th       0 (High)
##     1           15th       0 (High)
##     0           16th       0 (High)
##
##     When enabled, the SNES will read 16 bits from each of the 4 controller port
##     data lines into registers $4218-f. This begins between H=32.5 and H=95.5 of
##     the first V-Blank scanline, and ends 4224 master cycles later. Register $4212
##     bit 0 is set during this time. Specifically, it begins at H=74.5 on the first
##     frame, and thereafter some multiple of 256 cycles after the start of the
##     previous read that falls within the observed range.
##
##     Reading $4218-f during this time will read back incorrect values. The only
##     reliable value is that no buttons pressed will return 0 (however, if buttons
##     are pressed 0 could still be returned incorrectly). Presumably reading $4016/7
##     or writing $4016 during this time will also screw things up.
##
##

template REG_JOYxLH*(a: untyped): untyped =
  ((cast[ptr vuint16](0x4218))[(a)])

## !	\fn  padsCurrent(value)
##     \brief Return current value of selected pad
##     \param value pad index to use (0-1 or 0-4 if multiplayer 5 connected)
##     \return unsigned short of the current pad value
##
##  unsigned short padsCurrent(u16 value);

template padsCurrent*(value: untyped): untyped =
  (pad_keys[value])

## !	\fn padsDown(value)
##     \brief Return value of down keys for selected pad
##     \param value pad index to use (0-1 or 0-4 if multiplayer 5 connected)
##     \return unsigned short of the newly pressed down keys (0 -> 1 transition)
##
##  unsigned short padsDown(u16 value);

template padsDown*(value: untyped): untyped =
  (pad_keysdown[value])

## !	\fn padsUp(u16 value)
##     \brief Return value of up keys for selected pad
##     \param value pad index to use (0-1 or 0-4 if multiplayer 5 connected)
##     \return unsigned short of the released keys (1 -> 0 transition)
##

proc padsUp*(value: u16): cushort {.cdecl, importc: "padsUp", header: "snes/input.h".}
## !	\fn padsClear(u16 value)
##     \brief Clear internal variables for selected pad
##     \param value pad index to use (0-1 or 0-4 if multiplayer 5 connected)
##

proc padsClear*(value: u16) {.cdecl, importc: "padsClear", header: "snes/input.h".}
## !	\fn detectMPlay5(void)
##     \brief Check if MultiPlayer5 is connected and populate snes_mplay5 (0 or 1 for connected)
##
##     \b CAUTION: REG_WRIO ($4201) must not be written to while MultiPlayer5 is active.
##     (Bit 7 of REG_WRIO must be set when Auto Joy reads the controllers, shortly after the VBlank Period starts.)
##

proc detectMPlay5*() {.cdecl, importc: "detectMPlay5", header: "snes/input.h".}
## !	\fn detectMouse(void)
##     \brief Check if Mouse is connected and populate snes_mouse (0 or 1 for connected)
##

proc detectMouse*() {.cdecl, importc: "detectMouse", header: "snes/input.h".}
## !	\fn detectSuperScope(void)
##     \brief Detects if SuperScope is connected on Port 1 (second controller port on console) and populate snes_sscope (0 or 1 for connected)
##

proc detectSuperScope*() {.cdecl, importc: "detectSuperScope", header: "snes/input.h".}
## !
##  \brief Enable mouse reading and set the initial mouse sensitivity
##
##  Initialises mouse variables and enable mouse reading in the VBlank ISR.
##
##  \param sensitivity sensitivity to use when  the mouse is connected to the console
##  (has no effect on a Hyperkin clone mouse)
##

proc initMouse*(sensitivity: u8) {.cdecl, importc: "initMouse", header: "snes/input.h".}
## !
##  \brief Queue a cycle mouse sensitivity command for the next VBlank.
##
##  \param port the port the mouse is connected to (0 or 1).
##
##  CAUTION:
##   * The changes to @ref mouseSensitivity are delayed one frame.
##   * This function will override any pending @ref mouseRequestChangeSensitivity commands.
##   * This function has no effect on the Hyperkin clone mouse.
##

proc mouseCycleSensitivity*(port: u16) {.cdecl, importc: "mouseCycleSensitivity",
                                      header: "snes/input.h".}
## !
##  \brief Queue a cycle mouse sensitivity twice (decrementing the sensitivity) command for the next VBlank.
##
##  \param port the port the mouse is connected to (0 or 1).
##
##  CAUTION:
##   * The changes to @ref mouseSensitivity are delayed one frame.
##   * This function will override any pending @ref mouseRequestChangeSensitivity commands.
##   * This function has no effect on the Hyperkin clone mouse.
##

proc mouseCycleSensitivityTwice*(port: u16) {.cdecl,
    importc: "mouseCycleSensitivityTwice", header: "snes/input.h".}
## !
##  \brief Queue a set mouse sensitivity command (to be executed on the next VBlank).
##
##  \param port the port the mouse is connected to (0 or 1).
##  \param sensitivity the sensitivity to set the mouse to (0 - 2).
##
##  CAUTION:
##   * The changes to @ref mouseSensitivity are delayed one frame.
##   * A sensitivity value of 3 is invalid.
##   * This function will override any pending @ref mouseRequestChangeSensitivity commands.
##   * This function has no effect on the Hyperkin clone mouse.
##

proc mouseSetSensitivity*(port: u16; sensitivity: u8) {.cdecl,
    importc: "mouseSetSensitivity", header: "snes/input.h".}
## ---------------------------------------------------------------------------------
##
##     Interrupt registers and vector pointers
##
##     Copyright (C) 2012-2017
##         Alekmaul
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##         must not claim that you wrote the original software. If you use
##         this software in a product, an acknowledgment in the product
##         documentation would be appreciated but is not required.
##
##     2.	Altered source versions must be plainly marked as such, and
##         must not be misrepresented as being the original software.
##
##     3.	This notice may not be removed or altered from any source
##         distribution.
##
##
## ---------------------------------------------------------------------------------
## !
##  \file snes/interrupt.h
##  \brief snes interrupt support.
##
##  <h2>VBlank ISR \anchor VBlank-ISR</h2>
##
##  PVSnesLib includes a Vertical Blank Interrupt Service Routine (VBlank ISR or NMI ISR) that will
##  do the following actions (in this order) at the start of the Vertical Blanking Period when
##  VBlank interrupts are enabled:
##   - Transfer #oamMemory to the PPU OAM on non lag-frames.
##   - Call #nmi_handler.
##   - Increment #snes_vblank_count.
##   - Read inputs from the controller ports on non lag-frames (see snes/input.h).
##   - Increment #lag_frame_counter on lag-frames.
##
##  A lag-frame is when the execution time between two WaitForVBlank() calls exceeds a 50/60Hz
##  display frame.  By testing for lag-frames, the VBlank ISR will not transfer a partially
##  populated #oamMemory to the PPU OAM.
##
##  Lag-frames are determined by the #vblank_flag variable, which is set on WaitForVBlank() and
##  cleared in the VBlank ISR.
##
##  Inputs are only read on non lag-frames to prevent the input state from unexpectedly changing in
##  the middle of the main loop (potentially causing a heisenbug).  Code that loops until a button
##  is pressed must call WaitForVBlank() within the loop otherwise it will loop forever.
##
##  The #nmi_handler function pointer (set using nmiSet()) is called on \b every VBlank interrupt
##  (even during force-blank / setScreenOff()).
##  To prevent glitches, #nmi_handler's should either:
##   - Test #vblank_flag and only update the PPU registers/memory if the #vblank_flag is set.
##   - Use locks or flags on every buffer/queue to prevent partially populated data from being transferred to the PPU.
##
##

## !!!Ignored construct:  # SNES_INTERRUPT_INCLUDE [NewLine] # SNES_INTERRUPT_INCLUDE [NewLine] # < snes / snestypes . h > [NewLine]
##  \brief VBlank ISR flag.
##
##  Used to detect lag-frames in the VBlank ISR.
##
##  This variable is set to a truthy (non-zero) value in WaitForVBlank()
##  and cleared in the NMI ISR after the call to nmi_handler.
##
##  vblank_flag can be used in a custom nmi_handler to detect lag frames.  Within nmi_handler:
##   - If vblank_flag is truthy (non-zero), the nmi_handler was called at the end of the frame.
##   - If vblank_flag is 0, the nmi_handler was called in the middle of a lag frame.
##
##  \b CAUTION: This variable SHOULD NOT be changed outside of WaitForVBlank()
##  extern u8 vblank_flag ;
## Error: did not expect [NewLine]!!!

##
##  \brief Lag-frame counter.
##
##  This variable is incremented on every VBlank Interrupt that occurs during a lag-frame.
##
##  \b CAUTION: The lag frame counter cannot tell the difference between a lag-frame and
##  force-blank setup loading graphics to the PPU.
##
##  \c lag_frame_counter can be modified.  This is useful in development builds to measure the
##  amount of lag in a level by resetting \c lag_frame_counter on level load and printing
##  \c lag_frame_counter on a pause screen or at the end of the level.
##

var lag_frame_counter* {.header: "snes/interrupt.h".}: u16

##
##  \brief VBlank routine
##
##  This function is called on \b every VBlank interrupt by the \ref VBlank-ISR "VBlank Interrupt Service Routine".
##
##  \b CAUTION: Writes to \c nmi_handler are <b>not atomic</b> and can cause a crash if a VBlank
##  Interrupt occurs in the middle of the \c nmi_handler write.  Use nmiSet() or disable NMI
##  interrupts when modifying \c nmi_handler.
##
##  <b>Assembly note:</b> This function pointer will be called with a non-zero Direct Page register
##  to prevent \c nmi_handler from clobbering the tcc imaginary registers.
##
##  \see \ref VBlank-ISR, nmiSet()
##

var nmi_handler* {.header: "snes/interrupt.h".}: pointer

##  \brief VBlank NMI Enable  (0=Disable, 1=Enable) (Initially disabled on reset)

const
  INT_VBLENABLE* = (1 shl 7)

##  \brief H/V IRQ (0=Disable, 1=At H=H + V=Any, 2=At V=V + H=0, 3=At H=H + V=V)

const
  INT_HVIRQ_H* = (1 shl 4)

##  \brief H/V IRQ (0=Disable, 1=At H=H + V=Any, 2=At V=V + H=0, 3=At H=H + V=V)

const
  INT_HVIRQ_V* = (1 shl 5)

##  \brief H/V IRQ (0=Disable, 1=At H=H + V=Any, 2=At V=V + H=0, 3=At H=H + V=V)

const
  INT_HVIRQ_HV* = (2 shl 4)

##  \brief Joypad Enable    (0=Disable, 1=Enable Automatic Reading of Joypad)

const
  INT_JOYPAD_ENABLE* = (1)

##  \brief V-Blank Period Flag (0=No, 1=VBlank)

const
  VBL_READY* = (1 shl 7)

##  \brief H-Blank Period Flag (0=No, 1=HBlank)

const
  HBL_READY* = (1 shl 6)

##  \brief Auto-Joypad-Read Busy Flag (1=Busy) (see 4200h, and 4218h..421Fh)

const
  PAD_BUSY* = (1)

##
##   \brief
##       Interrupt Enable and Joypad Request (W).<br>
##
##       7     VBlank NMI Enable  (0=Disable, 1=Enable) (Initially disabled on reset)<br>
##       6     Not used<br>
##       5-4   H/V IRQ (0=Disable, 1=At H=H + V=Any, 2=At V=V + H=0, 3=At H=H + V=V)<br>
##       3-1   Not used<br>
##       0     Joypad Enable    (0=Disable, 1=Enable Automatic Reading of Joypad)<br>
## <br>
##       Disabling IRQs (via bit4-5) does additionally acknowledge IRQs.<br>
##       There's no such effect when disabling NMIs (via bit7).<br>
##

template REG_NMITIMEN*: untyped = (cast[ptr vuint8](0x4200)[])

##
##
## 4207h/4208h - HTIMEL/HTIMEH - H-Count Timer Setting (W)
##
##   15-9  Not used
##   8-0   H-Count Timer Value (0..339) (+/-1 in long/short lines) (0=leftmost)
##
## The H/V-IRQ flag in Bit7 of TIMEUP, Port 4211h gets set when the H-Counter gets equal to the H-Count register value.
##
## 4209h/420Ah - VTIMEL/VTIMEH - V-Count Timer Setting (W)
##
##   15-9  Not used
##   8-0   V-Count Timer Value (0..261/311, NTSC/PAL) (+1 in interlace) (0=top)
##
## The H/V-IRQ flag in Bit7 of TIMEUP, Port 4211h gets set when the V-Counter gets equal to the V-Count register value.
##
##
##   \brief
##       V-Blank NMI Flag and CPU Version Number (R) (Read/Ack)<br>
##
##       7     Vblank NMI Flag  (0=None, 1=Interrupt Request) (set on Begin of Vblank)<br>
##       6-4   Not used<br>
##       3-0   CPU 5A22 Version Number (version 2 exists)<br>
## <br>
##       The NMI flag gets set at begin of Vblank (this happens even if NMIs are disabled). The flag gets reset automatically<br>
##       at end of Vblank, and gets also reset after reading from this register.<br>
##       The SNES has only one NMI source (vblank), and the NMI flag is automatically reset (on vblank end), so there's<br>
##       normally no need to read/acknowledge the flag, except one special case: If one does disable and re-enable NMIs,<br>
##       then an old NMI may be executed again; acknowledging avoids that effect.<br>
##       The CPU includes another internal NMI flag, which gets set when "[4200h].7 AND [4210h].7" changes from 0-to-1, and<br>
##       gets cleared when the NMI gets executed (which should happen around after the next opcode) (if a DMA transfer is<br>
##       in progress, then it is somewhere after the DMA, in that case the NMI can get executed outside of the Vblank<br>
##       period, ie. at a time when [4210h].7 is no longer set).<br>
##

template REG_RDNMI*: untyped = (cast[ptr vuint8](0x4210)[])

##
##   \brief
##       TIMEUP - H/V-Timer IRQ Flag (R) (Read/Ack)<br><br>
##
##       7     H/V-Count Timer IRQ Flag (0=None, 1=Interrupt Request)<br>
##       6-0   Not used<br>
## <br>
##       The IRQ flag is automatically reset after reading from this register<br>
##       (except when reading at the very time when the IRQ condition is true <br>
##       (which lasts for 4-8 master cycles), then the CPU receives bit7=1, <br>
##       but register bit7 isn't cleared). The flag is also automatically cleared <br>
##       when disabling IRQs (by setting 4200h.Bit5-4 to zero).<br>
##       Unlike NMI handlers, IRQ handlers MUST acknowledge IRQs, otherwise the IRQ <br>
##       gets executed again (ie. immediately after the RTI opcode).<br>
##

template REG_TIMEUP*: untyped = (cast[ptr vuint8](0x4211)[])

##
##   \brief
##       H/V-Blank flag and Joypad Busy flag (R).<br>
##
##       7     V-Blank Period Flag (0=No, 1=VBlank)<br>
##       6     H-Blank Period Flag (0=No, 1=HBlank)<br>
##       5-1   Not used<br>
##       0     Auto-Joypad-Read Busy Flag (1=Busy) (see 4200h, and 4218h..421Fh)<br>
## <br>
##       The Hblank flag gets toggled in ALL scanlines (including during Vblank/Vsync).<br>
##       Both Vblank and Hblank are always toggling (even during Forced Blank, <br>
##       and no matter if IRQs or NMIs are enabled<br>
##

template REG_HVBJOY*: untyped = (cast[ptr vuint8](0x4212)[])

##
##  \brief Sets the #nmi_handler (VBlank routine).
##
##  This function will also disable any active IRQ interrupts, enable VBlank interrupts and enable Joypad Auto-Read.
##
##  \param vblankRoutine the function to call on every VBlank (NMI) interrupt.<br/>
##
##  \b CAUTION: \p vblankRoutine is called on \b every VBlank interrupt.
##  #vblank_flag can be used to determine if \p vblankRoutine was called during a lag-frame.
##
##  \b CAUTION: This function will override the default #nmi_handler.
##  If you are using consoleDrawText(), you will need to call consoleVblank() inside \p vblankRoutine.
##
##  \see \ref VBlank-ISR, #nmi_handler
##

proc nmiSet*(vblankRoutine: proc () {.cdecl.}) {.cdecl, importc: "nmiSet",
    header: "snes/interrupt.h".}
##
##  \brief Waits for a VBlank interrupt.
##
##  Sets the #vblank_flag and pauses execution until the #vblank_flag is cleared (by the \ref VBlank-ISR).
##
##  \b CAUTION: This function will loop forever if VBlank interrupts are disabled.
##
##  <b>Assembly note</b>: This function will not modify the A/X/Y registers and can be called with an 8 or 16 bit <tt>.ACCU</tt>/<tt>.INDEX</tt>.
##

proc WaitForVBlank*() {.cdecl, importc: "WaitForVBlank", header: "snes/interrupt.h".}
##
##   \brief
##       Wait for VBL flag to be OK<br>
##

template
  WaitVBLFlag*: untyped =
    while ((REG_HVBJOY and VBL_READY)):
      discard
    while not (REG_HVBJOY and VBL_READY):
      discard

const
  PVSNESLIB_MAJOR* = 4
  PVSNESLIB_MINOR* = 5
  PVSNESLIB_PATCH* = 0
  PVSNESLIB_STRING* = "PVSnesLib V4.5.0"

## ---------------------------------------------------------------------------------
##
##     Copyright (C) 2012-2014
##         Alekmaul
##
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##         must not claim that you wrote the original software. If you use
##         this software in a product, an acknowledgment in the product
##         documentation would be appreciated but is not required.
##
##     2.	Altered source versions must be plainly marked as such, and
##         must not be misrepresented as being the original software.
##
##     3.	This notice may not be removed or altered from any source
##         distribution.
##
## ---------------------------------------------------------------------------------
## ! \file snes/lzss.h
## \brief Wrapper functions for lzss decoding
##
##

## ! \brief Decompress Lzss data to VRAM
##     \param source the source to decompress from
##     \param address vram address to decompress
##     \param size the size in bytes of the data to decompress.
##

proc LzssDecodeVram*(source: ptr u8; address: u16; size: u16) {.cdecl,
    importc: "LzssDecodeVram", header: "snes/lzss.h".}
## ---------------------------------------------------------------------------------
##
##     map management for mode 1
##
##     Copyright (C) 2012-2013
##         Alekmaul
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##         must not claim that you wrote the original software. If you use
##         this software in a product, an acknowledgment in the product
##         documentation would be appreciated but is not required.
##     2.	Altered source versions must be plainly marked as such, and
##         must not be misrepresented as being the original software.
##     3.	This notice may not be removed or altered from any source
##         distribution.
##
## ---------------------------------------------------------------------------------
## !	\file snes/map.h
##     \brief contains the functions to manage / scroll large background MAP on SNES.
##     \brief this can only be use for mode 1
##     \brief the engine scrolls layer1 in x and y coordinates
##     \brief layer address is : 6800 for Layer 1
##

const
  T_EMPTY* = 0x0000
  T_SOLID* = 0xFF00
  T_LADDE* = 0x0001
  T_FIRES* = 0x0002
  T_SPIKE* = 0x0004
  T_PLATE* = 0x0008
  ACT_STAND* = 0x0000
  ACT_WALK* = 0x0001
  ACT_JUMP* = 0x0002
  ACT_FALL* = 0x0004
  ACT_CLIMB* = 0x0008
  ACT_DIE* = 0x0010
  ACT_BURN* = 0x0020
  MAP_OPT_1WAY* = 0x01
  MAP_OPT_BG2* = 0x02

var bg_L1* {.header: "snes/map.h".}: array[32 * 32, u16]

## !< \brief The buffer to use when updating the whole display on layer 1

var mapupdbuf* {.header: "snes/map.h".}: u8

## !< \brief State of buffer update (vert / horiz / all)

var
  x_pos* {.header: "snes/map.h".}: u16
  y_pos* {.header: "snes/map.h".}: u16

## !< \brief Current value of camera in x & y coordinates
## !	\fn mapLoad(u8 *layer1map, u8 *layertiles, u8 *tilesprop)
##     \brief Load map definition into memory.
##     \brief WARNING! Map engine must be used on Background #0.
##     \param layer1map address of map with tiles
##     \param layertiles address of tiles definition
##     \param tilesprop address of tiles property definition (blocker, spikes, and so on)
##

proc mapLoad*(layer1map: ptr u8; layertiles: ptr u8; tilesprop: ptr u8) {.cdecl,
    importc: "mapLoad", header: "snes/map.h".}
## !	\fn mapUpdate(void)
##     \brief Update map regarding current camera position (must be done once per frame)
##

proc mapUpdate*() {.cdecl, importc: "mapUpdate", header: "snes/map.h".}
## !	\fn mapVblank(void)
##     \brief Display map regarding current buffer (must be done once per frame, near Vblank)
##

proc mapVblank*() {.cdecl, importc: "mapVblank", header: "snes/map.h".}
## !	\fn mapUpdateCamera(u16 xpos, u16 ypos)
##     \brief Update map camera (must be done once per frame)
##     \param xpos	x coordinate of object where we want to focus on
##     \param ypos	x coordinate of object where we want to focus on
##

proc mapUpdateCamera*(xpos: u16; ypos: u16) {.cdecl, importc: "mapUpdateCamera",
    header: "snes/map.h".}
## !	\fn mapGetMetaTile(u16 xpos, u16 ypos)
##     \brief Get metatile value from current map
##     \param xpos	x coordinate of metatile
##     \param ypos	x coordinate of metatile
##     \return tile value
##

proc mapGetMetaTile*(xpos: u16; ypos: u16): u16 {.cdecl, importc: "mapGetMetaTile",
    header: "snes/map.h".}
## !	\fn mapGetMetaTilesProp(u16 xpos, u16 ypos)
##     \brief Get metatile property from current map (solid, lad, fire, etc...)
##     \param xpos	x coordinate of metatile
##     \param ypos	x coordinate of metatile
##     \return tile properties
##

proc mapGetMetaTilesProp*(xpos: u16; ypos: u16): u16 {.cdecl,
    importc: "mapGetMetaTilesProp", header: "snes/map.h".}
## !	\fn mapSetMapOptions(u8 optmap)
##     \brief Put some generic options for the map
##     \param optmap	options to set
##     <br> Options are:
##     <br> MAP_OPT_1WAY: only scroll right
##     <br> MAP_OPT_BG2: option to use BG2 instead of BG1 (address is still 6800 but scroll BG2)
##

proc mapSetMapOptions*(optmap: u8) {.cdecl, importc: "mapSetMapOptions",
                                  header: "snes/map.h".}
## ---------------------------------------------------------------------------------
##
##     snes/object.h -- definitions for SNES objects
##
##     Copyright (C) 2012-2024
##         Alekmaul, Nub1604
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##     must not claim that you wrote the original software. If you use
##     this software in a product, an acknowledgment in the product
##     documentation would be appreciated but is not required.
##
##     2.	Altered source versions must be plainly marked as such, and
##     must not be misrepresented as being the original software.
##
##     3.	This notice may not be removed or altered from any source
##     distribution.
##
##     Special thanks to Nub1604 for the slope management
##
## ---------------------------------------------------------------------------------
## ! \file snes/object.h
##     \brief snes object engine functionality.
##     \brief 64 maximum of objects managed by engine
##     \brief 32 type of objects maximum by engine
##

const
  OB_MAX* = 80
  OB_TYPE_MAX* = 32

type
  t_objs* {.importc: "t_objs", header: "snes/object.h", packed.} = object
    prev*: uint16
    next*: uint16
    `type`* {.importc: "type".}: uint8
    nID*: uint8
    sprnum*: uint16
    sprid3216*: uint16
    sprblk3216*: uint16
    sprflip*: uint8
    sprpal*: uint8
    sprframe*: uint16
    xpos*: array[3, uint8]
    ypos*: array[3, uint8]
    xofs*: uint16
    yofs*: uint16
    width*: uint16
    height*: uint16
    xmin*: uint16
    xmax*: uint16
    xvel*: int16
    yvel*: int16
    tilestand*: uint16
    tileabove*: uint16
    tilesprop*: uint16
    tilebprop*: uint16
    action*: uint16
    status*: uint8
    tempo*: uint8
    count*: uint8
    dir*: uint8
    parentID*: uint16
    hitpoints*: uint8
    sprrefresh*: uint8
    onscreen*: uint8
    objnotused*: array[7, uint8]

var objptr* {.header: "snes/object.h".}: u16

## !< \brief pointer to current object

var objtokill* {.header: "snes/object.h".}: u8

## !< \brief put 1 in variable to kill current object

var objgetid* {.header: "snes/object.h".}: u16

## !< \brief id of current object (useful when creating it)

var objbuffers* {.header: "snes/object.h".}: array[OB_MAX, t_objs]

## !< \brief current object buffer with all objects

const
  T_LADDER* = 0x0001
  T_SLOPEU1* = 0x0020
  T_SLOPED1* = 0x0021
  T_SLOPELU2* = 0x0022
  T_SLOPELD2* = 0x0023
  T_SLOPEUU2* = 0x0024
  T_SLOPEUD2* = 0x0025

## ! \fn objInitEngine(void)
##     \brief Initialize object engine, need to be called once
##

proc objInitEngine*() {.cdecl, importc: "objInitEngine", header: "snes/object.h".}
## ! \fn objInitGravity(u8 objgravity, u8 objfriction, u16 objvelocity)
##     \brief Initialize the object type functions (initialize, update)
##     \param objgravity  The gravity of object when falling (default is 41)
##     \param objfriction 	Friction for object when walking (default is 16)
##

proc objInitGravity*(objgravity: u16; objfriction: u16) {.cdecl,
    importc: "objInitGravity", header: "snes/object.h".}
## ! \fn objInitFunctions(u8 objtype, void *initfct, void *updfct, void *reffct);
##     \brief Initialize the object type functions (initialize, update)
##     \param objtype  The type of object depending of the game
##     \param initfct  The address of the function when we init the type of object
##     \param updfct   The address of the function when we update the type of object (need to be called once per frame)
##     \param reffct   The address of the function when we refresh sprites of object (need to be called once per frame)
##     \brief init function must have 5 unsigned short (u16) parameters
##     \brief    - xp,yp are default coordinates values for x and y
##     \brief    - type is the type oobjects
##     \brief    - minx, miny are minimal and maximal values for objects in x axis
##     \brief update function must have 1 parameter
##     \brief    - idx is the id of the object in the object list
##     \brief refresh function must have 1 parameter
##     \brief    - idx is the id of the object in the object list
##

proc objInitFunctions*(objtype: u8; initfct: pointer; updfct: pointer; reffct: pointer) {.
    cdecl, importc: "objInitFunctions", header: "snes/object.h".}
## ! \fn objLoadObjects(u8 *sourceO)
##     \brief Load all objects for a specific table in memory
##     \param sourceO table of objects
##     \brief Call, after loading, each init function of the type of objects for each object
##     \brief The table has an entry with x,y,type,minx,maxx for each object
##     \brief    - x,y are coordinates of object,
##     \brief    - type if the type of the object (maximum 32 types)
##     \brief    - minx,maxx are the coordinates of minimum & maxinmum possible on x
##     \brief the last four parameters are useful to do some actions where minimum or maximum is reached
##     \brief The table needs to finish with FFFF to indicate that no more objects are availables
##

proc objLoadObjects*(sourceO: ptr u8) {.cdecl, importc: "objLoadObjects",
                                    header: "snes/object.h".}
## ! \fn objNew(u8 objtype, u16 x, u16 y)
##     \brief Initialize a new object in game, objgetid will has the id of the object
##     \param objtype  The type of object depending of the game
##     \param x 	    The X coordinate of object on map or screen
##     \param y 	    The Y coordinate of object on map or screen
##     \return id of the object in object id table
##

proc objNew*(objtype: u8; x: u16; y: u16): u16 {.cdecl, importc: "objNew",
    header: "snes/object.h".}
## ! \fn objGetPointer(u16 objhandle)
##     \brief get the pointer to an object from its handle (need to do -1 to have offset after), objptr will has the pointer of the object
##     \param objhandle handle of the object
##

proc objGetPointer*(objhandle: u16) {.cdecl, importc: "objGetPointer",
                                   header: "snes/object.h".}
## ! \fn objKill(u16 objhandle)
##     \brief kill an object from the game
##     \param objhandle handle of the object
##

proc objKill*(objhandle: u16) {.cdecl, importc: "objKill", header: "snes/object.h".}
## ! \fn objKillAll(void)
##     \brief kill all objects currently active
##

proc objKillAll*() {.cdecl, importc: "objKillAll", header: "snes/object.h".}
## ! \fn objUpdateAll(void)
##     \brief call update function for all objects currently active (if they are in "virtual screen" coordinates).
##     \brief  "virtual screen" coordinates are -64<x<320 and -64<y<288.
##

proc objUpdateAll*() {.cdecl, importc: "objUpdateAll", header: "snes/object.h".}
## ! \fn objRefreshAll(void)
##     \brief call refresh function for all objects currently on screen.
##     \brief  useful to avoid flickering when using a platform scrolling game.
##     \brief  screen coordinates are -32<x<256 and -32<y<y<224.
##

proc objRefreshAll*() {.cdecl, importc: "objRefreshAll", header: "snes/object.h".}
## ! \fn objCollidMap(u16 objhandle)
##     \brief check if an object collides the map
##     \param objhandle handle of the object
##     \brief update tilestand, tileabove with tiles on map regarding object attributes
##     \brief update xvel, yvel with velocity regarding tiles on map
##

proc objCollidMap*(objhandle: u16) {.cdecl, importc: "objCollidMap",
                                  header: "snes/object.h".}
## ! \fn objCollidMapWithSlopes(u16 objhandle)
##     \brief check if an object collides the map with map slopes management
##     \param objhandle handle of the object
##     \brief update tilestand, tileabove with tiles on map regarding object attributes
##     \brief update xvel, yvel with velocity regarding tiles on map
##     \brief the map can contain slopes, check the constants ($20..$25) the add them to your map
##

proc objCollidMapWithSlopes*(objhandle: u16) {.cdecl,
    importc: "objCollidMapWithSlopes", header: "snes/object.h".}
## ! \fn objCollidMap1D(u16 objhandle)
##     \brief check if an object collides the map
##     \param objhandle handle of the object
##     \brief update tilestand, tileabove with tiles on map regarding object attributes
##     \brief update xvel, yvel with no gravity regarding tiles on map
##

proc objCollidMap1D*(objhandle: u16) {.cdecl, importc: "objCollidMap1D",
                                    header: "snes/object.h".}
## ! \fn objCollidObj(u16 objhandle1,u16 objhandle2)
##     \brief check if two objects are colliding
##     \param objhandle1 handle of the 1st object
##     \param objhandle2 handle of the 2nd object
##     \return 1 if collision detected, 0 elsewhere
##

proc objCollidObj*(objhandle1: u16; objhandle2: u16): u16 {.cdecl,
    importc: "objCollidObj", header: "snes/object.h".}
## ! \fn objUpdateXY(u16 objhandle)
##     \brief Update X & Y coordinates of object regarding its own velocitys
##     \param objhandle handle of the object
##     \brief It uses xvel and yvel to do such computation
##

proc objUpdateXY*(objhandle: u16) {.cdecl, importc: "objUpdateXY", header: "snes/object.h".}
## ---------------------------------------------------------------------------------
##
##     mixel mode for mode 0
##
##     Copyright (C) 2012-2013
##         Alekmaul
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##         must not claim that you wrote the original software. If you use
##         this software in a product, an acknowledgment in the product
##         documentation would be appreciated but is not required.
##     2.	Altered source versions must be plainly marked as such, and
##         must not be misrepresented as being the original software.
##     3.	This notice may not be removed or altered from any source
##         distribution.
##
## ---------------------------------------------------------------------------------
## !	\file snes/pixel.h
##     \brief contains the basic definitions for doing a pixel per pixel mode for SNES.
##     \brief map entry is 0x5800 and tiles entry is 0x6000 for 14K bytes !
##     \brief so don't use graphics after 0x5800
##     \brief this pixel mode uses SNES mode 0 so only 3 colors can be used
##
##

## !	\fn pixSetPixel(u8 x,u8 y, u8 color)
##     \brief Draw a dot
##     \param x x coordinate of dot
##     \param y y coordinate of dot
##     \param color color of pixel (must be 1, 2 or 3)
##

proc pixSetPixel*(x: u8; y: u8; color: u8) {.cdecl, importc: "pixSetPixel",
                                      header: "snes/pixel.h".}
## !	\fn pixSetMode(u8 *pixPalette)
##     \brief Init pixel mode with SNES mode 0
##     \param pixPalette address of palette entry
##

proc pixSetMode*(pixPalette: ptr u8) {.cdecl, importc: "pixSetMode", header: "snes/pixel.h".}
## ---------------------------------------------------------------------------------
##
##     Copyright (C) 2012-2020
##         Alekmaul
##
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##         must not claim that you wrote the original software. If you use
##         this software in a product, an acknowledgment in the product
##         documentation would be appreciated but is not required.
##
##     2.	Altered source versions must be plainly marked as such, and
##         must not be misrepresented as being the original software.
##
##     3.	This notice may not be removed or altered from any source
##         distribution.
##
## ---------------------------------------------------------------------------------
## ! \file snes/scores.h
## \brief Wrapper functions for score management
##
##

type
  scoMemory* {.importc: "scoMemory", header: "snes/scores.h", bycopy.} = object
    scolo* {.importc: "scolo".}: u16
    scohi* {.importc: "scohi".}: u16


## ! \brief clear a score memory
##     \param source the source to clear from
##

proc scoreClear*(source: ptr scoMemory) {.cdecl, importc: "scoreClear",
                                      header: "snes/scores.h".}
## ! \brief add a value to a score memory
##     \param source the source to clear from
##     \param value the value to add
##

proc scoreAdd*(source: ptr scoMemory; value: u16) {.cdecl, importc: "scoreAdd",
    header: "snes/scores.h".}
## ! \brief copy a score memory to another score memory
##     \param source the source to copy from
##     \param dest the destination to copy to
##

proc scoreCpy*(source: ptr scoMemory; dest: ptr scoMemory) {.cdecl, importc: "scoreCpy",
    header: "snes/scores.h".}
## ! \brief compare a score memory to another score memory
##     \param source the source to compare from
##     \param dest the destination to compare to
##     \return	0 if equals, 0xFF if source greater than destination, 1 otherwise
##

proc scoreCmp*(source: ptr scoMemory; dest: ptr scoMemory): u8 {.cdecl,
    importc: "scoreCmp", header: "snes/scores.h".}
## ---------------------------------------------------------------------------------
##
##     snes/snestypes.h -- Common types (and a few useful macros)
##
##     Copyright (C) 2012-2013
##         Alekmaul
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##         must not claim that you wrote the original software. If you use
##         this software in a product, an acknowledgment in the product
##         documentation would be appreciated but is not required.
##     2.	Altered source versions must be plainly marked as such, and
##         must not be misrepresented as being the original software.
##     3.	This notice may not be removed or altered from any source
##         distribution.
##
## ---------------------------------------------------------------------------------
## ! \file snes/snestypes.h
##     \brief Custom types used by libsnes
##

## !!!Ignored construct:  # _SNESTYPES_INCLUDE [NewLine] # _SNESTYPES_INCLUDE [NewLine] ! bit field # BIT ( n ) ( 1 << n ) [NewLine] ! 8 bit volatile unsigned integer. typedef signed char s8 ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  typedef unsigned char u8 ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  typedef signed short s16 ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  typedef unsigned short u16 ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  typedef signed long long s32 ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  typedef unsigned long long u32 ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  typedef volatile unsigned char vuint8 ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  typedef volatile unsigned short vuint16 ;
## Error: identifier expected, but got: ;!!!

## !!!Ignored construct:  typedef volatile unsigned long long vuint32 ;
## Error: identifier expected, but got: ;!!!

type
  vint8* = char
  vint16* = cshort
  vint32* = clonglong

##  Handy function pointer typedefs
## ! a function pointer that takes no arguments and doesn't return anything.

type
  VoidFn* = proc () {.cdecl.}

## ! boolean definitions

type
  bool* = cuchar

const
  FALSE* = 0
  TRUE* = 0xff
  false* = 0
  true* = 0xff

## ! stdio definitions

const
  NULL* = 0

## ---------------------------------------------------------------------------------
##
##     Sound functions.
##
##     Copyright (C) 2012-2023
##         Alekmaul
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##         must not claim that you wrote the original software. If you use
##         this software in a product, an acknowledgment in the product
##         documentation would be appreciated but is not required.
##     2.	Altered source versions must be plainly marked as such, and
##         must not be misrepresented as being the original software.
##     3.	This notice may not be removed or altered from any source
##         distribution.
##
##
## ---------------------------------------------------------------------------------
## ! \file snes/sound.h
##     \brief snes sound support.
##
##     Really great thanks to shiru for sound engine and tools used in his Christmas Craze
##     homebrew
##     http://shiru.untergrund.net/
##
##     Also great thanks for mukunda for snesmod sound engine
##     http://snes.mukunda.com/
##
##     And special thanks to Kung Fu Furby for help debugging snesmod port with C interface
##

## !	\struct brrsamples
##     \brief brr sample sound header(8 bytes)
##

type
  brrsamples* {.importc: "brrsamples", header: "snes/sound.h", bycopy.} = object
    pitch* {.importc: "pitch".}: u8
    ## !< default PITCH (1..6) (hz = PITCH * 2000)
    panning* {.importc: "panning".}: u8
    ## !< default PANNING (0..15)
    volume* {.importc: "volume".}: u8
    ## !< default VOLUME (0..15)
    length1* {.importc: "length1".}: u8
    ## !< number of BRR chunks (BYTELEN/9) (max 4kilobytes??) low
    length2* {.importc: "length2".}: u8
    ## !< number of BRR chunks (BYTELEN/9) (max 4kilobytes??) high
    addr1* {.importc: "addr1".}: u8
    ## !< address of BRR data low
    addr2* {.importc: "addr2".}: u8
    ## !< address of BRR data high
    bank* {.importc: "bank".}: u8
    ## !< bank of BRR data


## ! \def REG_APU00
##     \brief Main CPU to Sound CPU Communication Port 0 (R/W)
##     7-0   APU I/O Data   (Write: Data to APU, Read: Data from APU)
##     Caution: These registers should be written only in 8bit mode (there is a hardware
##     glitch that can cause a 16bit write to [2140h..2141h] to destroy [2143h], this
##     might happen only in some situations, like when the cartridge contains too
##     many ROM chips which apply too much load on the bus).
##
##     Same thing for REG_APU01, REG_APU02 and REG_APU03 for addr 2141h..2143h
##     REG_APU0001 and REG_APU0203 for 16 bits read/write access
##

template REG_APU00*: untyped = (cast[ptr vuint8](0x2140)[])
template REG_APU01*: untyped = (cast[ptr vuint8](0x2141)[])
template REG_APU02*: untyped = (cast[ptr vuint8](0x2142)[])
template REG_APU03*: untyped = (cast[ptr vuint8](0x2143)[])
template REG_APU0001*: untyped = (cast[ptr vuint16](0x2140)[])
template REG_APU0203*: untyped = (cast[ptr vuint16](0x2142)[])

## ! \fn  spcBoot(void)
##     \brief boots the spc700 with sm-spc. call once at startup
##     disable time consuing interrupts during this function
##

proc spcBoot*() {.cdecl, importc: "spcBoot", header: "snes/sound.h".}
## ! \fn  spcSetBank(u8 *bank)
##     \brief set soundbank origin. soundbank must have dedicated bank(s)
##     \param bank	bank address
##

proc spcSetBank*(bank: ptr u8) {.cdecl, importc: "spcSetBank", header: "snes/sound.h".}
## ! \fn  spcLoad(u16 musIndex)
##     \brief load module into sm-spc. this function may take some time to execute
##     \param musIndex	module_id
##

proc spcLoad*(musIndex: u16) {.cdecl, importc: "spcLoad", header: "snes/sound.h".}
## ! \fn  spcLoadEffect(u16 sfxIndex)
##     \brief load sound effect into sm-spc. this function may take some time to execute
##     \param sfxIndex	sfx_id
##

proc spcLoadEffect*(sfxIndex: u16) {.cdecl, importc: "spcLoadEffect",
                                  header: "snes/sound.h".}
## ! \fn  spcPlay(u8 startPos)
##     \brief play module.
##     note: this simply queues a message, use spcFlush if you want
##     to wait until the message is processed
##
##     another note: there may be a significant startup time from
##     after the message is processed to when the song starts playing...
##     to sync the program with the song start use spcFlush and then
##     wait until SPC_P of the status register is set.
##     \param startPos	starting position
##

proc spcPlay*(startPos: u8) {.cdecl, importc: "spcPlay", header: "snes/sound.h".}
## ! \fn  spcStop(void)
##     \brief stop playing the current module.
##

proc spcStop*() {.cdecl, importc: "spcStop", header: "snes/sound.h".}
## ! \fn  spcPauseMusic(void)
##     \brief pause playing the current module and save the music position.
##

proc spcPauseMusic*() {.cdecl, importc: "spcPauseMusic", header: "snes/sound.h".}
## ! \fn  spcResumeMusic(void)
##     \brief Resume playing of current module at music position.
##
##     spcPauseMusic has to be call before to restore correct position.
##

proc spcResumeMusic*() {.cdecl, importc: "spcResumeMusic", header: "snes/sound.h".}
## ! \fn  spcSetModuleVolume(u8 vol)
##     \brief set the module playback volume
##     \param vol	volume (0..255)
##

proc spcSetModuleVolume*(vol: u8) {.cdecl, importc: "spcSetModuleVolume",
                                 header: "snes/sound.h".}
## ! \fn  spcFadeModuleVolume(u16 vol, u16 fadespeed)
##     \brief fade the module volume towards the target
##     \param vol	volume (0..255)
##     \param fadespeed	fade speed (volume(0..255) += y every 32ms)
##

proc spcFadeModuleVolume*(vol: u16; fadespeed: u16) {.cdecl,
    importc: "spcFadeModuleVolume", header: "snes/sound.h".}
## ! \fn  spcFlush(void)
##     \brief Flush message queue (force sync)
##

proc spcFlush*() {.cdecl, importc: "spcFlush", header: "snes/sound.h".}
## ! \fn  spcProcess(void)
##     \brief Process messages
##     This function will try to give messages to the spc until a few
##     scanlines pass
##
##     this function MUST be called every frame if you are using
##     streamed sounds
##

proc spcProcess*() {.cdecl, importc: "spcProcess", header: "snes/sound.h".}
## ! \fn  spcEffect(u16 pitch,u16 sfxIndex, u8 volpan)
##     \brief Play sound effect (load with spcLoadEffect)
##     \param pitch	pitch (0-15, 1=4Khz , 2=8khz, 4=16Khz, 8=32Khz)
##     \param sfxIndex	effect index (0-15)
##     \param volpan	volume(0..15) AND panning(0..15) (volume*16+pan)
##

proc spcEffect*(pitch: u16; sfxIndex: u16; volpan: u8) {.cdecl, importc: "spcEffect",
    header: "snes/sound.h".}
## ! \fn  spcGetMusicPosition(void)
##     \brief Get current running pattern
##     \return current pattern
##

proc spcGetMusicPosition*(): u8 {.cdecl, importc: "spcGetMusicPosition",
                               header: "snes/sound.h".}
## ! \fn  spcSetSoundTable(u16 sndTableAddr,u8 sndTableBank)
##     \brief set the address of the SOUND TABLE
##     \param sndTableAddr	address of sound table
##     \param sndTableBank	bank of sound table
##

proc spcSetSoundTable*(sndTableAddr: u16; sndTableBank: u8) {.cdecl,
    importc: "spcSetSoundTable", header: "snes/sound.h".}
## ! \fn spcSetSoundEntry(u8 vol, u8 panning, u8 pitch, u16 length, u8 *sampleaddr, brrsamples *ptr)
##     \brief set the values and address of the SOUND TABLE for a sound entry
##     \param vol	volume (0..15)
##     \param panning	panning (0..15)
##     \param pitch	PITCH (1..6) (hz = PITCH * 2000)
##     \param length	length of brr sample
##     \param sampleaddr	address of brr sample
##     \param ptr	address of variable where sounds values will be stored
##

proc spcSetSoundEntry*(vol: u8; panning: u8; pitch: u8; length: u16; sampleaddr: ptr u8;
                      `ptr`: ptr brrsamples) {.cdecl, importc: "spcSetSoundEntry",
    header: "snes/sound.h".}
## ! \fn spcSetSoundDataEntry(u8 vol, u8 panning, u8 pitch, u16 length, u8 *sampleaddr, brrsamples *ptr)
##     \brief set the values of a sound entry
##     \param vol	volume (0..15)
##     \param panning	panning (0..15)
##     \param pitch	PITCH (1..6) (hz = PITCH * 2000)
##     \param length	length of brr sample
##     \param sampleaddr	address of brr sample
##     \param ptr	address of variable where sounds values will be stored
##

proc spcSetSoundDataEntry*(vol: u8; panning: u8; pitch: u8; length: u16;
                          sampleaddr: ptr u8; `ptr`: ptr brrsamples) {.cdecl,
    importc: "spcSetSoundDataEntry", header: "snes/sound.h".}
## ---------------------------------------------------------------------------------
## ! \fn spcSetSoundDataEntry(u8 vol, u8 panning, u8 pitch, u16 length, u8 *sampleaddr, brrsamples *ptr)
##     \brief set the address of the SOUND TABLE for a sound entry
##     \param vol	volume (0..15)
##     \param panning	panning (0..15)
##     \param pitch	PITCH (1..6) (hz = PITCH * 2000)
##     \param length	length of brr sample
##     \param sampleaddr	address of brr sample
##     \param ptr	address of variable where sounds values will be stored
##

proc spcSetSoundTableEntry*(`ptr`: ptr brrsamples) {.cdecl,
    importc: "spcSetSoundTableEntry", header: "snes/sound.h".}
## ! \fn  spcAllocateSoundRegion(u8 size);
##     \brief Set the size of the sound region.
##
##     Use it only if you are playing effects with BRR files. If not, just allocate the value 0 by calling spcAllocateSoundRegion(0);
##
##     The value must be big enough to hold your longest/largest sound.
##     This function will STOP module playback too.
##     \param size	size of sound region (size*256 bytes)
##

proc spcAllocateSoundRegion*(size: u8) {.cdecl, importc: "spcAllocateSoundRegion",
                                      header: "snes/sound.h".}
## ! \fn  spcPlaySound(u8 sndIndex)
##     \brief Play sound from memory (using default arguments)
##     \param sndIndex	index in sound table.
##     Be careful: the index 0 corresponds to the LAST sound loaded.
##     The index 1 is the penultimate sound loaded and so on...
##

proc spcPlaySound*(sndIndex: u8) {.cdecl, importc: "spcPlaySound", header: "snes/sound.h".}
## ! \fn  spcPlaySoundV(u8 sndIndex, u16 volume)
##     \brief Play sound from memory (using default arguments)
##     \param sndIndex	index in sound table.
##     Be careful: the index 0 corresponds to the LAST sound loaded.
##     The index 1 is the penultimate sound loaded and so on...
##     \param volume	volume (0..15)
##

proc spcPlaySoundV*(sndIndex: u8; volume: u16) {.cdecl, importc: "spcPlaySoundV",
    header: "snes/sound.h".}
## ---------------------------------------------------------------------------------
##
##     snes/sprite.h -- definitions for SNES sprites
##
##     Copyright (C) 2012-2025
##         Alekmaul
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##     must not claim that you wrote the original software. If you use
##     this software in a product, an acknowledgment in the product
##     documentation would be appreciated but is not required.
##
##     2.	Altered source versions must be plainly marked as such, and
##     must not be misrepresented as being the original software.
##
##     3.	This notice may not be removed or altered from any source
##     distribution.
##
## ---------------------------------------------------------------------------------
## ! \file snes/sprite.h
##     \brief snes sprites functionality.
##

type
  t_sprites* {.importc: "t_sprites", header: "snes/sprite.h", packed.} = object
    oamx*: int16
    oamy*: int16
    oamframeid*: uint16
    oamattribute*: uint8
    oamrefresh*: uint8
    oamgraphics*: ptr uint8
    dummy1*: uint16
    dummy2*: uint16


## !< seems to do nothing
## !	\struct t_metasprites
##     \brief Dynamic metasprite definition (16 bytes)
##

## !!!Ignored construct:  typedef struct { s16 metsprofsx ; !< 0 x offset of the current sprite in meta sprite, 0xFFFF if it is the end of meta sprite definition s16 metsprofsy ; !< 2 y offset of the current sprite in meta sprite u16 metsprframeid ; !< 4 frame index in graphic file of the sprite u8 metsprattribute ; !< 6 sprite attribute value (vhoopppc v : vertical flip h: horizontal flip o: priority bits p: palette num c : last byte of tile num) u8 metsprtype ; !< 7 1,2 or 4 for 32x32, 16x16, 8x8 sprite type u8 * metsprgraphics ; !< 8..11 pointer to graphic file u16 metsprend;                           /*!< 12..13 0xFFFF if it is the end of meta sprite definition */
## u16 dummy1;                              /*!< 14..15 to be 16 aligned */ } t_metasprites __attribute__ ( ( __packed__ ) ) ;
## Error: token expected: ; but got: [identifier]!!!

## !< seems to do nothing
##  Metasprite sub-item structure
##     @param dx     delta X coordinate of the sprite relative to the metasprite origin (0,0)
##     @param dy     delta Y coordinate of the sprite relative to the metasprite origin (0,0)
##     @param dtile  start tile relative to the metasprites own set of tiles
##     @param props  property Flags (palette and priority, flip x/y will be added later)
##
##     Metasprites are built from multiple metasprite_t items (one for each sub-sprite)
##     and a pool of tiles they reference. If a metasprite has multiple frames then each
##     frame will be built from some number of metasprite_t items (which may vary based
##     on how many sprites are required for that particular frame).
##
##     A metasprite frame is terminated with a {metasprite_end} entry.
##

type
  t_metasprite* {.importc: "t_metasprite", header: "snes/sprite.h", bycopy.} = object
    dx* {.importc: "dx".}: u16
    dy* {.importc: "dy".}: u16
    dtile* {.importc: "dtile".}: u16
    props* {.importc: "props".}: u8
    unused* {.importc: "unused".}: u8
    ##  to be sure to align on 16 bits


const
  metasprite_end* = -128

template METASPR_ITEM*(dx, dy, dt, a: untyped): void =
  ## !!!Ignored construct:  ( dx ) , ( dy ) , ( dt ) , ( a ) }
  ## Error: expected ';'!!!

const
  METASPR_TERM* = (metasprite_end,)

## !  \brief Sprite Table (from no$sns help file)<br>
## Contains data for 128 OBJs. OAM Size is 512+32 Bytes. The first part (512<br>
## bytes) contains 128 4-byte entries for each OBJ:<br>
##   Byte 0 - X-Coordinate (lower 8bit) (upper 1bit at end of OAM)<br>
##   Byte 1 - Y-Coordinate (all 8bits)<br>
##   Byte 2 - Tile Number  (lower 8bit) (upper 1bit within Attributes)<br>
##   Byte 3 - Attributes<br>
## Attributes:<br>
##   Bit7    Y-Flip (0=Normal, 1=Mirror Vertically)<br>
##   Bit6    X-Flip (0=Normal, 1=Mirror Horizontally)<br>
##   Bit5-4  Priority relative to BG (0=Low..3=High)<br>
##   Bit3-1  Palette Number (0-7) (OBJ Palette 4-7 can use Color Math via CGADSUB)<br>
##   Bit0    Tile Number (upper 1bit)<br>
## After above 512 bytes, additional 32 bytes follow, containing 2-bits per OBJ:<br>
##   Bit7    OBJ 3 OBJ Size     (0=Small, 1=Large)<br>
##   Bit6    OBJ 3 X-Coordinate (upper 1bit)<br>
##   Bit5    OBJ 2 OBJ Size     (0=Small, 1=Large)<br>
##   Bit4    OBJ 2 X-Coordinate (upper 1bit)<br>
##   Bit3    OBJ 1 OBJ Size     (0=Small, 1=Large)<br>
##   Bit2    OBJ 1 X-Coordinate (upper 1bit)<br>
##   Bit1    OBJ 0 OBJ Size     (0=Small, 1=Large)<br>
##   Bit0    OBJ 0 X-Coordinate (upper 1bit)<br>
## And so on, next 31 bytes with bits for OBJ4..127. Note: The meaning of the OBJ<br>
## Size bit (Small/Large) can be defined in OBSEL Register (Port 2101h).<br>
##

var oambuffer* {.header: "snes/sprite.h".}: array[128, t_sprites]

## !< \brief current sprite buffer for dynamic engine
##
##  \brief to address oam table low and high
##
##  This buffer is automatically transferred to the PPU OAM by the \ref VBlank-ISR on non lag-frames.
##

var oamMemory* {.header: "snes/sprite.h".}: array[128 * 4 + 8 * 4, u8]

## ! \def REG_OBSEL
##     \brief Object Size and Object Base (W)
##     7-5   OBJ Size Selection  (0-5, see below) (6-7=Reserved)
##          Val Small  Large
##          0 = 8x8    16x16    ;Caution:
##          1 = 8x8    32x32    ;In 224-lines mode, OBJs with 64-pixel height
##          2 = 8x8    64x64    ;may wrap from lower to upper screen border.
##          3 = 16x16  32x32    ;In 239-lines mode, the same problem applies
##          4 = 16x16  64x64    ;also for OBJs with 32-pixel height.
##          5 = 32x32  64x64
##          6 = 16x32  32x64 (undocumented)
##          7 = 16x32  32x32 (undocumented)
##         (Ie. a setting of 0 means Small OBJs=8x8, Large OBJs=16x16 pixels)
##         (Whether an OBJ is "small" or "large" is selected by a bit in OAM)
##     4-3   Gap between OBJ 0FFh and 100h (0=None) (4K-word steps) (8K-byte steps)
##     2-0   Base Address for OBJ Tiles 000h..0FFh  (8K-word steps) (16K-byte steps)
##

template REG_OBSEL*: untyped = (cast[ptr vuint8](0x2101)[])

## ! \def REG_OAMADDL
##     \def REG_OAMADDH
##     \brief OAM Address and Priority Rotation (W)
##     15    OAM Priority Rotation  (0=OBJ num 0, 1=OBJ num N) (OBJ with highest priority)
##     9-14  Not used
##     7-1   OBJ Number num N (for OBJ Priority)   ;bit7-1 are used for two purposes
##     8-0   OAM Address   (for OAM read/write)    ;
##
##     This register contains of a 9bit Reload value and a 10bit Address register (plus the
##     priority flag). Writing to 2102h or 2103h does change the lower 8bit or upper 1bit of
##     the Reload value, and does additionally copy the (whole) 9bit Reload value to the 10bit
##     Address register (with address Bit0=0 so next access will be an even address).
##     Caution: During rendering, the PPU is destroying the Address register (using it internally
##     for whatever purposes), after rendering (at begin of Vblank, ie. at begin of line 225/240,
##     but only if not in Forced Blank mode) it reinitializes the Address from the Reload value;
##     the same reload occurs also when deactivating forced blank anytime during the first scanline
##     of vblank (ie. during line 225/240).
##

template REG_OAMADDL*: untyped = (cast[ptr vuint8](0x2102)[])
template REG_OAMADDH*: untyped = (cast[ptr vuint8](0x2103)[])

##
##   1st Access: Lower 8bit (even address)
##   2nd Access: Upper 8bit (odd address)
##

template REG_OAMDATA*: untyped = (cast[ptr vuint8](0x2104)[]) ## !< \brief OAM Data Write (W)
template REG_RDOAM*: untyped = (cast[ptr vuint8](0x2138)[]) ## !< \brief OAM Data Read (R)

## ! \brief Initializes the 2D sprite engine
##

proc oamInit*() {.cdecl, importc: "oamInit", header: "snes/sprite.h".}
## ! \brief Write all OBJ descriptors to OAM
##

proc oamUpdate*() {.cdecl, importc: "oamUpdate", header: "snes/sprite.h".}
## ! \brief sets an oam entry to the supplied values
##     \param id the oam number to be set [0 - 127] * 4 because of oam structure
##     \param xf x flipping [0 - 1]
##     \param yf y flipping [0 - 1]
##

proc oamFlip*(id: u16; xf: u8; yf: u8) {.cdecl, importc: "oamFlip", header: "snes/sprite.h".}
## ! \brief sets an oam entry to the supplied values
##     \param id the oam number to be set [0 - 127] * 4 because of oam structure
##     \param xspr the x location of the sprite in pixels
##     \param yspr the y location of the sprite in pixels
##     \param gfxoffset tilenumber graphic offset
##     \param attr (attributes with priority, flipping, palette)
##

proc oamSetAttr*(id: u16; xspr: u16; yspr: u16; gfxoffset: u16; attr: u8) {.cdecl,
    importc: "oamSetAttr", header: "snes/sprite.h".}
## ! \brief defined attribute of a sprite
##     \param priority The sprite priority (0 to 3)
##     \param vflip flip the sprite vertically
##     \param hflip flip the sprite horizontally
##     \param gfxoffset tilenumber graphic offset
##     \param paletteoffset palette default offset for sprite
##

template OAM_ATTR*(priority, hflip, vflip, gfxoffset, paletteoffset: untyped): untyped =
  ((vflip shl 7) or (hflip shl 6) or (priority shl 4) or (paletteoffset shl 1) or
      ((gfxoffset shr 8) and 1))

## ! \brief sets an oam entry to the supplied values
##     \param id the oam number to be set [0 - 127] * 4 because of oam structure
##     \param xspr the x location of the sprite in pixels
##     \param yspr the y location of the sprite in pixels
##     \param priority The sprite priority (0 to 3)
##     \param vflip flip the sprite vertically
##     \param hflip flip the sprite horizontally
##     \param gfxoffset tilenumber graphic offset
##     \param paletteoffset palette default offset for sprite
##

proc oamSet*(id: u16; xspr: u16; yspr: u16; priority: u8; hflip: u8; vflip: u8;
            gfxoffset: u16; paletteoffset: u8) {.cdecl, importc: "oamSet",
    header: "snes/sprite.h".}
## ! \brief sets an oam coordinate to the supplied values
##     \param id the oam number to be set [0 - 127] * 4 because of oam structure
##     \param xspr the x location of the sprite in pixels
##     \param yspr the y location of the sprite in pixels
##

proc oamSetXY*(id: u16; xspr: u16; yspr: u16) {.cdecl, importc: "oamSetXY",
    header: "snes/sprite.h".}
## ! \brief get the x oam coordinate to the supplied values
##     \param id the oam number to be set [0 - 127] * 4 because of oam structure
##

template oamGetX*(id: untyped): untyped =
  (oamMemory[id + 0])

## ! \brief get the y oam coordinate to the supplied values
##     \param id the oam number to be set [0 - 127] * 4 because of oam structure
##

template oamGetY*(id: untyped): untyped =
  (oamMemory[id + 1])

## ! \brief sets an oam graphic offset to the supplied values
##     \param id the oam number to be set [0 - 127] * 4 because of oam structure
##     \param gfxoffset tilenumber graphic offset
##

proc oamSetGfxOffset*(id: u16; gfxoffset: u16) {.cdecl, importc: "oamSetGfxOffset",
    header: "snes/sprite.h".}
## ! \brief Put the correct size and hide or show a sprite
##     \param id the oam number to be set [0 - 127] * 4 because of oam structure
##     \param size	normal or large (OBJ_SMALL or OBJ_LARGE)
##     \param hide	1 (OBJ_HIDE) to to hide the sprite, 0 (OBJ_SHOW) to see it
##

proc oamSetEx*(id: u16; size: u8; hide: u8) {.cdecl, importc: "oamSetEx",
                                       header: "snes/sprite.h".}
##  \brief Hide or show a sprite
##     \param id the oam number to be set [0 - 127] * 4 because of oam structure
##     \param hide	1 (OBJ_HIDE) to to hide the sprite, 0 (OBJ_SHOW) to see it
##     \warning When OBJ_HIDE is used, the sprite is set at these coordinates: x = 255, y 240. Therefore when a sprite is hidden and it is needed to show it again (use OBJ_SHOW), it is necessary to reset the sprite coordinates with oamSetXY().
##     If the sprite needs to be hidden and keep its coordinates, please use oamSetGfxOffset instead by passing a transparent tile.
##

proc oamSetVisible*(id: u16; hide: u8) {.cdecl, importc: "oamSetVisible",
                                    header: "snes/sprite.h".}
## ! \brief Hides the sprites in the supplied range: if count is zero all 128 sprites will be hidden
##     \param first	number of 1st sprite to write * 4 because of oam structure
##     \param numEntries	total number of sprites to write
##

proc oamClear*(first: u16; numEntries: u8) {.cdecl, importc: "oamClear",
                                        header: "snes/sprite.h".}
## !\brief Initializes a sprites Gfx and Loads the GFX into VRAM
##     \param tileSource	address of sprites graphics entry
##     \param tileSize	size of sprites graphics
##     \param tilePalette	address of sprites palette entry
##     \param paletteSize	size of palette
##     \param tilePaletteNumber	palette number (0..8)
##     \param address	address of sprite graphics (8K-word steps)
##     \param oamsize	default OAM size (OBJ_SIZE8_L16, OBJ_SIZE8_L32, OBJ_SIZE8_L64, OBJ_SIZE16_L32, OBJ_SIZE16_L64 and OBJ_SIZE32_L64)
##

proc oamInitGfxSet*(tileSource: ptr u8; tileSize: u16; tilePalette: ptr u8;
                   paletteSize: u16; tilePaletteNumber: u8; address: u16; oamsize: u8) {.
    cdecl, importc: "oamInitGfxSet", header: "snes/sprite.h".}
## !\brief Initializes the default sprite size and address in VRAM
##     \param address	address of sprite graphics (8K-word steps)
##     \param oamsize	default OAM size (OBJ_SIZE8_L16, OBJ_SIZE8_L32, OBJ_SIZE8_L64, OBJ_SIZE16_L32, OBJ_SIZE16_L64 and OBJ_SIZE32_L64)
##

proc oamInitGfxAttr*(address: u16; oamsize: u8) {.cdecl, importc: "oamInitGfxAttr",
    header: "snes/sprite.h".}
## !\brief initialize the dynamic sprite engine with each sprite size entries
##     \param gfxsp0adr	address of large sprite graphics entry
##     \param gfxsp1adr	address of small sprite graphics entry
##     \param oamsp0init	address of large sprite number (useful when we have some hud sprites which are not update each frame)
##     \param oamsp1init	address of small sprite number (useful when we have some hud sprites which are not update each frame)
##     \param oamsize	default OAM size : OBJ_SIZE8_L16, OBJ_SIZE8_L32, OBJ_SIZE16_L32 (64pix size is not supported)
##

proc oamInitDynamicSprite*(gfxsp0adr: u16; gfxsp1adr: u16; oamsp0init: u16;
                          oamsp1init: u16; oamsize: u8) {.cdecl,
    importc: "oamInitDynamicSprite", header: "snes/sprite.h".}
## !\brief Init Dynamic sprite engine on a screen (can be useful if you do not want to refresh sprite each frame).
##

proc oamInitDynamicSpriteScreen*() {.cdecl, importc: "oamInitDynamicSpriteScreen",
                                   header: "snes/sprite.h".}
## !\brief Must be call at the end of the frame, initialize the dynamic sprite engine for the next frame.
##

proc oamInitDynamicSpriteEndFrame*() {.cdecl,
                                     importc: "oamInitDynamicSpriteEndFrame",
                                     header: "snes/sprite.h".}
## !\brief Update VRAM graphics for sprites 32x32, 16x16 and 8x8 (can but call in  Vblank if needed).
##

proc oamVramQueueUpdate*() {.cdecl, importc: "oamVramQueueUpdate", header: "snes/sprite.h".}
## !\brief Add a 32x32 sprite on screen.<br>oambuffer[id] needs to be populate before.
##     \param id the oam number to be used [0 - 127]
##

proc oamDynamic32Draw*(id: u16) {.cdecl, importc: "oamDynamic32Draw",
                               header: "snes/sprite.h".}
## !\brief Add a 32x32 sprite on screen.<br>oambuffer[id] needs to be populate before.
##     !\brief    Sprite is never refresh (VRAM must be update before)
##     !\brief    oamframeid is the VRAM entry number for sprite (eg.4 for VRAM offset 0x0040, 15 for 0x0CC...)
##     !\brief    WARNING: as the sprite engine begin at VRAM address 0x0000, you need to take care of High bit
##     !\brief      if you want to use a VRAM entry number more than 0x00FF
##     \param id the oam number to be used [0 - 127]
##

proc oamFix32Draw*(id: u16) {.cdecl, importc: "oamFix32Draw", header: "snes/sprite.h".}
## !\brief Add a 16x16 sprite on screen.<br>oambuffer[id] needs to be populate before.
##     \param id the oam number to be used  [0 - 127]
##

proc oamDynamic16Draw*(id: u16) {.cdecl, importc: "oamDynamic16Draw",
                               header: "snes/sprite.h".}
## !\brief Add a 16x16 sprite on screen.<br>oambuffer[id] needs to be populate before.
##     !\brief    Sprite is never refresh (VRAM must be update before)
##     !\brief    oamframeid is the VRAM entry number for sprite (eg.4 for VRAM offset 0x0040, 15 for 0x0CC...)
##     !\brief    WARNING: as the sprite engine begin at VRAM address 0x0000, you need to take care of High bit
##     !\brief      if you want to use a VRAM entry number more than 0x00FF
##     \param id the oam number to be used  [0 - 127]
##

proc oamFix16Draw*(id: u16) {.cdecl, importc: "oamFix16Draw", header: "snes/sprite.h".}
## !\brief Add a 8x8 sprite on screen.<br>oambuffer[id] needs to be populate before.
##     \param id the oam number to be used [0 - 127]
##

proc oamDynamic8Draw*(id: u16) {.cdecl, importc: "oamDynamic8Draw", header: "snes/sprite.h".}
## !\brief Add a 8x8 sprite on screen.<br>oambuffer[id] needs to be populate before.
##     !\brief    Sprite is never refresh (VRAM must be update before)
##     !\brief    oamframeid is the VRAM entry number for sprite (eg.4 for VRAM offset 0x0040, 15 for 0x0CC...)
##     !\brief    WARNING: as the sprite engine begin at VRAM address 0x0000, you need to take care of High bit
##     !\brief      if you want to use a VRAM entry number more than 0x00FF
##     \param id the oam number to be used [0 - 127]
##

proc oamFix8Draw*(id: u16) {.cdecl, importc: "oamFix8Draw", header: "snes/sprite.h".}
## !\brief Add a Meta sprite on screen (can be composed of 8x8,16x16 or 32x32 sprites).<br>oambuffer[id] needs to be populate before.
##     \param id the oam number to be used [0 - 127].
##     \param x x coordinate of the metasprite
##     \param y y coordinate of the metasprite
##     \param sprmeta	pointer to metasprite structure (must finish with 0xFFFF, see t_metasprites)
##     \brief the meta structure is composed of:<br>
##         x offset,y offset,gfx offset, attribute,  size (8,16,32),gfxfile<br>
##         the function will reserve the number of sprites in oambuffer, beginning with id.
##

proc oamDynamicMetaDraw*(id: u16; x: s16; y: s16; sprmeta: ptr u8) {.cdecl,
    importc: "oamDynamicMetaDraw", header: "snes/sprite.h".}
## !\brief Add a Meta sprite on screen (can be composed only of 16x16 sprites).<br>oambuffer[id] needs to be populate before.
##     \param id the oam number to be used [0 - 127].
##     \param x x coordinate of the metasprite
##     \param y y coordinate of the metasprite
##     \param sprmeta	pointer to metasprite structure (must finish with 0xFFFF, see t_metasprites)
##     \param gfxptr pointer to graphic entry for all sprites of the metasprite
##     \brief the meta structure is composed of:<br>
##         x offset,y offset,gfx offset, attribute<br>
##         the function will reserve the number of sprites in oambuffer, beginning with id.
##         It is necessarilly a LARGE sprite for 32 pixel width.<br>
##

proc oamMetaDrawDyn32*(id: u16; x: s16; y: s16; sprmeta: ptr u8; gfxptr: ptr u8) {.cdecl,
    importc: "oamMetaDrawDyn32", header: "snes/sprite.h".}
## !\brief Add a Meta sprite on screen (can be composed only of 16x16 sprites).<br>oambuffer[id] needs to be populate before.
##     \param id the oam number to be used [0 - 127].
##     \param x x coordinate of the metasprite
##     \param y y coordinate of the metasprite
##     \param sprmeta pointer to metasprite structure (must finish with 0xFFFF, see t_metasprites)
##     \param ofsgfx offset of graphics related to initiale sprite graphic offset (ex:0x100 if sprites begins at 0x0000 and graphics at 0x0100)
##     \brief the meta structure is composed of:<br>
##         x offset,y offset,gfx offset, attribute<br>
##         the function will reserve the number of sprites in oambuffer, beginning with id.<br>
##         It is necessarilly a LARGE sprite for 32 pixel width.<br>
##         You need to have graphics of Metasprite in VRAM before using this function.
##

proc oamMetaDraw32*(id: u16; x: s16; y: s16; sprmeta: ptr u8; ofsgfx: u16) {.cdecl,
    importc: "oamMetaDraw32", header: "snes/sprite.h".}
## !\brief Add a Meta sprite on screen (can be composed only of 16x16 sprites).<br>oambuffer[id] needs to be populate before.
##     \param id the oam number to be used [0 - 127].
##     \param x x coordinate of the metasprite
##     \param y y coordinate of the metasprite
##     \param sprmeta	pointer to metasprite structure (must finish with 0xFFFF, see t_metasprites)
##     \param gfxptr pointer to graphic entry for all sprites of the metasprite
##     \param sprsize size (OBJ_SMALL or  OBJ_LARGE sprite table to use, 16bits for speed optim)
##     \brief the meta structure is composed of:<br>
##         x offset,y offset,gfx offset, attribute<br>
##         the function will reserve the number of sprites in oambuffer, beginning with id.
##

proc oamMetaDrawDyn16*(id: u16; x: s16; y: s16; sprmeta: ptr u8; gfxptr: ptr u8; sprsize: u16) {.
    cdecl, importc: "oamMetaDrawDyn16", header: "snes/sprite.h".}
## !\brief Add a Meta sprite on screen (can be composed only of 16x16 sprites).<br>oambuffer[id] needs to be populate before.
##     \param id the oam number to be used [0 - 127].
##     \param x x coordinate of the metasprite
##     \param y y coordinate of the metasprite
##     \param sprmeta	pointer to metasprite structure (must finish with 0xFFFF, see t_metasprites)
##     \param sprsize size (OBJ_SMALL or  OBJ_LARGE sprite table to use, 16bits for speed optim)
##     \param ofsgfx offset of graphics related to initiale sprite graphic offset (ex:0x100 if sprites begins at 0x0000 and graphics at 0x0100)
##     \brief the meta structure is composed of:<br>
##         x offset,y offset,gfx offset, attribute<br>
##         the function will reserve the number of sprites in oambuffer, beginning with id.<br>
##         You need to have graphics of Metasprite in VRAM before using this function.
##

proc oamMetaDraw16*(id: u16; x: s16; y: s16; sprmeta: ptr u8; sprsize: u16; ofsgfx: u16) {.
    cdecl, importc: "oamMetaDraw16", header: "snes/sprite.h".}
## !\brief Add a Meta sprite on screen (can be composed only of 16x16 sprites).<br>oambuffer[id] needs to be populate before.
##     \param id the oam number to be used [0 - 127].
##     \param x x coordinate of the metasprite
##     \param y y coordinate of the metasprite
##     \param sprmeta	pointer to metasprite structure (must finish with 0xFFFF, see t_metasprites)
##     \param gfxptr pointer to graphic entry for all sprites of the metasprite
##     \brief the meta structure is composed of:<br>
##         x offset,y offset,gfx offset, attribute<br>
##         the function will reserve the number of sprites in oambuffer, beginning with id.
##         It is necessarilly a SMALL sprite for 32 pixel width.<br>
##

proc oamMetaDrawDyn8*(id: u16; x: s16; y: s16; sprmeta: ptr u8; gfxptr: ptr u8) {.cdecl,
    importc: "oamMetaDrawDyn8", header: "snes/sprite.h".}
## !\brief Add a Meta sprite on screen (can be composed only of 16x16 sprites).<br>oambuffer[id] needs to be populate before.
##     \param id the oam number to be used [0 - 127].
##     \param x x coordinate of the metasprite
##     \param y y coordinate of the metasprite
##     \param sprmeta	pointer to metasprite structure (must finish with 0xFFFF, see t_metasprites)
##     \param ofsgfx offset of graphics related to initiale sprite graphic offset (ex:0x100 if sprites begins at 0x0000 and graphics at 0x0100)
##     \brief the meta structure is composed of:<br>
##         x offset,y offset,gfx offset, attribute<br>
##         the function will reserve the number of sprites in oambuffer, beginning with id.<br>
##         It is necessarilly a SMALL sprite for 32 pixel width.<br>
##         You need to have graphics of Metasprite in VRAM before using this function.
##

proc oamMetaDraw8*(id: u16; x: s16; y: s16; sprmeta: ptr u8; ofsgfx: u16) {.cdecl,
    importc: "oamMetaDraw8", header: "snes/sprite.h".}
## ---------------------------------------------------------------------------------
##
##     Video registers and defines
##
##     Copyright (C) 2012-2017
##         Alekmaul
##
##     This software is provided 'as-is', without any express or implied
##     warranty.  In no event will the authors be held liable for any
##     damages arising from the use of this software.
##
##     Permission is granted to anyone to use this software for any
##     purpose, including commercial applications, and to alter it and
##     redistribute it freely, subject to the following restrictions:
##
##     1.	The origin of this software must not be misrepresented; you
##         must not claim that you wrote the original software. If you use
##         this software in a product, an acknowledgment in the product
##         documentation would be appreciated but is not required.
##     2.	Altered source versions must be plainly marked as such, and
##         must not be misrepresented as being the original software.
##     3.	This notice may not be removed or altered from any source
##         distribution.
##
## ---------------------------------------------------------------------------------
## !	\file snes/video.h
##     \brief contains the basic definitions for controlling the video hardware.
##
##

## !!!Ignored construct:  # SNES_VIDEO_INCLUDE [NewLine] # SNES_VIDEO_INCLUDE [NewLine] # < snes / snestypes . h > [NewLine] !	\brief Bit defines for the video control registers typedef enum { DSP_FORCEVBL = BIT ( 7 ) , !< \brief Forced Blanking (0=Normal, 1=Screen Black) VRAM_INCLOW = ( 0 << 7 ) , !< \brief Increment VRAM Address after accessing High/Low byte (0=Low, 1=High) VRAM_INCHIGH = ( 1 << 7 ) , VRAM_ADRTR_0B = ( 0 << 2 ) , !< \brief Address Translation    (0..3 = 0bit/None, 8bit, 9bit, 10bit) VRAM_ADRTR_8B = ( 1 << 2 ) , !< \brief Address Translation    (0..3 = 0bit/None, 8bit, 9bit, 10bit) VRAM_ADRTR_9B = ( 2 << 2 ) , !< \brief Address Translation    (0..3 = 0bit/None, 8bit, 9bit, 10bit) VRAM_ADRTR_10B = ( 3 << 2 ) , !< \brief Address Translation    (0..3 = 0bit/None, 8bit, 9bit, 10bit) VRAM_ADRSTINC_1 = ( 0 << 0 ) , !< \brief Address Increment Step (0..3 = Increment Word-Address by 1,32,128,128) VRAM_ADRSTINC_32 = ( 1 << 0 ) , !< \brief Address Increment Step (0..3 = Increment Word-Address by 1,32,128,128) VRAM_ADRSTINC_128 = ( 2 << 0 ) !< \brief Address Increment Step (0..3 = Increment Word-Address by 1,32,128,128) } VideoControl ;
## Error: did not expect [NewLine]!!!

const
  FADE_IN* = 2
  FADE_OUT* = 1
  MOSAIC_IN* = 2
  MOSAIC_OUT* = 1
  MOSAIC_BG1* = (1 shl 0)
  MOSAIC_BG2* = (1 shl 1)
  MOSAIC_BG3* = (1 shl 2)
  MOSAIC_BG4* = (1 shl 3)
  CM_DIRCOLOR* = (1 shl 0)        ## !< \brief  Color Math Control Register A & B bits
  CM_SUBBGOBJ_ENABLE* = (1 shl 1)
  CM_ALWAYS_ENABLE* = (0 shl 4)
  CM_MATWIN_ENABLE* = (1 shl 4)
  CM_NOMATWIN_ENABLE* = (2 shl 4)
  CM_NEVER_ENABLE* = (3 shl 4)
  CM_SCBLK_ALWAYS_ENABLE* = (0 shl 6)
  CM_SCBLK_MATWIN_ENABLE* = (1 shl 6)
  CM_SCBLK_NOMATWIN_ENABLE* = (2 shl 6)
  CM_SCBLK_NEVER_ENABLE* = (3 shl 6)
  CM_SUB_MAINSUB* = (1 shl 7)
  CM_DIV2_DIVIDE* = (1 shl 6)
  CM_MSCR_BACK* = (1 shl 5)
  CM_MSCR_PAL47* = (1 shl 4)
  CM_MSCR_BG4* = (1 shl 3)
  CM_MSCR_BG3* = (1 shl 2)
  CM_MSCR_BG2* = (1 shl 1)
  CM_MSCR_BG1* = (1 shl 0)
  CM_APPLY_BLUE* = (1 shl 7)
  CM_APPLY_GREEN* = (1 shl 6)
  CM_APPLY_RED* = (1 shl 5)
  M7_HFLIP* = (1 shl 0)           ## !< \brief Mode7 screen H-Flip (0=Normal, 1=Flipped) flip 256x256 "screen"
  M7_VFLIP* = (1 shl 1)           ## !< \brief Mode7 screen V-Flip (0=Normal, 1=Flipped) flip 256x256 "screen"
  M7_WRAP* = (1 shl 6)            ## !< \brief Mode7 Wrap within 128x128 tile area
  M7_OUTTRANS* = (2 shl 6)        ## !< \brief Outside 128x128 tile area is Transparent
  M7_OUTTILE* = (3 shl 6)         ## !< \brief Outside 128x128 tile area is filled by Tile 00h
  PPU_50HZ* = (1 shl 4)           ## !< \brief Frame Rate (PPU2.Pin30)  (0=NTSC/60Hz, 1=PAL/50Hz)

## ! \def REG_INIDISP
##     \brief Display Control 1 (W)
##     7     Forced Blanking (0=Normal, 1=Screen Black)
##     6-4   Not used
##     3-0   Master Brightness (0=Screen Black, or N=1..15: Brightness*(N+1)/16)
##
##     In Forced Blank, VRAM, OAM and CGRAM can be freely accessed (otherwise it's
##     accessible only during Vblank). Even when in forced blank, the TV Set keeps
##     receiving Vsync/Hsync signals (thus producing a stable black picture). And,
##     the CPU keeps receiving Hblank/Vblank signals (so any enabled video NMIs, IRQs,
##     HDMAs are kept generated).
##
##     Forced blank doesn't apply immediately... so one must wait whatever
##     (maybe a scanline) before VRAM can be freely accessed... or is it only
##     vice-versa: disabling forced blank doesn't apply immediately/shows garbage
##     pixels?
##

template REG_INIDISP*: untyped = (cast[ptr vuint8](0x2100)[])

## ! \def REG_VMAIN
##     \brief VRAM Address Increment Mode (W)
##     7     Increment VRAM Address after accessing High/Low byte (0=Low, 1=High)
##     6-4   Not used
##     3-2   Address Translation    (0..3 = 0bit/None, 8bit, 9bit, 10bit)
##     1-0   Address Increment Step (0..3 = Increment Word-Address by 1,32,128,128)
##
##     The address translation is intended for bitmap graphics (where one would have filled the BG Map
##     by increasing Tile numbers), technically it does thrice left-rotate the lower 8, 9, or 10 bits
##     of the Word-address:
##     Translation  Bitmap Type              Port [2116h/17h]    VRAM Word-Address
##     8bit rotate  4-color; 1 word/plane    aaaaaaaaYYYxxxxx --> aaaaaaaaxxxxxYYY
##     9bit rotate  16-color; 2 words/plane  aaaaaaaYYYxxxxxP --> aaaaaaaxxxxxPYYY
##     10bit rotate 256-color; 4 words/plane aaaaaaYYYxxxxxPP --> aaaaaaxxxxxPPYYY
##
##     Where "aaaaa" would be the normal address MSBs, "YYY" is the Y-index (within a 8x8 tile),
##     "xxxxx" selects one of the 32 tiles per line, "PP" is the bit-plane index (for BGs with more
##     than one Word per plane). For the intended result (writing rows of 256 pixels) the Translation
##     should be combined with Increment Step=1.
##     For Mode 7 bitmaps one could eventually combine step 32/128 with 8bit/10bit rotate:
##
##   8bit-rotate/step32   aaaaaaaaXXXxxYYY --> aaaaaaaaxxYYYXXX
##   10bit-rotate/step128 aaaaaaXXXxxxxYYY --> aaaaaaxxxxYYYXXX
##
##     Though the SNES can't access enough VRAM for fullscreen Mode 7 bitmaps.
##     Step 32 (without translation) is useful for updating BG Map columns (eg. after horizontal scrolling).
##

template REG_VMAIN*: untyped = (cast[ptr vuint8](0x2115)[])

## ! \def REG_VMADDLH
##     \brief  VMADDL - VRAM Address (lower 8bit) (W)
##             VMADDH - VRAM Address (upper 8bit) (W)
##
##     VRAM Address for reading/writing. This is a WORD address (2-byte steps),
##     the PPU could theoretically address up to 64K-words (128K-bytes), in practice,
##     only 32K-words (64K-bytes) are installed in SNES consoles (VRAM address bit15
##     is not connected, so addresses 8000h-FFFFh are mirrors of 0-7FFFh).
##     After reading/writing VRAM Data, the Word-address can be automatically incremented
##     by 1,32,128 (depending on the Increment Mode in Port 2115h) (Note: the Address Translation
##     feature is applied only "temporarily" upon memory accesses, it doesn't affect the
##     value in Port 2116h-17h).
##     Writing to 2116h/2117h does prefetch 16bit data from the new address (for later reading).
##

template REG_VMADDLH*: untyped = (cast[ptr vuint16](0x2116)[])

##
##     Writing to 2118h or 2119h does simply modify the LSB or MSB of the currently addressed VRAM
##     word (with optional Address Translation applied). Depending on the Increment Mode the address
##     does (or doesn't) get automatically incremented after the write.
##

template REG_VMDATAL*: untyped = (cast[ptr vuint8](0x2118)[]) ## !< \brief VRAM Data Write (lower 8bit) (W)
template REG_VMDATAH*: untyped = (cast[ptr vuint8](0x2119)[]) ## !< \brief VRAM Data Write (upper 8bit) (W)
template REG_VMDATALH*: untyped = (cast[ptr vuint16](0x2118)[]) ## !< \brief VRAM Data Write (lower and upper 8bit) (W)

## ! \def REG_CGADD
##
##     \brief Palette CGRAM Address (Color Generator Memory) (W)
##     Color index (0..255). This is a WORD-address (2-byte steps), allowing to access
##     256 words (512 bytes). Writing to this register resets the 1st/2nd access
##     flipflop (for 2122h/213Bh) to 1st access.
##

template REG_CGADD*: untyped = (cast[ptr vuint8](0x2121)[])

## ! \def CGRAM_PALETTE
##     \brief Palette CGRAM Data Write (W)
##     1st Access: Lower 8 bits (even address)
##     2nd Access: Upper 7 bits (odd address) (upper 1bit = PPU2 open bus)
##
##     Reads and Writes to EVEN and ODD byte-addresses work as follows:
##     Write to EVEN address  -->  set Cgram_Lsb = Data    ;memorize value
##     Write to ODD address   -->  set WORD[addr-1] = Data*256 + Cgram_Lsb
##     Read from ANY address  -->  return BYTE[addr]
##
##     The address is automatically incremented after every read or write access.
##
##     256-Color Palette Entries
##     15    Not used (should be zero) (read: PPU2 Open Bus)
##     14-10 Blue
##     9-5   Green
##     4-0   Red
##
##     Palette Indices
##     00h      Main Backdrop color (used when all BG/OBJ pixels are transparent)
##     01h-FFh  256-color BG palette (when not using direct-color mode)
##     01h-7Fh  128-color BG palette (BG2 in Mode 7)
##     01h-7Fh  Eight 16-color BG palettes
##     01h-1Fh  Eight 4-color BG palettes (except BG2-4 in Mode 0)
##     21h-3Fh  Eight 4-color BG palettes (BG2 in Mode 0 only)
##     41h-5Fh  Eight 4-color BG palettes (BG3 in Mode 0 only)
##     61h-7Fh  Eight 4-color BG palettes (BG4 in Mode 0 only)
##     81h-FFh  Eight 16-color OBJ palettes (half of them with color-math disabled)
##     N/A      Sub Backdrop color (not in CGRAM, set via COLDATA, Port 2132h)
##

const
  CGRAM_PALETTE* = (cast[ptr u8](0x2122))

## ! \def REG_CGWSEL
##     \brief Color Math Control Register A (W)
##     7-6  Force Main Screen Black (3=Always, 2=MathWindow, 1=NotMathWin, 0=Never)
##     5-4  Color Math Enable       (0=Always, 1=MathWindow, 2=NotMathWin, 3=Never)
##     3-2  Not used
##     1    Sub Screen BG/OBJ Enable    (0=No/Backdrop only, 1=Yes/Backdrop+BG+OBJ)
##     0    Direct Color (for 256-color BGs)  (0=Use Palette, 1=Direct Color)
##

template REG_CGWSEL*: untyped = (cast[ptr vuint8](0x2130)[])

## ! \def REG_CGADSUB
##     \brief Color Math Control Register B (W)
##     7    Color Math Add/Subtract        (0=Add; Main+Sub, 1=Subtract; Main-Sub)
##     6    Color Math "Div2" Half Result  (0=No divide, 1=Divide result by 2)
##     5    Color Math when Main Screen = Backdrop        (0=Off, 1=On) ;\
##     4    Color Math when Main Screen = OBJ/Palette4..7 (0=Off, 1=On) ; OFF: Show
##     -    Color Math when Main Screen = OBJ/Palette0..3 (Always=Off)  ; Raw Main,
##     3    Color Math when Main Screen = BG4             (0=Off, 1=On) ;   or
##     2    Color Math when Main Screen = BG3             (0=Off, 1=On) ; ON: Show
##     1    Color Math when Main Screen = BG2             (0=Off, 1=On) ; Main+/-Sub
##     0    Color Math when Main Screen = BG1             (0=Off, 1=On) ;/
##

template REG_CGADSUB*: untyped = (cast[ptr vuint8](0x2131)[])

## ! \def REG_COLDATA
##      \brief Color Math Sub Screen Backdrop Color (W)
##     This 8bit port allows to manipulate some (or all) bits
##     of a 15bit RGB value. Examples: Black: write E0h (R,G,B=0), Cyan: write 20h (R=0) and DFh (G,B=1Fh).
##     7    Apply Blue  (0=No change, 1=Apply Intensity as Blue)
##     6    Apply Green (0=No change, 1=Apply Intensity as Green)
##     5    Apply Red   (0=No change, 1=Apply Intensity as Red)
##     4-0  Intensity   (0..31)
##

template REG_COLDATA*: untyped = (cast[ptr vuint8](0x2132)[])

## ! \def REG_M7SEL
##     \brief Rotation/Scaling Mode Settings (W)
##     7-6   Screen Over (see below)
##     5-2   Not used
##     1     Screen V-Flip (0=Normal, 1=Flipped)     ; flip 256x256 "screen"
##     0     Screen H-Flip (0=Normal, 1=Flipped)     ;
##
##     Screen Over (when exceeding the 128x128 tile BG Map size):
##     0=Wrap within 128x128 tile area
##     1=Wrap within 128x128 tile area (same as 0)
##     2=Outside 128x128 tile area is Transparent
##     3=Outside 128x128 tile area is filled by Tile 00h
##

template REG_M7SEL*: untyped = (cast[ptr vuint8](0x211A)[])

##  1st Write: Lower 8bit  ;\1st/2nd write mechanism uses "M7_old"
##   2nd Write: Upper 8bit  ;/
##

template REG_M7A*: untyped = (cast[ptr vuint8](0x211B)[]) ## !< \brief Rotation/Scaling Parameter A (and Maths 16bit operand) (W)
template REG_M7B*: untyped = (cast[ptr vuint8](0x211C)[]) ## !< \brief Rotation/Scaling Parameter B (and Maths 16bit operand) (W)
template REG_M7C*: untyped = (cast[ptr vuint8](0x211D)[]) ## !< \brief Rotation/Scaling Parameter C (W)
template REG_M7D*: untyped = (cast[ptr vuint8](0x211E)[]) ## !< \brief Rotation/Scaling Parameter D (W)
template REG_M7HOFS*: untyped = (cast[ptr vuint8](0x210D)[]) ## !< \brief BG1 Horizontal Scroll (X) (W)
template REG_M7VOFS*: untyped = (cast[ptr vuint8](0x210E)[]) ## !< \brief BG1 Vertical Scroll (Y) (W)
template REG_M7X*: untyped = (cast[ptr vuint8](0x211F)[]) ## !< \brief Rotation/Scaling Center Coordinate X (W)
template REG_M7Y*: untyped = (cast[ptr vuint8](0x2120)[]) ## !< \brief Rotation/Scaling Center Coordinate Y (W)

##  After writing to 211Bh or 211Ch, the result can be read immediately from 2134h-2136h (the 21xxh Ports
##   are rapidly clocked by the PPU, there's no delay needed when reading via "MOV A,[211Ch]" or via
##   "MOV A,[1Ch]" (with D=2100h), both works even when the CPU runs at 3.5MHz).
##

template REG_MPYL*: untyped = (cast[ptr vuint8](0x2134)[]) ## !< \brief Signed Multiply Result (lower 8bit) (R)
template REG_MPYM*: untyped = (cast[ptr vuint8](0x2135)[]) ## !< \brief Signed Multiply Result (middle 8bit) (R)
template REG_MPYH*: untyped = (cast[ptr vuint8](0x2136)[]) ## !< \brief Signed Multiply Result (upper 8bit) (R)
template REG_MPYMH*: untyped = (cast[ptr vuint16](0x2135)[]) ## !< \brief Signed Multiply Result (middle +upper 8bit) (R)

## ! \def REG_STAT77
##     \brief PPU1 Status and Version Number (R)
##     7    OBJ Time overflow  (0=Okay, 1=More than 8x34 OBJ pixels per scanline)
##     6    OBJ Range overflow (0=Okay, 1=More than 32 OBJs per scanline)
##     5    Master/Slave Mode (PPU1.Pin25) (0=Normal=Master)
##     4    Not used (PPU1 open bus) (same as last value read from PPU1)
##     3-0  PPU1 5C77 Version Number (only version 1 exists as far as I know)
##
## The overflow flags are cleared at end of V-Blank, but NOT during forced blank!
## The overflow flags are set (regardless of OBJ enable/disable in 212Ch), at following
##     times: Bit6 when V=OBJ.YLOC/H=OAM.INDEX*2, bit7 when V=OBJ.YLOC+1/H=0.
##

template REG_STAT77*: untyped = (cast[ptr vuint8](0x213E)[])

## ! \def REG_STAT78
##     \brief PPU2 Status and Version Number (R)
##     7    Current Interlace-Frame (0=1st, 1=2nd Frame)
##     6    H/V-Counter/Lightgun/Joypad2.Pin6 Latch Flag (0=No, 1=New Data Latched)
##     5    Not used (PPU2 open bus) (same as last value read from PPU2)
##     4    Frame Rate (PPU2.Pin30)  (0=NTSC/60Hz, 1=PAL/50Hz)
##     3-0  PPU2 5C78 Version Number (version 1..3 exist as far as I know)
##

template REG_STAT78*: untyped = (cast[ptr vuint8](0x213F)[])

##  macro creates a 15 bit color from 3x5 bit components
##  \brief  Macro to convert 5 bits or 8 bits r g b components into a single 15 bit RGB triplet

template RGB8*(r, g, b: untyped): untyped =
  (((r) shr 3) or (((g) shr 3) shl 5) or (((b) shr 3) shl 10))

template RGB5*(r, g, b: untyped): untyped =
  ((r) or ((g) shl 5) or ((b) shl 10))

const
  SCREEN_HEIGHT* = 224
  SCREEN_WIDTH* = 256

var videoMode* {.header: "snes/video.h".}: u8

## !< \brief Current value of REG_TM

var videoModeSub* {.header: "snes/video.h".}: u8

## !< \brief Current value of REG_TS

var snes_frame_count* {.header: "snes/video.h".}: u16

## !< \brief Number of frame per second (need a call to videoGetFrames() once a frame)
## ! \fn  setBrightness(u8 level)
##     \brief sets the screens brightness.
##     \param level	15 = full brightness, 0= black
##

proc setBrightness*(level: u8) {.cdecl, importc: "setBrightness", header: "snes/video.h".}
## ! \fn  setMode(u8 mode, u8 size)
##     \brief Set the SNES hardware to operate in new display mode.
##     \param mode	0..7 for available Snes display mode
##     \param size	Tile Size (8x8 or 16x16) of each BG in this mode (if available)
##
##     Mode   BG1         BG2         BG3         BG4
##     0      4-color     4-color     4-color     4-color   ;Normal
##     1      16-color    16-color    4-color     -         ;Normal
##     2      16-color    16-color    (o.p.t)     -         ;Offset-per-tile
##     3      256-color   16-color    -           -         ;Normal
##     4      256-color   4-color     (o.p.t)     -         ;Offset-per-tile
##     5      16-color    4-color     -           -         ;512-pix-hires
##     6      16-color    -           (o.p.t)     -         ;512-pix plus Offs-p-t
##     7      256-color   EXTBG       -           -         ;Rotation/Scaling
##

proc setMode*(mode: u8; size: u8) {.cdecl, importc: "setMode", header: "snes/video.h".}
## ! \fn  setScreenOn(void)
##     \brief Put screen On.
##
##     Calls WaitForVBlank() before enabling the screen to flush VBlank buffers/queues and minimise glitches.
##

proc setScreenOn*() {.cdecl, importc: "setScreenOn", header: "snes/video.h".}
## ! \fn  setScreenOff(void)
##     \brief Put screen Off.
##

proc setScreenOff*() {.cdecl, importc: "setScreenOff", header: "snes/video.h".}
## ! \fn  setFadeEffect(u8 mode)
##     \brief Do a fadein or fadeout effect.
##     \param mode	(FADE_IN  = black to complete light, FADE_OUT = light to black)
##

proc setFadeEffect*(mode: u8) {.cdecl, importc: "setFadeEffect", header: "snes/video.h".}
## ! \fn  setFadeEffectEx(u8 mode, u8 framesNumber)
##     \brief Do a fadein or fadeout effect.
##     \param mode	(FADE_IN  = black to complete light, FADE_OUT = light to black)
##     \param framesNumber the number of frames
##

proc setFadeEffectEx*(mode: u8; framesNumber: u8) {.cdecl, importc: "setFadeEffectEx",
    header: "snes/video.h".}
## ! \fn  setMosaicEffect(u8 mode, u8 bgNumbers)
##     \brief Do a mosaic in or out effect.
##     \param bgNumbers	(MOSAIC_BG1 to MOSAIC_BG4 depending of which background to use for effect)
##     \param mode	(MOSAIC_IN  = normal to mosaic, MOSAIC_OUT = mosaic to normal)
##

proc setMosaicEffect*(mode: u8; bgNumbers: u8) {.cdecl, importc: "setMosaicEffect",
    header: "snes/video.h".}
## ! \fn  setColorEffect(u8 colorMathA, u8 colorMathB)
##     \brief Do addition or other color effects.
##     \param colorMathA	value for color math A register (REG_CGWSEL)
##     \param colorMathB	value for color math B register (REG_CGADSUB)
##

proc setColorEffect*(colorMathA: u8; colorMathB: u8) {.cdecl,
    importc: "setColorEffect", header: "snes/video.h".}
## ! \fn  setColorIntensity(u8 colorApply, u8 intensity)
##     \brief Change intensity for transparency
##     \param colorApply	with component is affect (red, green, blue)
##     \param intensity	value for intensity
##

proc setColorIntensity*(colorApply: u8; intensity: u8) {.cdecl,
    importc: "setColorIntensity", header: "snes/video.h".}
## ! \fn  setPalette(palette, paletteEntry, paletteSize)
##     \brief Change a palette in CGRAM.
##     \param palette	address of palette
##     \param paletteEntry palette entry (0..16 for 16 colors mode) of the beginning of each colors
##     \param paletteSize	size of palette
##

template setPalette*(palette, paletteEntry, paletteSize: untyped): untyped =
  dmaCopyCGram(palette, paletteEntry, paletteSize)

## ! \fn  setPaletteColor(paletteEntry, paletteColor)
##     \brief Change a color palette in CGRAM.
##     \param paletteEntry palette color number (0..255)
##     \param paletteColor	RGB5 color
##

template setPaletteColor*(paletteEntry, paletteColor: untyped): untyped =
  REG_CGADD = paletteEntry
  CGRAM_PALETTE[] = (paletteColor) and 0xFF
  CGRAM_PALETTE[] = (paletteColor) shr 8

proc getPaletteColor*(paletteEntry: u8; paletteColor: ptr u16) {.cdecl,
    importc: "getPaletteColor", header: "snes/video.h".}
## ! \fn  setMode7(u8 mode)
##     \brief Put screen in mode 7 with generic init.
##     \param mode	Rotation/Scaling Mode Settings (see REG_M7SEL)
##

proc setMode7*(mode: u8) {.cdecl, importc: "setMode7", header: "snes/video.h".}
## ! \fn  setMode7Rot(u8 angle)
##     \brief Change angle view in mode 7 with matrix transformation.
##     \param angle : 0..255 value
##

proc setMode7Rot*(angle: u8) {.cdecl, importc: "setMode7Rot", header: "snes/video.h".}
## ! \fn  setMode7MoveForwardBack(u8 z8)
##     \brief Change perspective view forward/backward in mode 7 without changing matrix.
##     \param z8 : 0..255 value
##

proc setMode7MoveForwardBack*(z8: u8) {.cdecl, importc: "setMode7MoveForwardBack",
                                     header: "snes/video.h".}
## ! \fn  setMode7MoveLeftRight(u8 z8)
##     \brief Change perspective view left/right in mode 7 without changing matrix.
##     \param z8 : 0..255 value
##

proc setMode7MoveLeftRight*(z8: u8) {.cdecl, importc: "setMode7MoveLeftRight",
                                   header: "snes/video.h".}
## ! \fn  setMode7Angle(u8 angle)
##     \brief Change angle view in mode 7 without changing matrix.
##     \param angle : 0..255 value
##

proc setMode7Angle*(angle: u8) {.cdecl, importc: "setMode7Angle", header: "snes/video.h".}
## ! \fn  setMode7Scale(u16 xscale, u16 yscale)
##     \brief Change scaling effect of screen in mode 7.
##     \param xscale : scaling for x
##     \param yscale : scaling for y
##

proc setMode7Scale*(xscale: u16; yscale: u16) {.cdecl, importc: "setMode7Scale",
    header: "snes/video.h".}
## ! \fn  getFPScounter(void)
##     \brief Return number of frames per second.
##     \return unsigned short of the current frame per second counter
##

proc getFPScounter*(): cushort {.cdecl, importc: "getFPScounter", header: "snes/video.h".}
## ! \fn  showFPScounter(void)
##     \brief Show on current text BG, at location 1,1 the number of frames per second.
##

proc showFPScounter*() {.cdecl, importc: "showFPScounter", header: "snes/video.h".}
