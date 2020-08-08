## Install Latex
```
sudo apt-get update
sudo apt-get install texlive-full
sudo apt-get install texmaker
sudo apt-get install texlive-latex-extra 
sudo apt-get install python-pygments
```
If you want to run your file with pdflatex, then you need to so with shell-escape
```
pdflatex -shell-escape myfile.tex
```
## LaTeX Error: File `lastpage.sty' not found.
```
sudo apt-get install texlive-full
```