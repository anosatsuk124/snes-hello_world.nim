#!/bin/bash
# Patch Nim-generated C code for SNES compatibility

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <nimcache_dir>" >&2
    exit 1
fi

NIMCACHE="$1"

# Patch 1: NIM_INTBITS 64 -> 16 (SNES is 16-bit processor)
FILES=$(rg -l "NIM_INTBITS 64" "$NIMCACHE" 2>/dev/null || true)
if [ -n "$FILES" ]; then
    for f in $FILES; do
        perl -pi -e 's/#define NIM_INTBITS 64/#define NIM_INTBITS 16/' "$f"
    done
fi

# Patch 2: Undefine bool/true/false macros to avoid conflicts
FILES=$(rg -l "snes/.*\.h" "$NIMCACHE" 2>/dev/null || true)
if [ -n "$FILES" ]; then
    for f in $FILES; do
        perl -i -pe 's/(#include "nimbase.h")/$1\n\
#ifdef bool\n\
#undef bool\n\
#endif\n\
#ifdef true\n\
#undef true\n\
#endif\n\
#ifdef false\n\
#undef false\n\
#endif/' "$f"
    done
fi
