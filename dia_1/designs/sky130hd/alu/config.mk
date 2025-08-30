export DESIGN_NICKNAME = alu
export DESIGN_NAME = alu
export PLATFORM    = sky130hd

export VERILOG_FILES =  $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/alu.v
export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export CORE_UTILIZATION = 20
export PLACE_DENSITY = 0.88
export TNS_END_PERCENT = 100

export SYNTH_MEMORY_MAX_BITS = 16384

# Allow routing on the TopMetal layers, for the padring connections
export MAX_ROUTING_LAYER = met4

export CDL_FILE = \
    $(PDK_ROOT)/$(PDK)/libs.ref/sky130_fd_sc_hd/cdl/sky130_fd_sc_hd.cdl
