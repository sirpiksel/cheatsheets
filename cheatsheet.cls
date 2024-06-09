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
\newcommand{\tiny}{\fontsize{4}{5}\selectfont}
\newcommand{\small}{\fontsize{6}{7}\selectfont}
\renewcommand{\normalsize}{\fontsize{9}{11}\selectfont}
\newcommand{\large}{\fontsize{12}{14}\selectfont}
\newcommand{\Large}{\fontsize{14}{16}\selectfont}
\newcommand{\LARGE}{\fontsize{18}{20}\selectfont}
\newcommand{\huge}{\fontsize{22}{24}\selectfont}
\newcommand{\Huge}{\fontsize{28}{30}\selectfont}

\RequirePackage{fontspec}
\setmainfont{Noto Serif}
\setsansfont{Noto Sans}
\setmonofont{sourcecodepro}

% create maketitle
\RequirePackage{adjustbox}

\newcommand{\maketitle}[1]{
  \begin{adjustbox}{margin=0 0 0 1.2cm, center, valign=B}
    \textbf{\textsf{\huge\selectfont#1}}
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
  before upper ={\begin{center}\tcbtitle\end{center}},
  colframe=black,
  colback=white,
  halign=left,
  segmentation style=solid,
  boxrule=0.5mm,
  arc=0.1mm,
  outer arc=0.2mm,
  left=0mm,
  right=0mm,
  boxsep=1mm,
  enhanced
}

% define multicolumn layout
\RequirePackage{multicol}
\setlength{\columnsep}{3mm}

% allow for code snippets
\RequirePackage{minted}
\definecolor{gray75}{gray}{0.75}
\newmintinline[key]{text}{bgcolor=gray75}

% disable hyphenation
\RequirePackage[none]{hyphenat}

% set layout spacing
\linespread{1.5}
