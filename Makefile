# Much faster, but requires OpenScad snapshot
OPENSCAD="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD" --enable=manifold

# This will work with the stable openscad
#OPENSCAD="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"

# OpenScad options
OPENSCAD_OPTIONS=--export-format binstl
OPENSCAD_CMD=$(OPENSCAD) $(OPENSCAD_OPTIONS)

# Directories
SRC_DIR := .
STL_DIR := stl

STEMS := choc mx

# Default target
all: sets singles

CS_SRC := $(SRC_DIR)/Choc_Chicago_Steno.scad $(SRC_DIR)/Choc_Chicago_Steno_Thumb.scad $(SRC_DIR)/Choc_Chicago_Steno_Convex.scad

# Create targets for files starting with `export_`
EXPORT_SCAD_FILES := $(wildcard $(SRC_DIR)/export_*.scad)

STL_TARGETS := $(foreach stem,$(STEMS),$(patsubst $(SRC_DIR)/export_%.scad,$(STL_DIR)/$(stem)/%.stl,$(EXPORT_SCAD_FILES)))

$(STL_DIR)/choc/%.stl: $(SRC_DIR)/export_%.scad $(SRC_DIR)/gen_sprued_keycaps.scad $(CS_SRC)
	@echo "Building set $@..."
	@mkdir -p stl/choc
	$(OPENSCAD_CMD) --render -D keycap_stem=0 -o $@ $<
	@echo
	@echo

$(STL_DIR)/mx/%.stl: $(SRC_DIR)/export_%.scad $(SRC_DIR)/gen_sprued_keycaps.scad $(CS_SRC)
	@echo "Building set $@..."
	@mkdir -p stl/mx
	$(OPENSCAD_CMD) --render -D keycap_stem=1 -o $@ $<
	@echo
	@echo

# Generate targets for single keys
AVAILABLE_KEY_IDS := $(shell perl -n -e'/\["(cs_.*)",/ && print "$$1\n"' < gen_sprued_keycaps.scad)

define generate_key_target
$(STL_DIR)/$(1)/single_keys/$(2).stl: $(SRC_DIR)/gen_single_keycap.scad $(SRC_DIR)/gen_sprued_keycaps.scad $(CS_SRC)
	@echo "Building single $(1) key $(2)..."
	@mkdir -p stl/$(1)/single_keys
	@echo $(ifeq ($(1),mx),1,2)
	$(OPENSCAD_CMD) --render -D keycap_stem=$(if $(filter $(1),mx),1,0) -D keycap_id=\"$(2)\" -o $$@ $$<
	@echo
	@echo
endef

SINGLE_KEY_TARGETS := $(foreach stem,$(STEMS),$(foreach id,$(AVAILABLE_KEY_IDS),$(STL_DIR)/$(stem)/single_keys/$(id).stl))

$(foreach stem,$(STEMS),$(foreach id,$(AVAILABLE_KEY_IDS),$(eval $(call generate_key_target,$(stem),$(id)))))

# Target to create sets
sets: $(STL_TARGETS)

# Target to generate single key stls
singles: $(SINGLE_KEY_TARGETS)

# Remove generated STL files
clean:
	rm -f $(STL_TARGETS) $(SINGLE_KEY_TARGETS)

# Help target
help:
	@echo "Available targets:"
	@echo "  sets:    Build all set targets"
	@echo "  singles: Build all single targets"
	@echo "  clean:   Remove generated STL files"
	@echo "  help:    Show this help message"
	@echo
	@echo "Set Targets:"
	@$(foreach target,$(STL_TARGETS),echo "  $(target)";)
	@echo
	@echo "Single Targets:"
	@$(foreach target,$(SINGLE_KEY_TARGETS),echo "  $(target)";)
