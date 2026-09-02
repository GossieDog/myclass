%% Notes-Format-Old.cls
%% Copyright 2024 Eric Fan
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
% This work consists of the file Notes-Format-Old.cls.

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Notes-Format-Old}

\LoadClass[12pt]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}
\graphicspath{{~/Documents/Screenshots/}}

\RequirePackage{xcolor}
\colorlet{orange}{white!20!orange}

\RequirePackage{lipsum}

\RequirePackage[top=1in, bottom=1in, left=1in, right=2in, marginpar=1.5in]{geometry}

\RequirePackage{setspace}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\@course}
\fancyhead[R]{Eric Fan}
\fancyfoot[C]{\thepage}

\RequirePackage{amsmath}
\RequirePackage{multicol}

\RequirePackage{csquotes}
\MakeOuterQuote{"}

\RequirePackage{tikz, tcolorbox}
\tcbuselibrary{breakable}
\setlength{\headheight}{15pt}
\addtolength{\topmargin}{-3pt}

\RequirePackage{mdframed}

\usepackage{titlesec}
\titleformat{\section}
{
	\large\bfseries
}
{}{0em}{}

\titleformat{\subsection}
{
	\normalsize\bfseries
}
{}{0em}{}

\RequirePackage{hyperref}
\hypersetup{
	colorlinks   = true,    % Colors links instead of ugly boxes
	urlcolor     = black,    % Color for external hyperlinks
	linkcolor    = black,    % Color of internal links
	citecolor    = black      % Color of citations
}

% New Commands

\newcommand{\institution}[1]{\def\@institution{#1}}
\newcommand{\course}[1]{\def\@course{#1}}
\newcommand{\instructor}[1]{\def\@instructor{#1}}
\renewcommand{\date}[1]{\def\@date{#1}}

\newcommand{\abstracttext}[1]{\def\@abstract{#1}}
\newcommand{\keywords}[1]{\def\@keywords{#1}}

\author{Eric Fan}
\institution{Simon Fraser University}

\newcommand{\settitlepage}{%
	\thispagestyle{plain}
	\newgeometry{margin=1in}
	\doublespacing%
	\begin{center}
		{\large\bfseries \@course: \@title} \\[12pt]
		\@author \\
		\@institution \\
		\@date
	\end{center}
	\singlespacing%
	\tableofcontents
	\restoregeometry%
}

\newcommand{\readingtitle}[1]{
	\begin{center}
		{\large\bfseries#1}
	\end{center}
}

\newcommand{\marginnote}[1]{\marginpar{\raggedright{#1}}}

\newcommand{\vocab}[1]{
	\textcolor{orange}{#1}\marginnote{#1}
}

\newcommand{\highlight}[1]{
	\colorbox{yellow}{#1}
}

% New Environments

\newenvironment{redbox}[1]
{\begin{tcolorbox} [breakable, title=#1, colback=red!10!white, colframe=black!70!white]}
		{\end{tcolorbox}}

\newenvironment{bluebox}[1]
{\begin{tcolorbox} [breakable, title=#1, colback=blue!10!white, colframe=black!70!white]}
		{\end{tcolorbox}}

\newenvironment{quizbox}[1]
{\begin{tcolorbox} [breakable, title=On Quiz: #1, colback=red!10!white, colframe=black!70!white]}
		{\end{tcolorbox}}

\renewenvironment{quote}
{\begin{mdframed}[topline=false,bottomline=false,rightline=false, linewidth=3pt, linecolor=white!20!orange]}
		{\end{mdframed}}

\AtBeginDocument{
	\usepackage{microtype}
}
