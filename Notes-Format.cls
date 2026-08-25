%%%%%%%%%% NOTES CLASS %%%%%%%%%%
% Author: Gossie Fan
% License: CC BY-SA 4.0 https://creativecommons.org/licenses/by-sa/4.0/deed.en
% Last updated on April 17, 2025

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Notes-Format}

\LoadClass[12pt]{report}

%%%%%%%%%% ENCODING AND FONTS %%%%%%%%%%
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage{newtxtext}
% \RequirePackage[default]{sourcesanspro}

%%%%%%%%%% GENERAL %%%%%%%%%%
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{multicol}
\RequirePackage{lipsum}

%%%%%%%%%% QUOTES %%%%%%%%%%
\RequirePackage{csquotes}
\MakeOuterQuote{"}

%%%%%%%%%% PAGE SETUP %%%%%%%%%%
\RequirePackage[top=1.5in, bottom=1.5in, left=1in, right=1.5in]{geometry}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[r]{}
\setlength{\headheight}{27.1pt}

%%%%%%%%%% TITLE AND SECTION FORMATTING %%%%%%%%%%
\RequirePackage[xcolor]{mdframed}
\definecolor{lightbrown}{HTML}{F2EFE9}
\mdfdefinestyle{mystyle}{innertopmargin=1cm, innerbottommargin=1cm, linewidth=1pt, leftline=false, rightline=false, backgroundcolor=lightbrown}

\RequirePackage{titlesec}
\titleformat{\chapter}{\Large\bfseries}{\thechapter}{1em}{}[\vspace{2pt}{\titlerule[0.6pt]}\vspace{2pt}]
\titlespacing{\chapter}{0pt}{0pt}{1.5em}
\titleformat{\section}{\normalsize\bfseries}{\thesection}{0.5em}{}
\titleformat{\subsection}{\normalsize}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}{\normalsize\normalfont}{}{}{}


%%%%%%%%%% REFERENCES %%%%%%%%%%
\RequirePackage[backend=biber]{biblatex-chicago}

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

%%%%%%%%%% TYPOGRAPHY %%%%%%%%%%
\RequirePackage[nopatch=footnote]{microtype}

%%%%%%%%%% CUSTOM COMMANDS %%%%%%%%%%
\newcommand{\marginnote}[1]{\marginpar{\raggedright{#1}}}

%%%%%%%%%% COVER PAGE %%%%%%%%%%
\newcommand{\term}[1]{\def\@term{#1}}
\newcommand{\instructor}[1]{\def\@instructor{#1}}
\newcommand{\institution}[1]{\def\@institution{#1}}

\newcommand{\@checkfield}[3]{%
	\@ifundefined{#1}{%
		\ClassError{Notes-Format}%
		{#2 is missing}%
		{Add \string#3 to your document preamble.}%
		#3% apply fallback so compilation can continue if user presses 'i' to ignore
	}{}%
}

\newcommand{\settitlepage}{%
	\@checkfield{@institution}{Institution}{\institution{institution name}}%
	\@checkfield{@term}{Term}{\course{term name}}%
	\newgeometry{margin=1in}
	\begin{titlepage}
		\vspace*{5em}
		\begin{mdframed}[style=mystyle]
			\centering
			{\Huge\textbf{\@title}}

			\vspace{1cm}

			{\large{\@institution}}

			\vspace{0.5cm}

			{\large{\@term}}

			\vspace{0.5cm}

			{\large{\@author}}
		\end{mdframed}
	\end{titlepage}

	\tableofcontents
	\restoregeometry
}
