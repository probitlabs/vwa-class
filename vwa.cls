\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../vwa-class/vwa}[2016/07/27 Vorwissenschaftliche Arbeit in Österreich]

\directlua{dofile("../vwa-class/vwa.lua")} %TODO relative path

\LoadClass{scrreprt}
\KOMAoptions{paper=a4, fontsize=12pt, DIV=calc}

\RequirePackage{xstring} % string ops
\RequirePackage{polyglossia} % multi-lang
\RequirePackage{csquotes} % lang-specific quotes
\RequirePackage{amsmath} % math
\RequirePackage{unicode-math}
\RequirePackage{sfmath}
\RequirePackage[sfdefault,scaled=.86]{FiraSans} %TODO set as math font
\RequirePackage{newtxsf}
\RequirePackage[backend=biber, style=chicago-authordate]{biblatex} % bib + cite
\RequirePackage{chngcntr}

\DeclareOption{foo} {
  \typeout{Foo.}
}
\ProcessOptions\relax

\setmainlanguage[spelling=new, variant=austrian, babelshorthands=true]{german}
\renewcaptionname{german}{\abstractname}{Abriss}

\setromanfont{Cormorant}
\setsansfont{FiraSans}
\setmonofont{Source Code Pro}

\counterwithout{figure}{chapter}
\counterwithout{equation}{chapter}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

\newenvironment{abspage}
  {\clearpage\vspace*{\fill}\thispagestyle{plain}
  }
  {\vfill\clearpage}
\renewenvironment{abstract}[1][german]
  {\begin{abspage}\bigskip\selectlanguage{#1}%
   \begin{center}\bfseries\abstractname\end{center}} %TODO
  {\par\bigskip\end{abspage}}
\newcommand{\abs}[1][german]{\directlua{vwa_abs("\@currenvir")}\begin{abstract}[#1]}
\newcommand{\toc}{\directlua{vwa_abs("\@currenvir")}\tableofcontents}

\newcommand{\name}{\textsc}

% TODO Add multi-lang support using \renewcaptionname
\newcommand{\cf}{\iflanguage{german}{vgl.}{cf.}}
%\newcommand{\Cf}{\MakeUppercase{\StrLeft{\cf}{1}}\StrGobbleLeft{\cf}{1}}
