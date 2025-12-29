ifeq ($(strip $(PVSNESLIB_HOME)),)
$(error "Please create an environment variable PVSNESLIB_HOME by following this guide: https://github.com/alekmaul/pvsneslib/wiki/Installation")
endif

include ${PVSNESLIB_HOME}/devkitsnes/snes_rules

CFLAGS += -I$(CURDIR)/helper/include

.PHONY: bitmaps all

#---------------------------------------------------------------------------------
# ROMNAME is used in snes_rules file
export ROMNAME := hello_world_nim

all: bitmaps $(ROMNAME).sfc

clean: cleanBuildRes cleanRom cleanGfx
	
#---------------------------------------------------------------------------------
pvsneslibfont.pic: pvsneslibfont.png
	@echo convert font with no tile reduction ... $(notdir $@)
	$(GFXCONV) -s 8 -o 16 -u 16 -p -e 0 -i $<

bitmaps : pvsneslibfont.pic

#---------------------------------------------------------------------------------
%.ps: %.c
	@echo Compiling to .ps ... $(notdir $<)
	@FILES=$$(rg -l "NIM_INTBITS 64" "$(CURDIR)/src/nimcache" 2>/dev/null); \
	if [ -n "$$FILES" ]; then \
		perl -pi -e 's/#define NIM_INTBITS 64/#define NIM_INTBITS 16/' $$FILES; \
	fi
ifeq ($(HIROM),1)
ifeq ($(FASTROM),1)
	$(CC) $(CFLAGS) -Wall -c $< -H -F -o $@
else
	$(CC) $(CFLAGS) -Wall -c $< -H -o $@
endif
else
ifeq ($(FASTROM),1)
	$(CC) $(CFLAGS) -Wall -c $< -F -o $@
else
	$(CC) $(CFLAGS) -Wall -c $< -o $@
endif
endif
