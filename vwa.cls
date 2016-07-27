\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../vwa-class/vwa}[2016/07/27 Vorwissenschaftliche Arbeit in Österreich]

\LoadClass{scrreprt}
\KOMAoptions{paper=a4, fontsize=12pt, DIV=calc}

\RequirePackage{xstring} % string ops
\RequirePackage{polyglossia} % multi-lang
\RequirePackage{csquotes} % lang-specific quotes
\RequirePackage{amsmath} % math
\RequirePackage{unicode-math}
\RequirePackage{sfmath}
%\RequirePackage[sfdefault,scaled=.85]{FiraSans}
%\RequirePackage{newtxsf}
\RequirePackage[backend=biber, style=chicago-authordate]{biblatex} % bib + cite
\RequirePackage{chngcntr}

\DeclareOption{foo} {
  \typeout{Foo.}
}
\ProcessOptions\relax

\setmainlanguage[spelling=new, babelshorthands=true]{german}

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
   \begin{center}\bfseries\abstractname\end{center}}
  {\par\bigskip\end{abspage}}
\directlua{
  if "foo" == "bar" then
    r = "abc"
  else
    r = "def"
  end
}
%\newcommand{\abs}\directlua{if "absxxage" == "x" then tex.sprint("absp") else tex.sprint("other") end}

\newcommand{\name}{\textsc}

% TODO Add multi-lang support
\newcommand{\cf}{\iflanguage{german}{vgl.}{cf.}}
%\newcommand{\Cf}{\MakeUppercase{\StrLeft{\cf}{1}}\StrGobbleLeft{\cf}{1}}
