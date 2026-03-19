% MLA Format Class Offline Version
% Author: Gossie Fan
% License: CC BY-SA 4.0 https://creativecommons.org/licenses/by-sa/4.0/deed.en
% Last updated on March 19, 2026

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{MLA-Format}

\LoadClass[12pt]{article}

%%%%%%%%%% GENERAL FORMATTING %%%%%%%%%%

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage{xparse}
\RequirePackage{lipsum}
\RequirePackage{xcolor}
\RequirePackage{enumitem}
\RequirePackage{tabu}
\RequirePackage{booktabs}

\RequirePackage[margin=1in]{geometry}
\setlength{\headheight}{14.5pt}


%%%%%%%%%% SECTION HEADERS %%%%%%%%%%
\RequirePackage{titlesec}
\titleformat{\section}[block]{\normalfont\normalsize}{\thesection}{1em}{}
\titleformat{\subsection}[block]{\normalfont\normalsize}{\thesubsection}{1em}{}

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
\RequirePackage[backend=biber,
	style=mla]{biblatex}

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

\newcommand{\settitlepage}{%
	\noindent \@author\\
	\@instructor\\
	\@course\\
	\@date
	\begin{center}
		\section{\@title}
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
