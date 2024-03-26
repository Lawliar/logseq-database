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
## Algorithm

### General template

```
\usepackage{algorithm}
\usepackage[noend]{algpseudocode}
\begin{algorithm}
\caption{Psedocode for ISR analysis\cm{This psedo code outline the general workflow}}
\label{alg:main loop}

\begin{algorithmic}[1]
\State $\textbf{AS}$=\{$S_{init}$\}
\While{ $\textbf{AS}$ $!= \emptyset$}
    \State Dequeue $\textbf{S}$ from $\textbf{AS}$ according to heuristic
    \State $\textbf{S}^{'}\gets$  $eval(\textbf{S})$
    \If{sss} 
        \State xxx 
        \State uuu 
    \ElsIf{check global variable}
        \State ...
    \ElsIf{MMIO access}
        \State Use P2IM module
        \State ...
        \State $\textbf{AS}\gets \textbf{AS}\cup \textsl{\textsf{S}}$
    \EndIf
\EndWhile
\end{algorithmic}
\end{algorithm}
```
### Unnumber certain line:
```
\Statex
```
will not number the line
while
```
\State
```
will number the line

## missing $$ inserted in includegraphics
https://tex.stackexchange.com/questions/354109/includegraphics-missing-inserted-and-missing-number-treated-as-zero
Basically because the path to the image file has space(s), avoid the space for the included files
e.g.
```
\includegraphics[width=0.48\textwidth]{code snippets/ISR_example.pdf}
```
won't work

```
\includegraphics[width=0.48\textwidth]{"code snippets"/ISR_example.pdf}
```
will work

## "fullpage" package will overwrite the margin parameter

Why the hell do you do that? Why do you exist in the first place?

## an empty line

```\linebreak```doesn't work

use ```\bigskip```instead

## macro ignores the tailing space:
invoke macro like "\macro{}" instead of just "\macro"

## hierachy

https://tex.stackexchange.com/questions/186981/is-there-a-subsubsubsection-command

- \part{part}
- \chapter{chapter}
- \section{section}
- \subsection{subsection}
- \subsubsection{subsubsection}
- \paragraph{paragraph}
- \subparagraph{subparagraph}

## table of hline, cline for multi-row multi-columns:
https://tex.stackexchange.com/questions/133804/losing-the-vertical-line-on-my-table-when-using-multicolumn

## quotation mark

https://tex.stackexchange.com/questions/52351/quote-marks-are-backwards-using-texmaker-pdflatex


## squeze table
### insert 
\renewcommand{\tabcolsep}{1pt}
... # your table
\renewcommand{\tabcolsep}{6pt}

to reduce the padded white space

### use p{1mm} or c{1mm} to specify the column length

### use \multicolumn{1}{c}{...} to still make each cell centered
