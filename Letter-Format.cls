% Letter Format Class Offline Version
% Author: Gossie Fan
% License: CC BY-SA 4.0 https://creativecommons.org/licenses/by-sa/4.0/deed.en
% Last updated on May 21, 2026

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Letter-Format}

\LoadClass{article}

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}

\usepackage[margin=1in]{geometry}

\usepackage{xcolor}
\usepackage{fontawesome5}
\usepackage{mdframed}

\usepackage{lipsum}
\usepackage{graphicx}
\usepackage[textsize=scriptsize, obeyFinal, textwidth=2cm, colorinlistoftodos]{todonotes}
\setuptodonotes{color=red!30!white}
\todostyle{green}{color=green!40!white}
\todostyle{blue}{color=blue!40!white}
\todostyle{grey}{color=black!30!white}
\usepackage[firstpageonly=true, fontsize=12pt, scale=13]{draftwatermark}
\usepackage[hidelinks=true]{hyperref}
\usepackage{microtype}


\setlength{\parindent}{0em}
\setlength{\parskip}{1em}

\pagenumbering{gobble}
\raggedright%

\newcommand{\address}[2]{\def\@address{\href{#1}{#2}}}
\newcommand{\email}[1]{\def\@email{\href{mailto:#1}{#1}}}
\newcommand{\phone}[3]{\def\@phone{(#1) #2-#3}}
\newcommand{\signature}[1]{\def\@signature{\includegraphics[width=1in]{#1}}}

\newcommand{\subject}[1]{\def\@subject{#1}}
\newcommand{\company}[1]{\def\@company{\textit{#1}}}
\newcommand{\person}[1]{\def\@person{\textit{#1}}}
\newcommand{\dearperson}[1]{\def\@dearperson{#1}}
\newcommand{\companyaddress}[2]{\def\@companyaddress{
		\textit{#1}\\
		\textit{#2}
	}}

\newcommand{\header}{
	\today

	\@company\\
	\@person\\
	\@companyaddress

	\textbf{\@subject}\\
	\rule{\textwidth}{0.5pt}

	Dear \@dearperson,
}

\newcommand{\closing}{
	Sincerely,

	\@signature

	\@author\\
	\@address\\
	\@phone\\
	\@email
}
