#
# Makefile.am -- build the software for the heater
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
# LUFA configuration stuff

noinst_PROGRAMS = heater

AVRDUDE = avrdude -v -p t25 -b 115200 -c avrispmkII -P usb

flash:	heater.hex
	$(AVRDUDE) -U flash:w:heater.hex
eeprom:	heater.eeprom
	$(AVRDUDE) -U eeprom:w:heater.eeprom

heater.hex: heater
	avr-objcopy --remove-section=.eeprom --target=ihex heater \
		heater.hex
heater.eeprom: heater
	avr-objcopy --only-section=.eeprom --target=ihex heater \
		heater.eeprom

lib_LTLIBRARIES = libheater.la

noinst_HEADERS = timer.h adc.h pwm.h

libheater_la_SOURCES = timer.c adc.c pwm.c

heater_SOURCES = heater.c
heater_DEPENDENCIES = libheater.la
heater_LDFLAGS = -lheater

# setting the fuse values
# low fuse byte
# -------------
# CKDIV8        = 0             Clock divided by 8 (yes)
# CKOUT         =  1            Clock out enabled (no)
# SUT1..0       =   10          Startup time setting (fast rising power)
# CKSEL3..0     =     0010      Clock source setting (calibrated RC Oscillator)
#                 ________
#                 01100010      = 0x62
#
#
# high fuse byte
# --------------
# RSTDSBL       = 1             external reset disabled (no)
# DWEN          =  1            DebugWIRE enabled (no)
# SPIEN         =   0           Serial program and data download enabled (yes)
# WDTON         =    1          Watchdog timer always on (no)
# EESAVE        =     1         EEPROM preserved on chip erase (yes)
# BODLEVEL2..0  =      111      BOD disabled
#                 ________
#                 11011111      = 0xdf
#
#
# extended fuse byte
# ------------------
# LB2..LB1      =       11      No memory lock features enabled
#                 ________
#                 00000011      = 0x03
#
# original fuse settings reported by avrdude
# lfuse reads as 62
# hfuse reads as DF
# efuse reads as FF

readfuses:
	$(AVRDUDE) -U lfuse:r:-:i -U hfuse:r:-:i

# The fuse command below does not set the extended fuses, as there is no
# need to change the factory settings
fuses:
	$(AVRDUDE) -U lfuse:w:0x62:m -U hfuse:w:0xdf:m

read:   readback.hex

readback.hex:
	$(AVRDUDE) -U flash:r:readback.hex:r

read:
	$(AVRDUDE) -U eeprom:r:eeprom.raw:r -u

size:   heater
	avr-size *.o heater

