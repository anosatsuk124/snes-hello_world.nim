ifeq ($(strip $(PVSNESLIB_HOME)),)
$(error "Please create an environment variable PVSNESLIB_HOME by following this guide: https://github.com/alekmaul/pvsneslib/wiki/Installation")
endif

include ${PVSNESLIB_HOME}/devkitsnes/snes_rules

CFLAGS += -I$(CURDIR)/helper/include
NIM := nim

#---------------------------------------------------------------------------------
# Nim configuration
NIMCACHE := $(CURDIR)/src/nimcache
NIMSRC := src/hello_world.nim
NIMHEADER := hello_world_nim.h
NIMOUT := $(NIMCACHE)/$(NIMHEADER)

.PHONY: bitmaps all

#---------------------------------------------------------------------------------
# ROMNAME is used in snes_rules file
export ROMNAME := hello_world_nim

all: bitmaps $(NIMOUT) $(ROMNAME).sfc

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

#---------------------------------------------------------------------------------
%.ps: %.c $(NIMOUT)
	@echo Compiling to .ps ... $(notdir $<)
	@FILES=$$(rg -l "NIM_INTBITS 64" "$(CURDIR)/src/nimcache" 2>/dev/null); \
	if [ -n "$$FILES" ]; then \
		perl -pi -e 's/#define NIM_INTBITS 64/#define NIM_INTBITS 16/' $$FILES; \
	fi
	@FILES=$$(rg -l "#include \\\"nimbase.h\\\"" "$(CURDIR)/src/nimcache" 2>/dev/null); \
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

#---------------------------------------------------------------------------------
%.sfc: $(OFILES)
	@echo Creating linkfile ...
	@echo [objects] > linkfile
	@for i in $(OFILES); do \
		echo $$i >> linkfile; \
	done

	@for i in $(shell ls $(LIBDIRSOBJSW)); do \
		echo $(LIBDIRSOBJSW)/$$i >> linkfile; \
	done

	@echo Linking ... $(notdir $@)
	@rm -f $(ROMNAME).sym
	$(LD) -d -s -v -A -c -L ${LIBDIRSOBJS} linkfile $@

	@perl -pi -e 's/://' $(ROMNAME).sym
	@rg -v ' SECTIONSTART_| SECTIONEND_| RAM_USAGE_SLOT_' $(ROMNAME).sym > $(ROMNAME).sym.tmp && mv $(ROMNAME).sym.tmp $(ROMNAME).sym

	@echo
	@echo Build finished successfully !
	@echo
