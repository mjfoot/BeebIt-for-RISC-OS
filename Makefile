# Project:   BeebIt


# Toolflags:

#Standard tools
#Linkflags =Link -aif -o $@
ObjAsmflags = -depend !Depend -ThrowBack -Stamp -quit -CloseExec -apcs 3/32bit
CMHGflags = 
LibFileflags = -c -o $@
Squeezeflags = -o $@

#Uncoment for Norcroft with DDT debugging
#CCflags = CC -c -depend !Depend -IC: -throwback -apcs3/26bits -g
#Linkflags =Link -aif -D -o $@ $(stubs)
#stubs = C:o.stubs

#Uncoment for Norcroft
CCflags = CC -c -depend !Depend -IC: -throwback -apcs 3/32bit
Linkflags =Link -aif -o $@ $(stubs)
stubs = C:o.stubs

#Uncoment for GCC
#CCflags = GCC -c -mapcs-32 -mfpe=3 -mthrowback -mamu 
#Linkflags =GCC -aif -o $@

#Uncoment for LCC
#CCflags = LCC -c 
#Linkflags =GCC -aif -o $@


# Final targets:
all: @.!RunImage @.RipROMs

RunImage = @.o.main @.o.beebit \
  @.o.6502cpu @.o.6502cpus @.o.6502cpu!! @.o.6502cpu01 @.o.6502cpu23 \
  @.o.6502cpu45 @.o.6502cpu67 @.o.6502cpu89 @.o.6502cpuAB \
  @.o.6502cpuCD @.o.6502cpuEF \
  @.o.6512cpu!! @.o.6512cpu00 @.o.6512cpu10 @.o.6512cpu20 \
  @.o.6512cpu30 @.o.6512cpu45 @.o.6512cpu60 @.o.6512cpu70 \
  @.o.6512cpu80 @.o.6512cpu90 @.o.6512cpuA0 @.o.6512cpuB0 \
  @.o.6512cpuC0 @.o.6512cpuD0 @.o.6512cpuE0 @.o.6512cpuF0 \
  @.o.65c12cpu @.o.65c12cpu!! @.o.65c12cpu00 @.o.65c12cpu10 \
  @.o.65c12cpu20 @.o.65c12cpu30 @.o.65c12cpu45 @.o.65c12cpu60 \
  @.o.65c12cpu70 @.o.65c12cpu89 @.o.65c12cpuA0 @.o.65c12cpuB0 \
  @.o.65c12cpuC0 @.o.65c12cpuD0 @.o.65c12cpuE0 @.o.65c12cpuF0  \
  @.o.6522sysvia @.o.6522usrvia @.o.6845crtc @.o.6850acia \
  @.o.76489sound @.o.tube \
  @.o.8271fdc @.o.1770fdc @.o.adc @.o.keyboard @.o.sheila  \
  @.o.scrmode @.o.video @.o.videoscale @.o.videoula @.o.riscos \
  @.o.riscosvid1 @.o.riscosvid2 @.o.riscosvid3 @.o.riscosvid4 \
  @.o.scrsave @.o.snapshots
RipRoms = @.o.RipROMs

# $@ name of target ie o.main
# $* target without extension ie o.main = main
# $< list of inferred prequisites
# $? list of prequisites with respect to which target is out of date??

.suffixes: .o .c .cmhg .s

.c.o:
	$(CCFlags) -o $@ $<
.s.o:
	objasm $(ObjAsmflags) -from $< -to $@
.cmhg.o:
	cmhg $(CMHGflags) $< -o $@ -d h.$*

@.!RunImage: $(RunImage)
	  $(linkflags) $(RunImage)

@.RipROMs: $(RipROMs)
	  $(linkflags) $(RipROMs)

# User-editable dependencies:

# Static dependencies:

