ifeq ($(strip $(PVSNESLIB_HOME)),)
$(error "Please create an environment variable PVSNESLIB_HOME by following this guide: https://github.com/alekmaul/pvsneslib/wiki/Installation")
endif

include ${PVSNESLIB_HOME}/devkitsnes/snes_rules

CFLAGS += -I$(CURDIR)/helper/cinclude
NIM := nim

#---------------------------------------------------------------------------------
# Nim configuration
NIMCACHE := $(CURDIR)/src/nimcache
NIMSRC := src/hello_world.nim
NIMHEADER := hello_world_nim.h
NIMOUT := $(NIMCACHE)/$(NIMHEADER)

# Nim-generated C files - add to OFILES manually since they don't exist at make startup
NIMCFILES := $(NIMCACHE)/@mhello_world.nim.c $(NIMCACHE)/@psystem.nim.c
NIMOFILES := $(NIMCFILES:.c=.obj)
export OFILES := $(OFILES) $(NIMOFILES)

.PHONY: bitmaps all

#---------------------------------------------------------------------------------
# ROMNAME is used in snes_rules file
export ROMNAME := hello_world_nim

all: bitmaps $(NIMOUT) $(NIMOFILES) $(ROMNAME).sfc

# Ensure nimcache C files depend on NIMOUT (Nim compilation)
$(NIMCFILES): $(NIMOUT)

# Explicit rules for nimcache files (@ in filename needs special handling)
$(NIMCACHE)/%.ps: $(NIMCACHE)/%.c
	@echo Compiling to .ps ... $(notdir $<)
	$(CC) $(CFLAGS) -Wall -c $< -o $@

$(NIMCACHE)/%.asm: $(NIMCACHE)/%.ps
	@echo Assembling ... $(notdir $<)
	$(OPT) $< >$(NIMCACHE)/$*.asp
	@echo Moving constants ... $(notdir $<)
	$(CTF) $(NIMCACHE)/$*.c $(NIMCACHE)/$*.asp $@
	@rm $(NIMCACHE)/$*.asp

$(NIMCACHE)/%.obj: $(NIMCACHE)/%.asm
	@echo Doing obj files ...
	@echo "Building with -x flag: $(AS) -s -x -o $@ $<"
	$(AS) -d -s -x -o $@ $<

cleanNim:
	@echo Cleaning Nim cache ...
	@rm -rf src/nimcache

clean: cleanBuildRes cleanRom cleanGfx cleanNim

#---------------------------------------------------------------------------------
pvsneslibfont.pic: pvsneslibfont.png
	@echo convert font with no tile reduction ... $(notdir $@)
	$(GFXCONV) -s 8 -o 16 -u 16 -p -e 0 -i $<

bitmaps : pvsneslibfont.pic

$(NIMOUT): $(NIMSRC)
	@echo Compiling Nim ... $<
	$(NIM) c -d:release --nimcache:$(NIMCACHE) --header:$(NIMHEADER) $<
	@FILES=$$(rg -l "NIM_INTBITS 64" "$(CURDIR)/src/nimcache" 2>/dev/null); \
	if [ -n "$$FILES" ]; then \
		for f in $$FILES; do \
			perl -pi -e 's/#define NIM_INTBITS 64/#define NIM_INTBITS 16/' "$$f"; \
		done; \
	fi
	@FILES=$$(rg -l "snes/.*\\.h" "$(CURDIR)/src/nimcache" 2>/dev/null); \
	if [ -n "$$FILES" ]; then \
		for f in $$FILES; do \
			awk ' \
			{ print $$0; } \
			/#include "nimbase.h"/ { \
				print "#ifdef bool"; \
				print "#undef bool"; \
				print "#endif"; \
				print "#ifdef true"; \
				print "#undef true"; \
				print "#endif"; \
				print "#ifdef false"; \
				print "#undef false"; \
				print "#endif"; \
			} \
			' "$$f" > "$$f.tmp" && mv "$$f.tmp" "$$f"; \
		done; \
	fi
	@if [ -f "$(CURDIR)/helper/include/nimbase.h" ]; then \
		perl -pi -e 's#^NIM_STATIC_ASSERT.*#/* disabled for 65c816 tcc: pointer size is 24-bit */#' "$(CURDIR)/helper/include/nimbase.h"; \
	fi
	@echo "Renaming duplicate labels in Nim-generated C files..."
	@for f in $(NIMCACHE)/*.c; do \
		perl -i -pe ' \
			BEGIN { $$func_id = 0; } \
			if (/^(?:N_LIB_PRIVATE|N_NIMCALL|static\s).*\(/) { $$func_id++; } \
			s/\bLA(\d+)(_?)\b/LA$${func_id}_$$1$$2/g; \
		' "$$f"; \
	done

