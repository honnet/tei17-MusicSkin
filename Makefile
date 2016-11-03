# Simple Makefile for ACM SIGCHI LaTeX template

TARGET=tei17

all: $(TARGET).pdf
	evince $< &

# initial aux file generation
%.aux: %.tex
	pdflatex $<

# bbl file generation (change bib name if required)
%.bbl: %.aux %.bib
	bibtex $<

# pdf output
%.pdf: %.tex %.bbl
	@# fix bib generation - TODO: improve this workaround?
	@pdflatex $<
	@pdflatex $<

clean:
	rm *.aux *.log *.bbl *.blg *.out $(TARGET).pdf 2> /dev/null | true

