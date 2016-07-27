\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vwa}[2016/07/27 Vorwissenschaftliche Arbeit in Österreich]

\directlua{dofile("../../vwa.lua")} %TODO relative path

\LoadClass{scrreprt}
\KOMAoptions{paper=a4, fontsize=12pt, DIV=8, BCOR=1cm}

\RequirePackage{xstring} % string ops
\RequirePackage{polyglossia} % multi-lang
\RequirePackage{csquotes} % lang-specific quotes

% math
\RequirePackage{newtxmath}
\RequirePackage{ebgaramond-maths}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}

\RequirePackage[backend=biber, style=chicago-authordate]{biblatex} % bib + cite
\RequirePackage{chngcntr}

\DeclareOption{foo} {
  \typeout{Foo.}
}
\ProcessOptions\relax

\setmainlanguage[spelling=new, variant=austrian, babelshorthands=true]{german}
\renewcaptionname{german}{\abstractname}{Abriss}
\newcaptionname{german}{\cf}{vgl.}
\newcaptionname{english}{\cf}{vgl.}

\setromanfont{Cormorant}
\setsansfont{Fira Sans}
\setmonofont{Iosevka}
\newfontfamily\martel{Martel Sans}
\addtokomafont{disposition}{\martel}

\counterwithout{figure}{chapter}
\counterwithout{equation}{chapter}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

\pagenumbering{roman}
\newenvironment{abspage}
  {\clearpage\vspace*{\fill}\thispagestyle{plain}
  }
  {\vfill\clearpage}
\renewenvironment{abstract}[1][german]
  {\begin{abspage}\bigskip\selectlanguage{#1}%
   \noindent\textbf{\textsc{\abstractname.}}\enskip} %TODO
  {\par\bigskip\end{abspage}}
\newcommand{\abs}[1][german]{\directlua{vwa_abs("\@currenvir")}\begin{abstract}[#1]}
\newcommand{\toc}{\directlua{vwa_abs("\@currenvir")}\tableofcontents\newpage\pagenumbering{arabic}}

\newcommand{\name}{\textsc}

%\newcommand{\Cf}{\MakeUppercase{\StrLeft{\cf}{1}}\StrGobbleLeft{\cf}{1}}
