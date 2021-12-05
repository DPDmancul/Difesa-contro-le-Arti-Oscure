LATEX=latexmk -xelatex
FORMATS=slides print
SOURCES=$(wildcard Parte*.tex)

all: $(FORMATS)

.PHONY: $(FORMATS)
$(FORMATS): %: $(addprefix %/,$(SOURCES:.tex=.pdf))

%.pdf:
	mkdir -p $(dir $@)/data
	$(LATEX) -outdir=$(dir $@) $(if $(findstring print,$@),-usepretex='\def\handout{}') $(notdir $(@:.pdf=.tex))

.PHONY: clean
clean:
	rm -rf $(FORMATS)
	latexmk -C
