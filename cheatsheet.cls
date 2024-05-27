\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cheatsheet}
\RequirePackage[most]{tcolorbox}
\RequirePackage{pgf}
\RequirePackage{xcolor}
\RequirePackage{multicol}

\newif\iflandscape
\newif\ifportrait
\DeclareOption{landscape}{\landscapetrue}
\DeclareOption{portrait}{\portraittrue}

\ExecuteOptions{portrait}
\ProcessOptions\relax

\iflandscape
  \RequirePackage[a4paper,landscape]{geometry}
\else
  \RequirePackage[a4paper,portrait]{geometry}
\fi

\let\pdfrandomseed\randomseed

\newcommand{\randomcolor}{%
    \pgfmathsetmacro{\H}{rnd}%
    \definecolor{randomcol}{hsb}{\H, 0.75, 0.8}%
}
\renewcommand\normalsize{\fontsize{10pt}{12pt}\selectfont}

\newtcolorbox{topic}[1]{
  title={#1},
  fonttitle=\randomcolor\color{randomcol},
  detach title,
  before upper ={\tcbtitle\\},
  colframe=black,
  colback=white,
  halign=center,
  boxrule=0.5mm,
  arc=0.5mm,
  left=2mm,
  right=2mm,
  top=2mm,
  bottom=2mm,
  boxsep=2mm,
  enhanced
}
