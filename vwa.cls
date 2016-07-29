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
\RequirePackage{xcolor}
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
  FontFace = {l}{n}{Fira Sans Light},
  FontFace = {l}{it}{Fira Sans Light Italic},
  FontFace = {el}{n}{Fira Sans ExtraLight},
  FontFace = {el}{it}{Fira Sans ExtraLight Italic},
  FontFace = {lc}{n}{Fira Sans Condensed Light},
  FontFace = {lc}{it}{Fira Sans Condensed Light Italic},
  FontFace = {elc}{n}{Fira Sans Condensed ExtraLight},
  FontFace = {elc}{it}{Fira Sans Condensed ExtraLight Italic},
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
\definecolor{dark}{HTML}{2c2c2c}
\newcommand{\circlenum}[2]{
  \raisebox{-.5\height}{
    \begin{tikzpicture}[anchor = base, baseline]
    \node[
      circle,
      #1,
      color = dark,
      ultra thin,
      minimum size = 2.25em,
    ]{\addtokomafont{pagenumber}{\color{#2}}\pagemark};
    \end{tikzpicture}
  }
}
\setlength{\footheight}{3.25em}
\pagestyle{scrheadings}
\automark[section]{chapter} %TODO fuck this too :-/
%\renewcommand{\chaptermark}[1]{\markleft{\chaptername \thechapter{}. #1}{}}
%\renewcommand{\sectionmark}[1]{\markright{\thesection{} #1}{}} %TODO fuck this shit :-(
\ofoot*{}
\cfoot*{\circlenum{draw}{black}}
\ifoot*{}

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
\renewenvironment{abstract}[1][german]{
  \begin{abspage}
  \bigskip
  \selectlanguage{#1}%
  \noindent\textbf{\textsc{\abstractname.}}\enskip
}{
  \par
  \bigskip
  \end{abspage}
}
\newcommand{\abs}[1][german]{
  \directlua{vwa_abs("\@currenvir")}
  \begin{abstract}[#1]
}
\newenvironment{front}{
  \pagenumbering{roman}
}{
  \directlua{vwa_abs("\@currenvir")}
  \tableofcontents
}

% main
\newenvironment{main}{
  \newpage
  \ofoot{\sffamily\fontseries{lc}\upshape\footnotesize\leftmark}
  \cfoot[\circlenum{fill}{white}]{\circlenum{draw}{black}}
  \ifoot{\sffamily\fontseries{lc}\upshape\footnotesize\rightmark}
  \pagenumbering{arabic}
}{}

% back
\newenvironment{back}{
  \newpage
  \pagenumbering{Roman}
}{
  \printbibliography
}

\newcommand{\name}{\textsc}

%\newcommand{\Cf}{\MakeUppercase{\StrLeft{\cf}{1}}\StrGobbleLeft{\cf}{1}}
