# See the POSIX make standard here:
# 	https://pubs.opengroup.org/onlinepubs/9699919799/utilities/make.html

.POSIX:
.SUFFIXES:

# Define the date (in seconds) which \today will evaluate to.
SOURCE_DATE_EPOCH=$(date -d "2022-05-22" +%s)

all: report

# NOTE -pretex="\pdfvariable suppressoptionalinfo 512\relax"
# removes the ever changing doc-ID from the xref table for immutability
report: report.tex
	latexmk -pdf \
		-lualatex \
		-interaction=nonstopmode \
		-pretex="\pdfvariable suppressoptionalinfo 512\relax" \
		-usepretex \
		-use-make $?

clean: .execute-always
	latexmk -c

clean-all:
	latexmk -C

.execute-always:

