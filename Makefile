################################################
#
#
#               Le Makefile
#
#
################################################

BUILD_DIR              := build
SESSIONS_DIR           := sessions

IMAGES_DIR             := images
EXTENSIONS_DIR         := extensions
STYLESHEETS_DIR        := stylesheets

SESSIONS_SUBDIRS       := $(wildcard $(SESSIONS_DIR)/session-*)
BUILD_SESSIONS_SUBDIRS := $(patsubst 	%,
										$(BUILD_DIR)/%,
										$(SESSIONS_SUBDIRS))

SESSIONS_INPUT         := $(foreach dir,
									$(SESSIONS_SUBDIRS),
									$(wildcard $(dir)/*.adoc))

SESSIONS_OUTPUT        := $(foreach dir,
									$(SESSIONS_SUBDIRS),\
									$(patsubst \
										$(dir)/%.adoc, \
										$(BUILD_DIR)/$(dir)/%.html, \
										$(SESSIONS_INPUT)))

REFERENCES_INPUT       := $(foreach dir,
									$(SESSIONS_SUBDIRS),
									$(wildcard $(dir)/*.bib))

REFERENCES_OUTPUT      := $(foreach dir,
									$(SESSIONS_SUBDIRS),\
										$(patsubst $(dir)/%.bib, \
											$(BUILD_DIR)/$(dir)/%.bib, \
											$(REFERENCES_INPUT)))
#

# EXTENSIONS             := ./$(EXTENSIONS_DIR)/*.rb
STYLESHEET             := golo.css

STYLESHEETS_FLAG       := -a stylesheet=../../stylesheets/$(STYLESHEET)

 #-r $(EXTENSIONS)
ASCIIDOCTOR_FLAGS      := 	-r asciidoctor-bibtex \
							-b html5 \
							-D $(BUILD_DIR)
#
$(REFERENCES_OUTPUT) : $(REFERENCES_INPUT)
	cp $< $@

# asciidoctor command
# JANCKY AS FUCK - The last line is crazy: removes the subdirs of the adoc file (given by $SESSIONS_INPUT, using the subdirs saved in $SESSIONS_SUBDIRS)
define asciidoctor-call
	cd $(word 2,$^) && \
	asciidoctor -a stylesheet=../../stylesheets/$(STYLESHEET) \
				-r asciidoctor-bibtex \
				-b html5 \
				-D ../../$(word 3,$^) \
				$(<:$(word 2,$^)/%=%)
endef

# building adoc files into html files
# JANCKY WAY BECAUSE ASCIIDOCTOR-BIBTEX DOES NOT LIKE WHEN WE'RE NOT EXECUTING ASCIIDOCTOR
# IN THE SAME DIRECTORY AS THE INPUT FILE - FOR SOME REASON - SO WE HAVE TO DO THIS HACK
$(SESSIONS_OUTPUT) : $(SESSIONS_INPUT) $(SESSIONS_SUBDIRS) $(BUILD_SESSIONS_SUBDIRS)
	$(asciidoctor-call)

# stylesheets
$(STYLESHEETS_DIR) :
	@[ ! -d "./$(STYLESHEETS_DIR)" ] \
		&& echo "Installing stylesheets....." && \
		git clone https://github.com/asciidoctor/asciidoctor-stylesheet-factory && \
		cd asciidoctor-stylesheet-factory && \
		bundle install && \
		compass compile && \
		mv stylesheets ../$(STYLESHEETS_DIR) && \
		cd .. && \
		rm -rf asciidoctor-stylesheet-factory \
	||  echo "./$(STYLESHEETS_DIR) exists. Skipping....." \

$(BUILD_DIR) :
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/$(SESSIONS_DIR) :
	mkdir -p $(BUILD_DIR)/$(SESSIONS_DIR)

$(BUILD_SESSIONS_SUBDIRS) :
	mkdir -p $(BUILD_SESSIONS_SUBDIRS)

$(BUILD_DIR)/$(SESSIONS_DIR)/$(IMAGES_DIR) : $(SESSIONS_DIR)/$(IMAGES_DIR)
	rm -rf $(BUILD_DIR)/$(SESSIONS_DIR)/$(IMAGES_DIR) && \
	cp -rf $(SESSIONS_DIR)/$(IMAGES_DIR) $(BUILD_DIR)/$(SESSIONS_DIR)/$(IMAGES_DIR)

$(BUILD_DIR)/index.html :
	@echo "<meta http-equiv=\"refresh\" content=\"0; URL=https://github.com/PedrosWits/bayes-babies\" />" > $(BUILD_DIR)/index.html

################################################
#
#
#               Phonies
#
#
################################################


all: install html

install: install-gems

install-gems:
	@echo "Installing asciidoctor....." && \
	gem install asciidoctor asciidoctor-bibtex compass

styles: $(STYLESHEETS_DIR)

dirs: $(BUILD_DIR) $(BUILD_DIR)/$(SESSIONS_DIR) $(BUILD_SESSIONS_SUBDIRS)

images: $(BUILD_DIR)/$(SESSIONS_DIR)/$(IMAGES_DIR)

index: $(BUILD_DIR)/index.html

references: dirs $(REFERENCES_OUTPUT)

html: dirs styles images references $(SESSIONS_OUTPUT) index

soft-clean :
	rm -rf $(BUILD_DIR)

clean :
	@echo "Cleaning up....."; \
	rm -rf $(BUILD_DIR) $(STYLESHEETS_DIR) node_modules package-lock.json

debug:
	@echo "sessions subdirs:\n\t$(SESSIONS_SUBDIRS)" && \
	echo "session adoc files:\n\t$(SESSIONS_INPUT)" && \
	echo "session hmtl files:\n\t$(SESSIONS_OUTPUT)" && \
	echo "reference input files:\n\t$(REFERENCES_INPUT)" && \
	echo "reference output files:\n\t$(REFERENCES_OUTPUT)" && \
	echo "command:\n\t$(asciidoctor-call) FILENAME"

.PHONY: all install install-gems styles dirs images references \
		index html soft-clean clean debug
