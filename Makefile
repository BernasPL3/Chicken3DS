APP_TITLE := Chicken3DS
APP_AUTHOR := Bernagol
APP_VERSION := 1.0

TARGET := Chicken3DS
BUILD := build
SOURCES := source
INCLUDES := source

LIBS := -lcitro2d -lcitro3d

include $(DEVKITPRO)/3ds_rules
