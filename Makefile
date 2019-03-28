################################################
#
#
#               Le Makefile
#
#
################################################

BUILD_DIR              	:= build
SESSIONS_DIR           	:= sessions

IMAGES_DIR             	:= images
EXTENSIONS_DIR         	:= extensions
STYLESHEETS_DIR        	:= stylesheets

SESSIONS_FILENAMES	:= $()

SESSIONS_INPUT         	:= $(wildcard $(SESSIONS_DIR)/*.adoc)

SESSIONS_OUTPUT        	:= $(patsubst 	$(SESSIONS_DIR)/%.adoc, \
					$(BUILD_DIR)/$(SESSIONS_DIR)/%.html, \
					$(SESSIONS_INPUT)))

REFERENCES_INPUT	:= $(SESSIONS_DIR)/references.bib

REFERENCES_OUTPUT      	:= $(BUILD_DIR)/$(SESSIONS_DIR)/references.bib

STYLESHEET		:= 	golo.css

ASCIIDOCTOR_FLAGS	:=	-r asciidoctor-bibtex \
				-b html5 \
				-D $(BUILD_DIR)

$(REFERENCES_OUTPUT) : $(REFERENCES_INPUT)
	cp $< $@

# asciidoctor command
# JANCKY AS HELL - The last line is crazy: removes the subdirs of the adoc file (given by $SESSIONS_INPUT, using the subdirs saved in $SESSIONS_SUBDIRS)
define asciidoctor-call
	cd $(SESSIONS_DIR) && \
	asciidoctor 	-a stylesheet=../stylesheets/$(STYLESHEET) \
			-r asciidoctor-bibtex \
			-b html5 \
			-D ../$(BUILD_DIR)/$(SESSIONS_DIR) \
			$(<:$(SESSIONS_DIR)/%=%)
endef

# building adoc files into html files
$(SESSIONS_OUTPUT) : $(SESSIONS_INPUT)
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

dirs: $(BUILD_DIR) $(BUILD_DIR)/$(SESSIONS_DIR)

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
	@echo "session adoc files:\n\t$(SESSIONS_INPUT)" && \
	echo "session hmtl files:\n\t$(SESSIONS_OUTPUT)" && \
	echo "reference input files:\n\t$(REFERENCES_INPUT)" && \
	echo "reference output files:\n\t$(REFERENCES_OUTPUT)" && \
	echo "command:\n\t$(asciidoctor-call) FILENAME"

.PHONY: all install install-gems styles dirs images references \
	index html soft-clean clean debug
