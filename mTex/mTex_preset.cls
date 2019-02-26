%
%
% mTex Preset ---------------------------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mTex/mTex_preset}[2018/06/20, custom LaTeX preset v1.2, Michael Ebnicher thanks to LaTex4EI (1) 1-matrix, layout options ZF and FS]


% Variables -------------------------------------------------------------------------------------------------------------
	\newcommand{\style}{Informationen}
	
	\newcounter{columnnumber}
	\setcounter{columnnumber}{3}
	\DeclareOption{FS}{\setcounter{columnnumber}{4} \renwecommand \style {Formelsammlung}}% \newcommand{\FS}{ Formelsammlung}}
	\DeclareOption{ZF}{\setcounter{columnnumber}{3} \renewcommand \style {Zusammenfassung}}% \newcommand{\ZS}{Zusammefassung}}


% Setup ------------------------------------------------------------------------------------------------------------------

	\def\baseclass{scrartcl}

	% set default options for base class
	\PassOptionsToClass{6pt, a4paper, landscape, twoside}{\baseclass}
	\DeclareOption*{%
		\PassOptionsToClass{\CurrentOption}{\baseclass}%
	}
	\ProcessOptions\relax
	\LoadClass{\baseclass}


% Paper Setup ----------------------------------------------------------------------------------------------------------

	\RequirePackage{geometry}
	\geometry{a4paper,landscape, left=5mm,right=5mm, top=20mm, bottom=5mm, asymmetric}%,includefoot, footskip=1.7em}


% Packages -------------------------------------------------------------------------------------------------------------

	\RequirePackage{xcolor}
	\RequirePackage{sectsty}
	\RequirePackage[utf8, latin1]{inputenc}
	%\RequirePackage[latin1]{inputenc}
	\RequirePackage[T1]{fontenc}
	\RequirePackage{mTex/mTex_unicode}
	\RequirePackage{mTex/scientific}
	\RequirePackage{mTex/mTex_boxes}
	\RequirePackage{mTex/colors}
	\RequirePackage{mTex/mTex_basics}
	\inputencoding{utf8}
	%\RequirePackage{helvet}


% Rows -------------------------------------------------------------------------------------------------------------------

	\RequirePackage{multicol}			% for columns

		% start multicolumn
		\AtBeginDocument{
		    \begin{multicols*}{\value{columnnumber}}
		}
		\AtEndDocument{
			\label{LastPage}
			\end{multicols*}
		}
	
	
% Commands -----------------------------------------------------------------------------------------------------------
	
	%\newcommand{\changefont}[3]{
	%\fontfamily{#1} \fontseries{#2} \fontshape{#3} \selectfont}	
	%\usepackage[scaled]{helvet}
	\renewcommand\familydefault{\sfdefault}
	
	\sectionfont{\color{black}}
	\subsectionfont{\color{black}}
	
	%\changefont{phv}{m}{n}
	
	%\newcommand{\sectiontitle}[2]{%
	%	\section[#1]{\color{blue} #1}
	%}
	
	%\newcommand{\subsectiontitle}[2]{%
	%	\subsection[#1]{\color{blue} #1}
	%}
	\providecommand{\1}{\mathbbm{1}}
	
	\providecommand{\fstitle}[1]{
		\vspace{-40mm}{
		\parbox{4cm}{
			\huge\textbf{#1}
		}}
	}
	
	\renewcommand{\maketitle}{\fstitle{\thetitle}}
	
	\RequirePackage{fancyhdr}

	\pagestyle{fancy}
	\fancyhf{}
	
	\AtBeginDocument{
	\fancyhead[L]{\huge\textbf{\thetitle \textcolor{grey35}{\ \style}}}%\thestyle}}%\textcolor{grey35}
	
	}
	\renewcommand{\headrulewidth}{0.0pt} %obere Linie ausblenden
	%\renewcommand{\footrulewidth}{0.2 mm} %obere Linie ausblenden
	%\renewcommand{\footrulecolor}{grey25} 
	
	\fancyhead[R]{\textcolor{grey50}{\theauthor\quad$\vert$\quad\themydate \qquad} \Large{\thepage}}%/\pageref{LastPage}}
	
	
	