
PYTHON = python

FUNCTIONS = hermite legendre gamma

#FILES_PY  = $(shell ls *.py)
#FILES_PDF = $(shell ls *.pdf)
FILES_PDF = *.pdf

help:
	@echo " make help"
	@echo " make all \t : $(PYTHON) $(FUNCTIONS)"
	@echo " make clean \t : rm -rf $(FILES_PDF)"


all: $(FUNCTIONS)

$(FUNCTIONS):
	$(PYTHON) $@.py

clean:
	rm -rf $(FILES_PDF)

