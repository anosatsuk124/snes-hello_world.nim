# Environment check
ifeq ($(strip $(PVSNESLIB_HOME)),)
$(error "Please create an environment variable PVSNESLIB_HOME by following this guide: https://github.com/alekmaul/pvsneslib/wiki/Installation")
endif

#-------------------------------------------------------------------------------
# Configuration
#-------------------------------------------------------------------------------
export ROMNAME := hello_world_nim

NIM := nim
NIMLIB_NAME := hello_world
NIMCACHE := $(CURDIR)/src/nimcache
NIMSRC := $(NIMLIB_NAME).nim
NIMSRC_PATH := $(CURDIR)/src/$(NIMSRC)
NIMHEADER := $(NIMLIB_NAME).h
NIMOUT := $(NIMCACHE)/$(NIMHEADER)

CFLAGS += -I$(CURDIR)/helper/cinclude

#-------------------------------------------------------------------------------
# Include PVSNESLIB rules
#-------------------------------------------------------------------------------
include ${PVSNESLIB_HOME}/devkitsnes/snes_rules

#===============================================================================
# Build Rules
#===============================================================================

# Nim compilation
$(NIMCACHE)/%.c: $(NIMOUT)

$(NIMOUT): $(NIMSRC_PATH)
	@echo Compiling Nim ... $<
	$(NIM) c -d:release --nimcache:$(NIMCACHE) --header:$(NIMHEADER) $<
	@$(CURDIR)/scripts/patch_nimcache.sh $(NIMCACHE)

# Nimcache-specific rules (handles @ in filenames)
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

# Graphics
pvsneslibfont.pic: pvsneslibfont.png
	@echo convert font with no tile reduction ... $(notdir $@)
	$(GFXCONV) -s 8 -o 16 -u 16 -p -e 0 -i $<

bitmaps: pvsneslibfont.pic

#===============================================================================
# Targets
#===============================================================================

.PHONY: all bitmaps clean cleanNim

# Two-stage build: 1) compile Nim, 2) recursive make to detect nimcache files
all: bitmaps $(NIMOUT)
	$(MAKE) $(ROMNAME).sfc

cleanNim:
	@echo Cleaning Nim cache ...
	@rm -rf $(NIMCACHE)

clean: cleanBuildRes cleanRom cleanGfx cleanNim
