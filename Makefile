#---------------------------------------------------------------------------------
# Chicken3DS
#---------------------------------------------------------------------------------

ifeq ($(strip $(DEVKITPRO)),)
$(error "Por favor defina DEVKITPRO no ambiente. export DEVKITPRO=/opt/devkitpro")
endif

TOPDIR := $(CURDIR)

include $(DEVKITPRO)/3ds_rules

#---------------------------------------------------------------------------------
# Configuração
#---------------------------------------------------------------------------------

TARGET  := Chicken3DS
BUILD   := build
SOURCES := source
INCLUDES:= source

APP_TITLE   := Chicken3DS
APP_AUTHOR  := Bernagol
APP_VERSION := 1.0

#---------------------------------------------------------------------------------
# Bibliotecas
#---------------------------------------------------------------------------------

LIBS := -lcitro2d -lcitro3d -lm

#---------------------------------------------------------------------------------
# Flags
#---------------------------------------------------------------------------------

CFLAGS   := -O2 -mword-relocations -ffunction-sections
CXXFLAGS := $(CFLAGS) -fno-rtti -fno-exceptions

#---------------------------------------------------------------------------------
# Regras
#---------------------------------------------------------------------------------

export OUTPUT := $(CURDIR)/$(TARGET)

export VPATH := $(foreach dir,$(SOURCES),$(CURDIR)/$(dir))

export INCLUDE := $(foreach dir,$(INCLUDES),-I$(CURDIR)/$(dir))

export OFILES := $(addsuffix .o,$(basename $(notdir $(wildcard source/*.cpp))))

#---------------------------------------------------------------------------------

all: $(BUILD)

$(BUILD):
	@[ -d $@ ] || mkdir -p $@
	@make --no-print-directory -C $(BUILD) -f $(TOPDIR)/Makefile

clean:
	rm -rf $(BUILD) *.3dsx *.smdh *.elf *.cia

#---------------------------------------------------------------------------------

ifeq ($(notdir $(CURDIR)),$(BUILD))

export OUTPUT := $(TOPDIR)/$(TARGET)

include $(DEVKITPRO)/libctru/include/3dsx_rules

else

$(BUILD):
endif