# Dynamic dependencies:
o.main:	c.main
o.main:	h.6502cpu
o.main:	h.6522sysvia
o.main:	h.6522usrvia
o.main:	h.6845crtc
o.main:	h.6850acia
o.main:	h.8271fdc
o.main:	h.beebit
o.main:	h.sheila
o.main:	h.swis
o.main:	C:h.kernel
o.main:	h.riscos
o.main:	h.scrmode
o.main:	h.scrsave
o.main:	h.snapshots
o.main:	h.video
o.main:	h.videoscale
o.main:	h.videoula
o.beebit:	c.beebit
o.beebit:	h.1770fdc
o.beebit:	h.6502cpu
o.beebit:	h.6522sysvia
o.beebit:	h.6522usrvia
o.beebit:	h.6845crtc
o.beebit:	h.6850acia
o.beebit:	h.76489sound
o.beebit:	h.8271fdc
o.beebit:	h.adc
o.beebit:	h.beebit
o.beebit:	C:h.kernel
o.beebit:	h.keyboard
o.beebit:	h.main
o.beebit:	h.riscos
o.beebit:	h.scrmode
o.beebit:	h.scrsave
o.beebit:	h.sheila
o.beebit:	h.swis
o.beebit:	h.video
o.beebit:	h.videoula
o.6502cpu:	c.6502cpu
o.6502cpu:	h.6502cpu
o.6502cpu:	h.6522sysvia
o.6502cpu:	h.6522usrvia
o.6502cpu:	h.8271fdc
o.6502cpu:	h.beebit
o.6502cpu:	h.keyboard
o.6502cpu:	h.riscos
o.6502cpu:	h.sheila
o.6502cpu:	h.swis
o.6502cpu:	C:h.kernel
o.6502cpu:	h.video
o.6502cpus: s.6502cpus
o.6502cpus: h.6502cpus
o.6502cpus: h.RegNames
o.6502cpus: h.SWInames
o.6502cpu!!: s.6502cpu!!
o.6502cpu!!: h.6502cpus
o.6502cpu!!: h.6502cpui
o.6502cpu!!: h.RegNames
o.6502cpu!!: h.SWInames
o.6502cpu01: s.6502cpu01
o.6502cpu01: h.6502cpus
o.6502cpu01: h.6502cpui
o.6502cpu01: h.RegNames
o.6502cpu01: h.SWInames
o.6502cpu23: s.6502cpu23
o.6502cpu23: h.6502cpus
o.6502cpu23: h.6502cpui
o.6502cpu23: h.RegNames
o.6502cpu23: h.SWInames
o.6502cpu45: s.6502cpu45
o.6502cpu45: h.6502cpus
o.6502cpu45: h.6502cpui
o.6502cpu45: h.RegNames
o.6502cpu45: h.SWInames
o.6502cpu67: s.6502cpu67
o.6502cpu67: h.6502cpus
o.6502cpu67: h.6502cpui
o.6502cpu67: h.RegNames
o.6502cpu67: h.SWInames
o.6502cpu89: s.6502cpu89
o.6502cpu89: h.6502cpus
o.6502cpu89: h.6502cpui
o.6502cpu89: h.SWINames
o.6502cpu89: h.RegNames
o.6502cpuAB: s.6502cpuAB
o.6502cpuAB: h.6502cpus
o.6502cpuAB: h.6502cpui
o.6502cpuAB: h.RegNames
o.6502cpuAB: h.SWInames
o.6502cpuCD: s.6502cpuCD
o.6502cpuCD: h.6502cpus
o.6502cpuCD: h.6502cpui
o.6502cpuCD: h.RegNames
o.6502cpuCD: h.SWInames
o.6502cpuEF: s.6502cpuEF
o.6502cpuEF: h.6502cpus
o.6502cpuEF: h.6502cpui
o.6502cpuEF: h.RegNames
o.6502cpuEF: h.SWInames
o.6512cpu!!: s.6512cpu!!
o.6512cpu!!: h.6502cpus
o.6512cpu!!: h.6502cpui
o.6512cpu!!: h.RegNames
o.6512cpu!!: h.SWInames
o.6512cpu00: s.6512cpu00
o.6512cpu00: h.6502cpus
o.6512cpu00: h.6502cpui
o.6512cpu00: h.RegNames
o.6512cpu00: h.SWInames
o.6512cpu10: s.6512cpu10
o.6512cpu10: h.6502cpus
o.6512cpu10: h.6502cpui
o.6512cpu10: h.RegNames
o.6512cpu10: h.SWInames
o.6512cpu20: s.6512cpu20
o.6512cpu20: h.6502cpus
o.6512cpu20: h.6502cpui
o.6512cpu20: h.RegNames
o.6512cpu20: h.SWInames
o.6512cpu30: s.6512cpu30
o.6512cpu30: h.6502cpus
o.6512cpu30: h.6502cpui
o.6512cpu30: h.RegNames
o.6512cpu30: h.SWInames
o.6512cpu45: s.6512cpu45
o.6512cpu45: h.6502cpus
o.6512cpu45: h.6502cpui
o.6512cpu45: h.RegNames
o.6512cpu45: h.SWInames
o.6512cpu60: s.6512cpu60
o.6512cpu60: h.6502cpus
o.6512cpu60: h.6502cpui
o.6512cpu60: h.RegNames
o.6512cpu60: h.SWInames
o.6512cpu70: s.6512cpu70
o.6512cpu70: h.6502cpus
o.6512cpu70: h.6502cpui
o.6512cpu70: h.RegNames
o.6512cpu70: h.SWInames
o.6512cpu80: s.6512cpu80
o.6512cpu80: h.6502cpus
o.6512cpu80: h.6502cpui
o.6512cpu80: h.SWINames
o.6512cpu80: h.RegNames
o.6512cpu90: s.6512cpu90
o.6512cpu90: h.6502cpus
o.6512cpu90: h.6502cpui
o.6512cpu90: h.SWINames
o.6512cpu90: h.RegNames
o.6512cpuA0: s.6512cpuA0
o.6512cpuA0: h.6502cpus
o.6512cpuA0: h.6502cpui
o.6512cpuA0: h.RegNames
o.6512cpuA0: h.SWInames
o.6512cpuB0: s.6512cpuB0
o.6512cpuB0: h.6502cpus
o.6512cpuB0: h.6502cpui
o.6512cpuB0: h.RegNames
o.6512cpuB0: h.SWInames
o.6512cpuC0: s.6512cpuC0
o.6512cpuC0: h.6502cpus
o.6512cpuC0: h.6502cpui
o.6512cpuC0: h.RegNames
o.6512cpuC0: h.SWInames
o.6512cpuD0: s.6512cpuD0
o.6512cpuD0: h.6502cpus
o.6512cpuD0: h.6502cpui
o.6512cpuD0: h.RegNames
o.6512cpuD0: h.SWInames
o.6512cpuE0: s.6512cpuE0
o.6512cpuE0: h.6502cpus
o.6512cpuE0: h.6502cpui
o.6512cpuE0: h.RegNames
o.6512cpuE0: h.SWInames
o.6512cpuF0: s.6512cpuF0
o.6512cpuF0: h.6502cpus
o.6512cpuF0: h.6502cpui
o.6512cpuF0: h.RegNames
o.6512cpuF0: h.SWInames
o.65c12cpu:	c.65c12cpu
o.65c12cpu:	h.6502cpu
o.65c12cpu:	h.beebit
o.65c12cpu!!: s.65c12cpu!!
o.65c12cpu!!: h.6502cpus
o.65c12cpu!!: h.6502cpui
o.65c12cpu!!: h.RegNames
o.65c12cpu!!: h.SWInames
o.65c12cpu00: s.65c12cpu00
o.65c12cpu00: h.6502cpus
o.65c12cpu00: h.6502cpui
o.65c12cpu00: h.RegNames
o.65c12cpu00: h.SWInames
o.65c12cpu10: s.65c12cpu10
o.65c12cpu10: h.6502cpus
o.65c12cpu10: h.6502cpui
o.65c12cpu10: h.RegNames
o.65c12cpu10: h.SWInames
o.65c12cpu20: s.65c12cpu20
o.65c12cpu20: h.6502cpus
o.65c12cpu20: h.6502cpui
o.65c12cpu20: h.RegNames
o.65c12cpu20: h.SWInames
o.65c12cpu30: s.65c12cpu30
o.65c12cpu30: h.6502cpus
o.65c12cpu30: h.6502cpui
o.65c12cpu30: h.RegNames
o.65c12cpu30: h.SWInames
o.65c12cpu45: s.65c12cpu45
o.65c12cpu45: h.6502cpus
o.65c12cpu45: h.6502cpui
o.65c12cpu45: h.RegNames
o.65c12cpu45: h.SWInames
o.65c12cpu60: s.65c12cpu60
o.65c12cpu60: h.6502cpus
o.65c12cpu60: h.6502cpui
o.65c12cpu60: h.RegNames
o.65c12cpu60: h.SWInames
o.65c12cpu70: s.65c12cpu70
o.65c12cpu70: h.6502cpus
o.65c12cpu70: h.6502cpui
o.65c12cpu70: h.RegNames
o.65c12cpu70: h.SWInames
o.65c12cpu89: s.65c12cpu89
o.65c12cpu89: h.6502cpus
o.65c12cpu89: h.6502cpui
o.65c12cpu89: h.SWINames
o.65c12cpu89: h.RegNames
o.65c12cpuA0: s.65c12cpuA0
o.65c12cpuA0: h.6502cpus
o.65c12cpuA0: h.6502cpui
o.65c12cpuA0: h.RegNames
o.65c12cpuA0: h.SWInames
o.65c12cpuB0: s.65c12cpuB0
o.65c12cpuB0: h.6502cpus
o.65c12cpuB0: h.6502cpui
o.65c12cpuB0: h.RegNames
o.65c12cpuB0: h.SWInames
o.65c12cpuC0: s.65c12cpuC0
o.65c12cpuC0: h.6502cpus
o.65c12cpuC0: h.6502cpui
o.65c12cpuC0: h.RegNames
o.65c12cpuC0: h.SWInames
o.65c12cpuD0: s.65c12cpuD0
o.65c12cpuD0: h.6502cpus
o.65c12cpuD0: h.6502cpui
o.65c12cpuD0: h.RegNames
o.65c12cpuD0: h.SWInames
o.65c12cpuE0: s.65c12cpuE0
o.65c12cpuE0: h.6502cpus
o.65c12cpuE0: h.6502cpui
o.65c12cpuE0: h.RegNames
o.65c12cpuE0: h.SWInames
o.65c12cpuF0: s.65c12cpuF0
o.65c12cpuF0: h.6502cpus
o.65c12cpuF0: h.6502cpui
o.65c12cpuF0: h.RegNames
o.65c12cpuF0: h.SWInames
o.6522sysvia:	c.6522sysvia
o.6522sysvia:	h.6502cpu
o.6522sysvia:	h.6522sysvia
o.6522sysvia:	h.76489sound
o.6522sysvia:	h.beebit
o.6522sysvia:	C:h.kernel
o.6522sysvia:	h.keyboard
o.6522sysvia:	h.main
o.6522sysvia:	h.riscos
o.6522sysvia:	h.swis
o.6522usrvia:	c.6522usrvia
o.6522usrvia:	h.6502cpu
o.6522usrvia:	h.6522usrvia
o.6522usrvia:	h.beebit
o.6522usrvia:	h.main
o.6522usrvia:	C:h.kernel
o.6522usrvia:	h.keyboard
o.6522usrvia:	h.swis
o.6522usrvia:	h.riscos
o.6845crtc:	c.6845crtc
o.6845crtc:	h.6502cpu
o.6845crtc:	h.6845crtc
o.6845crtc:	h.beebit
o.6845crtc:	h.main
o.6845crtc:	h.video
o.6845crtc:	h.videoula
o.6845crtc:	h.riscos
o.6850acia:	c.6850acia
o.6850acia:	h.6502cpu
o.6850acia:	h.6850acia
o.6850acia:	h.beebit
o.6850acia:	C:h.kernel
o.6850acia:	h.main
o.6850acia:	h.swis
o.76489sound:	c.76489sound
o.76489sound:	h.beebit
o.76489sound:	C:h.kernel
o.76489sound:	h.riscos
o.76489sound:	h.76489sound
o.76489sound:	h.swis
o.tube:	c.tube
o.tube:	h.beebit
o.tube:	C:h.kernel
o.8271fdc:	c.8271fdc
o.8271fdc:	h.6502cpu
o.8271fdc:	h.8271fdc
o.8271fdc:	h.beebit
o.8271fdc:	h.keyboard
o.1770fdc:	c.1770fdc
o.1770fdc:	h.1770fdc
o.1770fdc:	h.6502cpu
o.1770fdc:	h.beebit
o.1770fdc:	C:h.kernel
o.1770fdc:	h.keyboard
o.1770fdc:	h.swis
o.adc:	c.adc
o.adc:	h.6502cpu
o.adc:	h.6522sysvia
o.adc:	h.beebit
o.adc:	C:h.kernel
o.adc:	h.swis
o.keyboard:	c.keyboard
o.keyboard:	h.6522sysvia
o.keyboard:	h.beebit
o.keyboard:	C:h.kernel
o.keyboard:	h.riscos
o.keyboard:	h.swis
o.sheila:	c.sheila
o.sheila:	h.6502cpu
o.sheila:	h.6522sysvia
o.sheila:	h.6522usrvia
o.sheila:	h.6845crtc
o.sheila:	h.6850acia
o.sheila:	h.8271fdc
o.sheila:	h.adc
o.sheila:	h.beebit
o.sheila:	h.main
o.sheila:	h.riscos
o.sheila:	h.tube
o.sheila:	h.videoula
o.sheila:	h.1770fdc
o.scrmode:	c.scrmode
o.scrmode:	h.6502cpu
o.scrmode:	h.main
o.scrmode:	C:h.kernel
o.scrmode:	h.swis
o.scrmode:	h.scrmode
o.scrmode:	h.videoscale
o.video:	c.video
o.video:	h.6502cpu
o.video:	h.6522sysvia
o.video:	h.6845crtc
o.video:	h.beebit
o.video:	C:h.kernel
o.video:	h.main
o.video:	h.riscos
o.video:	h.scrmode
o.video:	h.swis
o.video:	h.video
o.video:	h.videoscale
o.video:	h.videoula
o.video:	h.adc
o.videoscale:	c.videoscale
o.videoscale:	h.beebit
o.videoscale:	C:h.kernel
o.videoscale:	h.riscos
o.videoscale:	h.swis
o.videoscale:	h.video
o.videoscale:	h.videoscale
o.videoscale:	h.videoula
o.videoula:	c.videoula
o.videoula:	h.6502cpu
o.videoula:	h.6522sysvia
o.videoula:	h.6845crtc
o.videoula:	h.beebit
o.videoula:	C:h.kernel
o.videoula:	h.main
o.videoula:	h.riscos
o.videoula:	h.scrmode
o.videoula:	h.swis
o.videoula:	h.adc
o.videoula:	h.video
o.riscos: s.riscos
o.riscos: h.RegNames
o.riscos: h.SWInames
o.riscosvid1: s.riscosvid1
o.riscosvid1: h.RegNames
o.riscosvid1: h.SWInames
o.riscosvid2: s.riscosvid2
o.riscosvid2: h.RegNames
o.riscosvid2: h.SWInames
o.riscosvid3: s.riscosvid3
o.riscosvid3: h.RegNames
o.riscosvid3: h.SWInames
o.riscosvid4: s.riscosvid4
o.riscosvid4: h.RegNames
o.riscosvid4: h.SWInames
o.scrsave:	c.scrsave
o.scrsave:	h.main
o.scrsave:	h.beebit
o.scrsave:	h.swis
o.scrsave:	C:h.kernel
o.scrsave:	h.video
o.snapshots:	c.snapshots
o.snapshots:	h.beebit
o.snapshots:	h.snapshots
o.snapshots:	h.6502cpu
o.snapshots:	h.6522sysvia
o.snapshots:	h.6522usrvia
o.snapshots:	h.video
o.snapshots:	h.6845crtc
o.snapshots:	h.videoula
o.snapshots:	h.sheila
o.RipROMs:	c.RipROMs
o.RipROMs:	C:h.kernel
o.RipROMs:	h.swis
