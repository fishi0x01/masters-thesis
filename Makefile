TSRC := $(shell ls *.tex 2>/dev/null | grep -v prep)

DOCUMENT = main

all: compile

compile: $(TSRC)
	pdflatex $(DOCUMENT)

build: ${TSRC}
	pdflatex $(DOCUMENT)
	bibtex $(DOCUMENT)
	pdflatex $(DOCUMENT)
	bibtex $(DOCUMENT)
	pdflatex $(DOCUMENT)
	pdflatex $(DOCUMENT)

bib: main.bib
	bibtex $(DOCUMENT)

ispell: 
	ispell -d american -t -M -L 3 $(DOCUMENT).tex

clean:
	rm -f $(DOCUMENT).aux $(DOCUMENT).log $(DOCUMENT).dvi $(DOCUMENT).ps $(DOCUMENT).bbl $(DOCUMENT).blg

.phony: all compile bib ispell clean
