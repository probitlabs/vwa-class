\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vwa}[2016/07/27 Vorwissenschaftliche Arbeit in Österreich]

\directlua{dofile("../../vwa.lua")} %TODO relative path

\LoadClass{scrreprt}
\KOMAoptions{
  paper=a4,
  fontsize=12pt,
  DIV=8,
  BCOR=1cm,
  numbers=noenddot,
}
\RequirePackage{scrlayer-scrpage}

\RequirePackage{tikz} % graphics
\RequirePackage{xstring} % string ops
\RequirePackage{polyglossia} % multi-lang
\RequirePackage{csquotes} % lang-specific quotes

% math
\RequirePackage{newtxmath}
\RequirePackage{ebgaramond-maths}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}

% bib + cite
\RequirePackage[
  backend=biber,
  style=chicago-authordate
]{biblatex}
\RequirePackage{chngcntr}

\ProcessOptions\relax

% ---

% lang
\setmainlanguage[
  spelling=new,
  variant=austrian,
  babelshorthands=true,
]{german}
\renewcaptionname{german}{\abstractname}{Abriss}
\newcaptionname{german}{\cf}{vgl.}
\newcaptionname{english}{\cf}{vgl.}

% fonts
\setromanfont{Cormorant}
\setsansfont{Fira Sans}[
  FontFace = {el}{n}{Fira Sans Light},
  FontFace = {el}{it}{Fira Sans Light Italic},
]
\setmonofont{Iosevka}
\newfontfamily\martel{Martel Sans}

% headings
\addtokomafont{disposition}{\martel}
\RedeclareSectionCommand[beforeskip=.35\textheight]{chapter}%.35\textheight]{chapter}
\RedeclareSectionCommand[beforeskip=.05\textheight]{section}%TODO better definition
\counterwithout{figure}{chapter}
\counterwithout{equation}{chapter}
\setcounter{secnumdepth}{\subsectionnumdepth}
\setcounter{tocdepth}{\subsectionnumdepth}

% header/footer
\usetikzlibrary{shapes}
\newcommand{\circlenum}[1]{
  \raisebox{-.5\height}{
    \begin{tikzpicture}[anchor = base, baseline]
    \node[
      circle,
      #1,
      ultra thin,
      minimum size = 2.25em,
    ]{\pagemark};
    \end{tikzpicture}
  }
}
\setlength{\footheight}{3.25em}
\pagestyle{scrheadings}
\automark[section]{chapter}
\ofoot{\leftmark}
\cfoot*{\circlenum{draw}}
\ifoot{\rightmark}

% dictum
\addtokomafont{dictum}{\footnotesize\fontseries{el}\selectfont}
\renewcommand{\dictumrule}{\vspace{.2\baselineskip}}
\renewcommand{\dictumauthorformat}[1]{\scriptsize--- #1\hfill\vspace{.2\textheight}}


% front
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
\newcommand{\toc}{
  \directlua{vwa_abs("\@currenvir")}
  \tableofcontents
  \newpage
  \pagenumbering{arabic}
  \cfoot[\circlenum{fill}]{\circlenum{draw}}
}

\newcommand{\name}{\textsc}

%\newcommand{\Cf}{\MakeUppercase{\StrLeft{\cf}{1}}\StrGobbleLeft{\cf}{1}}
