% Chicago Format Class Offline Version
% Author: Gossie Fan
% License: CC BY-SA 4.0 https://creativecommons.org/licenses/by-sa/4.0/deed.en
% Last updated on March 19, 2026

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Chicago-Format}

\LoadClass[12pt]{article}

%%%%%%%%% GENERAL FORMATTING %%%%%%%%%%

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

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
	\normalsize\bfseries
}
{}{0em}{}

\titlespacing{\section}{0em}{24pt}{0em}

\titleformat{\subsection}
{
	\normalsize\itshape
}
{}{0em}{}

\titlespacing{\subsection}{0em}{24pt}{0em}

%%%%%%%%%% REFERENCES %%%%%%%%%%
\RequirePackage{biblatex-chicago}

\newcommand{\referencelist}{
	\pagebreak
	\begin{center}
		\textbf{Bibliography}
	\end{center}
	\printbibliography[heading=none]
}

%%%%%%%%%% TITLE PAGE %%%%%%%%%%
\makeatletter
\newcommand{\course}[1]{\def\@course{#1}}
\renewcommand{\date}[1]{\def\@date{#1}}

\newcommand{\settitlepage}{%
	\vspace*{108pt}
	\begin{center}
		{\normalsize\bfseries \@title} \\
		\vspace{96pt}
		{\@author} \\
		{\@course} \\
		{\@date}
	\end{center}
	\pagebreak
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

\newcommand{\incfig}[1]{%
	\def\svgwidth{\columnwidth}
	\import{/home/ericfan/Documents/SFU-Coursework/Figures}{#1.pdf_tex}
}

%%%%%%%%%% LINKS %%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
	colorlinks   = true,    % Colors links instead of ugly boxes
	urlcolor     = black,    % Color for external hyperlinks
	linkcolor    = black,    % Color of internal links
	citecolor    = black      % Color of citations
}

%%%%%%%%%% BETTER TYPOGRAPHY %%%%%%%%%%
\RequirePackage{microtype}

%%%%%%%%%% PARAGRAPH INDENT %%%%%%%%%%
\setlength{\parindent}{0.5in}
\RequirePackage{indentfirst}
