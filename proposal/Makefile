all:
	pdflatex proposal.tex
	bibtex proposal
	pdflatex proposal.tex
	pdflatex proposal.tex

clean:
	rm -f *.log *.aux *.out *.blg *.bbl *.fdb_latexmk *.fls comment.cut *.toc proposal.pdf

