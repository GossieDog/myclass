%% Chicago-Format.cls
%% Copyright 2025 Eric Fan
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Eric Fan
%
% This work consists of the file Chicago-Format.cls.

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Chicago-Format}

\newif\if@instructions
\newif\if@notes
\newif\if@savetrees

\DeclareOption{instructions}{\@instructionstrue}
\DeclareOption{notes}{\@notestrue}
\DeclareOption{savetrees}{\@savetreestrue}

\ProcessOptions\relax

\LoadClass[12pt]{article}

%%%%%%%%%% Instructions %%%%%%%%%%

\if@instructions
	\newcommand{\instructions}[1]{#1}
\else
	\newcommand{\instructions}[1]{}
\fi

%%%%%%%%%% Notes %%%%%%%%%%

\if@notes
	\newcommand{\notes}[1]{#1}
\else
	\newcommand{\notes}[1]{}
\fi

%%%%%%%%%% Savetrees %%%%%%%%%%

\if@savetrees
	\AtBeginDocument{
		\usepackage[extreme]{savetrees}
	}
\fi

%%%%%%%%% GENERAL FORMATTING %%%%%%%%%%

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[american]{babel}

\RequirePackage{verbatim}
\RequirePackage{graphicx}

\RequirePackage{xparse}
\RequirePackage{lipsum}
\RequirePackage{xcolor}
\RequirePackage{enumitem}
\RequirePackage{tabu}
\RequirePackage{booktabs}

\RequirePackage[margin=1in]{geometry}
\setlength{\headheight}{15pt}

\raggedright

\RequirePackage{setspace}
\doublespacing

%%%%%%%%%% HEADERS AND FOOTERS %%%%%%%%%%
\setlength{\headheight}{14.49998pt}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[r]{\thepage}

%%%%%%%%%% LINE SPACING %%%%%%%%%%
\RequirePackage{setspace}
\doublespacing

%%%%%%%%%% SECTION HEADERS %%%%%%%%%%
\RequirePackage{titlesec}

\titleformat{\section}
{
	\centering\normalsize\bfseries
}
{}{0em}{}

\titlespacing{\section}{0em}{0em}{0em}

\titleformat{\subsection}
{
	\centering\normalsize
}
{}{0em}{}

\titlespacing{\subsection}{0em}{0em}{0em}

\titleformat{\subsubsection}
{
	\normalsize\itshape
}
{}{0em}{}

\titlespacing{\subsubsection}{0em}{0em}{0em}

%%%%%%%%%% CAPTIONS %%%%%%%%%%
\RequirePackage[singlelinecheck=off]{caption}

\DeclareCaptionLabelFormat{ChicagoLabel}{\doublespacing\noindent\normalsize\normalfont\raggedright{#1 #2}}
\DeclareCaptionTextFormat{ChicagoText}{\doublespacing\noindent\normalsize\normalfont\raggedright{#1}}
\DeclareCaptionLabelSeparator{ChicagoSpace}{. }

\captionsetup[figure]{
	position=below,
	labelformat=ChicagoLabel,
	textformat=ChicagoText,
	labelsep=ChicagoSpace
}

\captionsetup[table]{
	position=above,
	labelformat=ChicagoLabel,
	textformat=ChicagoText,
}

\newcommand{\tablenote}[1]{\par\noindent\flushleft\normalsize\normalfont\doublespacing\textit{\notelabel.} {#1}}

\def\notelabel{Source}

%%%%%%%%%% REFERENCES %%%%%%%%%%
\RequirePackage{etoolbox}
\RequirePackage{keyval}
\RequirePackage{ifthen}
\RequirePackage{url}
\RequirePackage[notes,backend=biber]{biblatex-chicago}

\newcommand{\referencelist}{
	\newpage
	\begin{center}
		\textbf{Bibliography}
	\end{center}
	\printbibliography[heading=none]
}

%%%%%%%%%% TITLE PAGE %%%%%%%%%%
\makeatletter
\newcommand{\course}[1]{\def\@course{#1}}
\renewcommand{\date}[1]{\def\@date{#1}}

\newcommand{\@checkfield}[3]{%
	\@ifundefined{#1}{%
		\ClassError{Chicago-Format}%
		{#2 is missing}%
		{Add \string#3 to your document preamble.}%
		#3% apply fallback so compilation can continue if user presses 'i' to ignore
	}{}%
}

\newcommand{\settitlepage}{%
	\@checkfield{@course}{Course}{\course{course name}}%
	\thispagestyle{empty}
	\vspace*{108pt}
	\begin{center}
		{\normalsize\bfseries \@title} \\
		\vspace{96pt}
		{\@author} \\
		{\@course} \\
		{\@date}
	\end{center}
	\newpage
	\setcounter{page}{1}
}
\makeatother

%%%%%%%%%% FIX QUOTES %%%%%%%%%%
\RequirePackage{csquotes}
\MakeOuterQuote{"}

%%%%%%%%%% TODO NOTES %%%%%%%%%%
\setlength{\marginparwidth}{2cm}
\RequirePackage[textsize=scriptsize, obeyFinal, textwidth=2cm, colorinlistoftodos]{todonotes}
\setuptodonotes{color=red!30!white} %Default (General/big picture stuff)
\todostyle{green}{color=green!40!white} %Rewording stuff
\todostyle{blue}{color=blue!40!white} %Adding stuff
\todostyle{grey}{color=black!30!white} %Todos in notes sections

%%%%%%%%%% DRAFT WATERMARK %%%%%%%%%%
\RequirePackage[firstpageonly=true, fontsize=12pt, scale=13]{draftwatermark}

% Inkscape Figures
\usepackage{import}
\usepackage{xifthen}
\usepackage{pdfpages}
\usepackage{transparent}

\newcommand{\inkfig}[1]{%
	\def\svgwidth{\columnwidth}
	\import{/home/ericfan/Documents/SFU-Coursework/Inkscape-Figures}{#1.pdf_tex}
}

%%%%%%%%%% LINKS %%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
	colorlinks   = true,    % Colors links instead of ugly boxes
	urlcolor     = black,    % Color for external hyperlinks
	linkcolor    = black,    % Color of internal links
	citecolor    = black      % Color of citations
}

%%%%%%%%%% INTERNAL REFERENCES %%%%%%%%%%
\usepackage{cleveref}

%%%%%%%%%% BETTER TYPOGRAPHY %%%%%%%%%%
\RequirePackage{microtype}

%%%%%%%%%% PARAGRAPH INDENT %%%%%%%%%%
\setlength{\parindent}{0.5in}
\RequirePackage{indentfirst}
