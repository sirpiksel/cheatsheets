\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cheatsheet}

% define geometry
\newif\iflandscape
\newif\ifportrait
\DeclareOption{landscape}{\landscapetrue}
\DeclareOption{portrait}{\portraittrue}

\ExecuteOptions{portrait}
\ProcessOptions\relax

\iflandscape
  \RequirePackage[a4paper, landscape, left=1.5cm, right=1.5cm, top=0cm, bottom=1.5cm]{geometry}
\else
  \RequirePackage[a4paper, portrait, left=1.5cm, right=1.5cm, top=0cm, bottom=1.5cm]{geometry}
\fi

% font setup
\renewcommand{\normalsize}{\fontsize{12}{14}\selectfont}
\newcommand{\tiny}{\fontsize{6}{7}\selectfont}
\newcommand{\small}{\fontsize{9}{11}\selectfont}
\newcommand{\large}{\fontsize{14}{16}\selectfont}
\newcommand{\Large}{\fontsize{18}{20}\selectfont}
\newcommand{\LARGE}{\fontsize{22}{24}\selectfont}
\newcommand{\huge}{\fontsize{28}{30}\selectfont}
\newcommand{\Huge}{\fontsize{36}{38}\selectfont}

\RequirePackage{fontspec}
\setmainfont{Noto Serif}
\setsansfont{Noto Sans}
\setmonofont{Noto Sans Mono}

% create maketitle
\RequirePackage{adjustbox}

\newcommand{\maketitle}[1]{
  \begin{adjustbox}{margin=0 0 0 1.2cm, center, valign=B}
    \textbf{\textsf{\LARGE\selectfont#1}}
  \end{adjustbox}
}

% define box
\RequirePackage[most]{tcolorbox}
\RequirePackage{pgf}
\RequirePackage{xcolor}

\let\pdfrandomseed\randomseed

\newcommand{\randomcolor}{
    \pgfmathsetmacro{\H}{rnd}
    \definecolor{randomcol}{hsb}{\H, 0.75, 0.8}
}

\newtcolorbox{topic}[1]{
  title={\textsf{#1}},
  fonttitle=\randomcolor\color{randomcol},
  detach title,
  before upper ={\tcbtitle\\},
  colframe=black,
  colback=white,
  halign=center,
  boxrule=0.5mm,
  arc=0mm,
  left=2mm,
  right=2mm,
  top=2mm,
  bottom=2mm,
  boxsep=1mm,
  enhanced
}

% define multicolumn layout
\RequirePackage{multicol}
\setlength{\columnsep}{1cm}

% allow for code snippets
\RequirePackage{minted}
\definecolor{gray75}{gray}{0.75}
\newmintinline[key]{text}{bgcolor=gray75}
