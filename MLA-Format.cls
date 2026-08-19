% MLA Format Class Offline Version
% Author: Gossie Fan
% License: CC BY-SA 4.0 https://creativecommons.org/licenses/by-sa/4.0/deed.en
% Last updated on August 19, 2026

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{MLA-Format}

\LoadClass[12pt]{article}

%%%%%%%%%% GENERAL FORMATTING %%%%%%%%%%

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
\setlength{\headheight}{14.5pt}

\raggedright

%%%%%%%%%% SECTION HEADERS %%%%%%%%%%
\RequirePackage{titlesec}

\titleformat{\section}
{
	\normalsize\bfseries
}
{}{0em}{}

\titlespacing{\section}{0em}{0em}{0em}

\titleformat{\subsection}
{
	\normalsize\itshape
}
{}{0em}{}

\titlespacing{\subsection}{0em}{0em}{0em}

\titleformat{\subsubsection}
{
	\centering\normalsize\bfseries
}
{}{0em}{}

\titlespacing{\subsubsection}{0em}{0em}{0em}

%%%%%%%%%% CAPTIONS %%%%%%%%%%
\RequirePackage[singlelinecheck=off]{caption}

\DeclareCaptionLabelFormat{MLALabel}{\doublespacing\noindent\normalsize\normalfont\raggedright{#1 #2}}
\DeclareCaptionTextFormat{MLAText}{\doublespacing\noindent\normalsize\normalfont\raggedright{#1}}
\DeclareCaptionLabelSeparator{MLASpace}{. }
\DeclareCaptionLabelSeparator{MLATableSpace}{\par}

\captionsetup[figure]{
	position=below,
	name=Fig.,
	labelformat=MLALabel,
	textformat=MLAText,
	labelsep=MLASpace
}

\captionsetup[table]{
	position=above,
	labelformat=MLALabel,
	textformat=MLAText,
	labelsep=MLATableSpace
}

\newcommand{\tablenote}[1]{\par\noindent\flushleft\normalsize\normalfont\doublespacing{\notelabel.} {#1}}

\def\notelabel{Source}

%%%%%%%%%% LINE SPACING %%%%%%%%%%
\RequirePackage{setspace}
\doublespacing

%Set Headers and Footers
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot{}
\fancyhead[L]{}
\fancyhead[R]{Fan \thepage}

%%%%%%%%%% REFERNCES %%%%%%%%%%
\RequirePackage[backend=biber,style=mla]{biblatex}
\setlength{\bibhang}{0.5in}

\newcommand{\referencelist}{
	\pagebreak
	\begin{center}
		Works Cited
	\end{center}
	\printbibliography[heading=none]
}

%%%%%%%%%% TITLE PAGE %%%%%%%%%%
\makeatletter
\newcommand{\course}[1]{\def\@course{#1}}
\renewcommand{\date}[1]{\def\@date{#1}}
\newcommand{\instructor}[1]{\def\@instructor{#1}}

\newcommand{\@checkfield}[3]{%
	\@ifundefined{#1}{%
		\ClassError{MLA-Format}%
		{#2 is missing}%
		{Add \string#3 to your document preamble.}%
		#3% apply fallback so compilation can continue if user presses 'i' to ignore
	}{}%
}

\newcommand{\settitlepage}{%
	\@checkfield{@course}{Course}{\course{course name}}%
	\@checkfield{@instructor}{Instructor}{\instructor{instructor name}}%
	\noindent \@author\\
	\noindent\@instructor\\
	\noindent\@course\\
	\noindent\@date
	\begin{center}
		{\@title}
	\end{center}
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

%%%%%%%%%% FORMAT ABSTRACT (optional) %%%%%%%%%%
% \RequirePackage{changepage}
%
% \renewenvironment{abstract}{
%   \begin{center}
%     \normalsize \abstractname
%   \end{center}
%   \begin{adjustwidth}{0in}{0in}
% }
% {\end{adjustwidth}}

%%%%%%%%%% LINKS %%%%%%%%%%
\RequirePackage{hyperref} %comment out package to get rid of linked in-text citations
\hypersetup{
	colorlinks   = true,    % Colors links instead of ugly boxes
	urlcolor     = black,    % Color for external hyperlinks
	linkcolor    = black,    % Color of internal links
	citecolor    = black      % Color of citations
}

%%%%%%%%%% BETTER TYPOGRAPHY %%%%%%%%%%
\RequirePackage{microtype}

%%%%%%%%%% PARAGRAPH INDENT %%%%%%%%%%
\setlength\parindent{0.5in}
\RequirePackage{indentfirst}
