#
# 03.10.08
# 16.09.10 m
#

TODO = LATEX

SRC = phd

# define COM #

TEX = pdflatex
BIB = bibtex
PDF = xpdf
#PDF = kpdf
TAR = tar
ZIP = gzip

VI  = vi
#ISPELL = aspell
ISPELL = ispell

CC = gcc

# end define COM #


.PHONY: clean cleanall


ifeq ($(TODO),LATEX)


# define FILEs #

BIBFile = string diff tersoff order phase nano parallel comm waves intro
TEXFile = $(SRC) intro conclusion appendix cover \
          tersoff phase \
          diff nano size order parallel \
          comm waves 
FIGFile = fig
TARFile = cover.pdf 
#TARFile = art-diff art-nano1

# other tex files
STYFile = $(SRC) command short pdfheader chap
BSTFile = apsrev



VIMRCFile = .vimrc.$(SRC)

ISPELLFile = .spell.$(SRC)

# end define FILEs #


# don't change below #


# vi section #
ifdef VIMRCFile
VIMFLAGS := $(addprefix -c "source ",$(VIMRCFile))
endif
# end vi section #


# ispell section #
ISPELLFLAGS = -t
ifdef ISPELLFile
ISPELLFLAGS := -t -p $(ISPELLFile)
endif
# end ispell section #



toCLEAN = $(SRC).aux $(SRC).log $(SRC).out $(SRC).snm \
          $(SRC).blg $(SRC).nav $(SRC).toc $(SRC).bbl \
          $(SRC).lof $(SRC).lot $(SRC).brf            \
          *.blg *.bbl *.aux *.log *.out *.snm         \
          *.nav *.toc *.lof *.lot *.brf

# end define useful variables #




dummy:
	@echo -e "\nspecify target\n"
	@echo -e "\ttex\t$(TEX) $(SRC).tex"
	@echo -e "\tbib\t$(BIB) $(SRC)"
	@echo -e "\tpdf\t$(PDF) $(SRC).pdf"
	@echo
	@echo -e "\tall\tmake tex bib tex tex pdf"
	@echo
	@echo -e "\tvi\t$(VI) $(VIMFLAGS) $(SRC).tex"
	@echo -e "\tspell\t$(ISPELL) $(ISPELLFLAGS) $(SRC).tex"
	@echo -e "\tsty\t$(VI) $(VIMFLAGS) $(SRC).sty"
	@echo
	@echo -e "\ttar\t$(TAR) cf $(SRC).tar $(toTAR)"
	@echo -e "\tztar\t$(TAR) czf"
	@echo
	@echo -e "\tclean"
	@echo -e "\tcleanall"
	@echo

$(TEXFile):
	$(VI) $(VIMFLAGS) $@.tex
	
TEXFile := $(addsuffix .tex, $(TEXFile))
BIBFile := $(addsuffix .bib, $(BIBFile))
STYFile := $(addsuffix .sty, $(STYFile))
BSTFile := $(addsuffix .bst, $(BSTFile))

tex: $(SRC).tex
	$(TEX) $(SRC).tex

bib: $(BIBFile)
	cat $(BIBFile) > $(SRC).bib
	$(BIB) $(SRC)

pdf: $(SRC).pdf
	$(PDF) $(SRC).pdf

all: 
	@make -s tex
	@make -s bib
	@make -s tex
	@make -s tex
#	@make -s pdf

vi: $(SRC).tex
	$(VI) $(VIMFLAGS) $(SRC).tex

spell: $(TEXFile)
	$(ISPELL) $(ISPELLFLAGS) $(TEXFile)

sty: $(SRC).sty
	$(VI) $(VIMFLAGS) $(SRC).sty

# define useful variables #

toTAR = Makefile $(SRC).pdf \
        $(TEXFile) $(BIBFile) \
        $(STYFile) $(BSTFile) \
        $(VIMRCFile) $(ISPELLFile) \
        $(TARFile) $(FIGFile)

tar: $(toTAR)
	$(TAR) cf $(SRC).tar $(toTAR)

ztar: tar
	$(ZIP) $(SRC).tar
	#$(TAR) czf $(SRC).tar.gz $(toTAR) Makefile

clean:
	rm -f $(toCLEAN)

cleanall: clean
	rm -f $(SRC).pdf

endif



ifeq ($(TODO),SHELL)

SCRdir = scr

TXTdir = txt
TEXdir = tex
BOOKdir = book

dummy:
	@echo -e ""
	@echo -en "\ttxt\t" && cd $(SCRdir) && sh txt.sh -h
	@echo -en "\ttex\t" && cd $(SCRdir) && sh tex.sh -h
	@echo -e  "\t   \tcp $(TEXdir)/*.tex $(BOOKdir)" 
	@echo -e  "\t   \tcd $(BOOKdir) && make tex"
	@echo -e "\tbib\tcd $(BOOKdir) && make bib"
	@echo -e ""

txt:
	cd $(SCRdir) && sh $@.sh

tex:
	cd $(SCRdir) && sh $@.sh
	cp $(TEXdir)/*.tex $(BOOKdir) && rm -r $(TEXdir)
	cd $(BOOKdir) && make $@

bib:
	cd $(BOOKdir) && make $@

clean:
	cd $(BOOKdir) && make $@
	rm -r $(TEXdir)

#cleanall: clean
#	rm -rvi $(TEXdir)

endif



ifeq ($(TODO),C)

CFLAGS = 

OBJ = gauss.o

HEAD = $(SRC).h

LIBMATH = -lm

# define useful variables #

toTAR = Makefile $(SRC).c $(TARFile) $(HEAD) \
        input old bak \
        gauss.c gauss.h \
        history

toCLEAN = $(OBJ)

# end define useful variables #

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

dummy:
	@echo -e "\nspecify target\n"
	@echo -e "\t$(SRC)\t$(CC) $(CFLAGS) $(OBJ) $(SRC).c -o $(SRC).x"
	@echo
	@echo -e "\ttar\t\t$(TAR) cf $(SRC).tar $(toTAR)"
	@echo -e "\tztar\t\t$(TAR) czf"
	@echo
	@echo -e "\tclean\t\trm -rf $(SRC).o $(toCLEAN)"
	@echo -e "\tcleanall\trm -rf $(SRC).x"
	@echo

$(SRC): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $@.c -o $@.x $(LIBMATH)

tar: $(toTAR)
	$(TAR) cf $(SRC).tar $(toTAR)

ztar: tar
	$(ZIP) $(SRC).tar
	#$(TAR) czf $(SRC).tar.gz $(toTAR) Makefile

clean:
	rm -rf $(SRC).o $(toCLEAN)

cleanall: clean
	rm -rf $(SRC).x

endif
