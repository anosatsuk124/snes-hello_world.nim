import std/volatile

type
  vuint8* = uint8
  vuint16* = cushort
  vuint32* = culonglong
  vint8* = cchar
  vint16* = cshort
  vint32* = clonglong
  u8* = vuint8
  u16* = vuint16
  u32* = vuint32
  s8* = vint8
  s16* = vint16

template vload*[T](p: ptr T): T =
  volatileLoad(p)

template vstore*[T](p: ptr T; x: T) =
  volatileStore(p, x)

# BIT(n) (1 << n)
template BIT*(n: int): int =
  1 shl n
