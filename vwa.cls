\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../vwa-class/vwa}[2016/04/16 Vorwissenschaftliche Arbeit in Österreich]

\LoadClass{scrreprt}
\KOMAoptions{paper=a4, fontsize=12pt, DIV=calc}

\RequirePackage{xstring} % string ops
\RequirePackage{polyglossia} % multi-lang
\RequirePackage{csquotes} % lang-specific quotes
\RequirePackage{amsmath} % math
\RequirePackage{unicode-math}
\RequirePackage[backend=biber, style=chicago-authordate]{biblatex} % bib + cite
\RequirePackage{chngcntr}

\DeclareOption{foo} {
  \typeout{Foo.}
}
\ProcessOptions\relax

\setromanfont{Cormorant}
\setsansfont{Noto Sans}
\setmonofont{Source Code Pro}
\setmathfont{TeX Gyre Heros}

\counterwithout{figure}{chapter}
\counterwithout{equation}{chapter}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

% TODO Merge to one env
\newenvironment{abstractpage}
  {\clearpage\vspace*{\fill}\thispagestyle{plain}
  }
  {\vfill\clearpage}
\newenvironment{mlabstract}[1]
  {\bigskip\selectlanguage{#1}%
   \begin{center}\bfseries\abstractname\end{center}}
  {\par\bigskip}

\newcommand{\name}{\textsc}

% TODO Add multi-lang support
\newcommand{\cf}{\iflanguage{german}{vgl.}{cf.}}
%\newcommand{\Cf}{\MakeUppercase{\StrLeft{\cf}{1}}\StrGobbleLeft{\cf}{1}}
