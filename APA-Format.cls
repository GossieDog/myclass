% APA Format Class Offline Version
% Author: Gossie Fan
% License: CC BY-SA 4.0 https://creativecommons.org/licenses/by-sa/4.0/deed.en
% Last updated on August 19, 2026

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{APA-Format}

\newif\if@msword
\newif\if@cutepagenumbers
\newif\if@instructions
\newif\if@notes

\DeclareOption{MSWord}{\@mswordtrue}
\DeclareOption{cutepagenumbers}{\@cutepagenumberstrue}
\DeclareOption{instructions}{\@instructionstrue}
\DeclareOption{notes}{\@notestrue}

\ProcessOptions\relax

\LoadClass[12pt]{article}

\if@cutepagenumbers %If else statement for tikzling page numbering
	\AtBeginDocument{
		\usepackage{tikzlings}
		\setlength{\headheight}{45pt}
		\fancyhead[r]{\tikz{\tikzling[scale=0.4, signpost=\thepage]}}
	}
\else

\fi

\if@instructions %If else statement for showing/hiding instructions
	\newcommand{\instructions}[1]{#1}
\else
	\newcommand{\instructions}[1]{}
\fi

\if@notes %If else statement for showing/hiding notes
	\newcommand{\notes}[1]{#1}
\else
	\newcommand{\notes}[1]{}
\fi

% General packages
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[american]{babel}
\RequirePackage{verbatim}
\RequirePackage{graphicx}

%Caption Setup (Parts of code from apa7 class)
\RequirePackage[singlelinecheck=off]{caption}
\DeclareCaptionLabelFormat{APALabel}{\noindent\normalsize\normalfont\raggedright\textbf{#1 #2}}
\DeclareCaptionTextFormat{APAText}{\noindent\normalsize\normalfont\raggedright\textit{#1}}
\DeclareCaptionLabelSeparator{APASpace}{\\[\baselineskip]}

\captionsetup[figure]{
	position=above,
	labelformat=APALabel,
	textformat=APAText,
	labelsep=APASpace
}

\captionsetup[table]{
	position=above,
	labelformat=APALabel,
	textformat=APAText,
	labelsep=APASpace
}

\def\notelabel{Note}

\if@msword %If else statement for MS word formatting
	\AtBeginDocument{
		\singlespacing%
		\setstretch{1.92}
		\usepackage{newtxtext,newtxmath}
		\setlength{\parindent}{0.5in}
		\usepackage{indentfirst}
		\newcommand{\figurenote}[1]{\par\noindent\flushleft\normalsize\singlespacing\setstretch{1.92}\normalfont\textit{\notelabel.} {#1}}
		\newcommand{\tablenote}[1]{\par\noindent\flushleft\normalsize\singlespacing\setstretch{1.92}\normalfont\textit{\notelabel.} {#1}}
		\usepackage{cleveref}
		\usepackage{microtype}
	}
\else
	\AtBeginDocument{
		\setlength{\parindent}{0.5in}
		\usepackage{indentfirst}
		\newcommand{\figurenote}[1]{\par\noindent\flushleft\normalsize\doublespacing\normalfont\doublespacing\textit{\notelabel.} {#1}}
		\newcommand{\tablenote}[1]{\par\noindent\flushleft\normalsize\doublespacing\normalfont\doublespacing\textit{\notelabel.} {#1}}
		\usepackage{cleveref}
		\usepackage{microtype}
	}
\fi

\RequirePackage{xparse}
\RequirePackage{lipsum}
\RequirePackage{xcolor}
\RequirePackage{enumitem}
\RequirePackage{tabu}
\RequirePackage{booktabs}

%Margins
\RequirePackage[margin=1in]{geometry}

%Ragged Right
\raggedright%

%Double Spacing
\RequirePackage{setspace}
\doublespacing%

%Head Height For Fancy Page Style
\setlength{\headheight}{14.49998pt}

%Page Numbers
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[l]{}
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[r]{}
\fancyhead[r]{\thepage}

%Titlesec Commands for APA headers
\RequirePackage{titlesec}

\titleformat{\section}
{
	\centering\normalsize\bfseries
}
{}{0em}{}

\titlespacing{\section}{0em}{0em}{0em}

\titleformat{\subsection}
{
	\normalsize\bfseries
}
{}{0em}{}

\titlespacing{\subsection}{0em}{0em}{0em}

\titleformat{\subsubsection}
{
	\normalsize\itshape\bfseries
}
{}{0em}{}

\titlespacing{\subsubsection}{0em}{0em}{0em}

%Titletoc Commands for APA table of contents
\RequirePackage{titletoc}
\titlecontents{section}[0in]{\normalfont\bfseries}{}{}{\titlerule*[1em]{.}\contentspage}
\titlecontents{subsection}[0.25in]{\normalfont\bfseries}{}{}{\titlerule*[1em]{.}\contentspage}
\titlecontents{subsubsection}[0.5in]{\normalfont\bfseries\itshape}{}{}{\titlerule*[1em]{.}\contentspage}
\titlecontents{figure}[0in]{\normalfont}{}{}{\titlerule*[1em]{.}\contentspage}
\titlecontents{table}[0in]{\normalfont}{}{}{\titlerule*[1em]{.}\contentspage}

%Reference List
\RequirePackage[backend=biber,style=apa]{biblatex}

\newcommand{\referencelist}{
	\newpage
	\section*{References}
	\printbibliography[heading=none]
}

%Title Page Command
\newcommand{\institution}[1]{\def\@institution{#1}}
\newcommand{\course}[1]{\def\@course{#1}}
\newcommand{\instructor}[1]{\def\@instructor{#1}}
\renewcommand{\date}[1]{\def\@date{#1}}

\newcommand{\abstracttext}[1]{\def\@abstract{#1}}
\newcommand{\keywords}[1]{\def\@keywords{#1}}
\newcommand{\toc}[1]{\def\@tableofcontents{
		\tableofcontents
		\listoffigures
		\listoftables
	}}

\newcommand{\@checkfield}[3]{%
	\@ifundefined{#1}{%
		\ClassError{APA-Format}%
		{#2 is missing}%
		{Add \string#3 to your document preamble.}%
		#3% apply fallback so compilation can continue if user presses 'i' to ignore
	}{}%
}

\newcommand{\settitlepage}{%
	\@checkfield{@institution}{Institution}{\institution{institution name}}%
	\@checkfield{@course}{Course}{\course{course name}}%
	\@checkfield{@instructor}{Instructor}{\instructor{instructor name}}%
	\vspace*{96pt}
	\begin{center}
		{\normalsize\bfseries \@title} \\[24pt]
		{\@author} \\
		{\@institution} \\
		{\@course} \\
		{\@instructor} \\
		{\@date}
	\end{center}
	\ifdefined\@abstract%
		\newpage
		\centerline{\bfseries Abstract}
		\noindent
		\@abstract%

		\ifdefined\@keywords%
			{\itshape Keywords:} \@keywords%
		\fi
	\fi
	\ifdefined\@tableofcontents%
		\newpage
		\@tableofcontents%
	\fi
	\newpage
	\section{\@title}% %APA wants it as a level 1 heading
}

%Abstract formatting
\RequirePackage{changepage}

\renewenvironment{abstract}{
	\begin{center}
		\normalsize \bfseries \abstractname%
	\end{center}
	\begin{adjustwidth}{0in}{0in}
		}
		{\end{adjustwidth}}

%Fix Quotes
\RequirePackage{csquotes}
\MakeOuterQuote{"}

%ToDo Notes (add or remove "final" in class [] to toggle notes on and off)
\setlength{\marginparwidth}{2cm}
\RequirePackage[textsize=scriptsize, obeyFinal, textwidth=2cm, colorinlistoftodos]{todonotes}
\setuptodonotes{color=red!30!white} %Default (General/big picture stuff)
\todostyle{green}{color=green!40!white} %Rewording stuff
\todostyle{blue}{color=blue!40!white} %Adding stuff
\todostyle{grey}{color=black!30!white} %Todos in notes sections

%Draft Watermark on first page (responds to "final" just like todonotes)
\RequirePackage[firstpageonly=true, fontsize=12pt, scale=13]{draftwatermark}

% Inkscape Figures
\RequirePackage{import}
\RequirePackage{xifthen}
\RequirePackage{pdfpages}
\RequirePackage{transparent}

\newcommand{\inkfig}[1]{%
	\def\svgwidth{\columnwidth}
	\import{/home/ericfan/Documents/SFU-Coursework/Inkscape-Figures}{#1.pdf_tex}
}

%Links
\RequirePackage{hyperref}
\hypersetup{
	colorlinks   = true,
	urlcolor     = black,
	linkcolor    = black,
	citecolor    = black
}

