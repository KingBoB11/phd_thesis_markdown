PY=python
PANDOC=pandoc

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/source
OUTPUTDIR=$(BASEDIR)/output
TEMPLATEDIR=$(INPUTDIR)/templates
STYLEDIR=$(BASEDIR)/style

BIBFILE=$(INPUTDIR)/references.bib

help:
	@echo ' 																	  '
	@echo 'Makefile for the Markdown thesis                                       '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make html                        generate a web version             '
	@echo '   make pdf                         generate a PDF file  			  '
	@echo '   make docx	                       generate a Docx file 			  '
	@echo '   make tex	                       generate a Latex file 			  '
	@echo '                                                                       '
	@echo ' 																	  '
	@echo ' 																	  '
	@echo 'get local templates with: pandoc -D latex/html/etc	  				  '
	@echo 'or generic ones from: https://github.com/jgm/pandoc-templates		  '

# other csl styles: https://github.com/citation-style-language/styles

pdf:
	pandoc Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\01_title_page.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\02_statement.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\03_summary.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\04_acknowledgements.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\05_table_of_contents.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\06_list_of_figures.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\07_list_of_tables.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\08_abbreviations.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\09_chapter_1.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\10_chapter_2.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\11_chapter_3.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\12_chapter_4.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\13_chapter_5.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\14_chapter_6.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\15_conclusion.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\16_appendix_1.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\17_appendix_2.md Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\18_references.md \
	-o Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\output\thesis.pdf \
	-H Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\style\preamble.tex \
	--template=Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\style\template.tex \
	--bibliography=Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\source\references.bib 2>pandoc.log \
	--csl=Z:\Semester_7\Bachelor_Arbeit\phd_thesis_markdown\style\ref_format.csl \
	--highlight-style pygments \
	-V fontsize=12pt \
	-V papersize=a4paper \
	-V documentclass:report \
	-V lang:de-DE \
	-V mainlang:german \
	-N \
	--pdf-engine=xelatex

tex:
	pandoc "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/thesis.tex" \
	-H "$(STYLEDIR)/preamble.tex" \
	--bibliography="$(BIBFILE)" \
	-V fontsize=12pt \
	-V papersize=a4paper \
	-V documentclass:report \
	-V lang:de-DE \
	-V mainlang:german \
	-N \
	--csl="$(STYLEDIR)/ref_format.csl" \
	--pdf-engine=xelatex

docx:
	pandoc "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/thesis.docx" \
	--bibliography="$(BIBFILE)" \
	--csl="$(STYLEDIR)/ref_format.csl" \
	--toc

html:
	pandoc "$(INPUTDIR)"/*.md \
	-o "$(OUTPUTDIR)/thesis.html" \
	--standalone \
	--template="$(STYLEDIR)/template.html" \
	--bibliography="$(BIBFILE)" \
	--csl="$(STYLEDIR)/ref_format.csl" \
	--include-in-header="$(STYLEDIR)/style.css" \
	--toc \
	--number-sections
	rm -rf "$(OUTPUTDIR)/source"
	mkdir "$(OUTPUTDIR)/source"
	cp -r "$(INPUTDIR)/figures" "$(OUTPUTDIR)/source/figures"

.PHONY: help pdf docx html tex
