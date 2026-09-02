%% Thank-You-Format.cls
%% Copyright 2026 Eric Fan
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
% This work consists of the file Thank-You-Format.cls.

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Thank-You-Format}

\newif\if@sfu

\DeclareOption{sfu}{\@sfutrue}

\ProcessOptions\relax

\LoadClass[letterpaper,11pt]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage{tipa}

\RequirePackage[margin=1in]{geometry}

\RequirePackage{xcolor}
\RequirePackage{fontawesome5}
\RequirePackage{mdframed}

\RequirePackage{lipsum}
\RequirePackage{graphicx}
\RequirePackage[textsize=scriptsize, obeyFinal, textwidth=2cm, colorinlistoftodos]{todonotes}
\setuptodonotes{color=red!30!white} %Default (General/big picture stuff)
\todostyle{green}{color=green!40!white} %Rewording stuff
\todostyle{blue}{color=blue!40!white} %Adding stuff
\todostyle{grey}{color=black!30!white} %Todos in notes sections
\RequirePackage[firstpageonly=true, fontsize=12pt, scale=13]{draftwatermark}
\RequirePackage[hidelinks=true]{hyperref}
\RequirePackage{microtype}


\setlength{\parindent}{0em}
\setlength{\parskip}{1em}

\pagenumbering{gobble}
\raggedright

%%%%%%%%%% HEADER %%%%%%%%%%
\newcommand{\address}[2]{\def\@address{\href{#1}{#2}}}
\newcommand{\linkedin}[2]{\def\@linkedin{\href{#1}{#2}}}
\newcommand{\email}[1]{\def\@email{\href{mailto:#1}{#1}}}
\newcommand{\phone}[3]{\def\@phone{(#1) #2-#3}}

\newcommand{\company}[1]{\def\@company{\textit{#1}}}
\newcommand{\companyaddress}[2]{\def\@companyaddress{
		\textit{#1}\\
		\textit{#2}
	}}
\newcommand{\subject}[1]{\def\@subject{#1}}

\newcommand{\signature}[1]{\def\@signature{\includegraphics[width=1in]{#1}}}
\newcommand{\person}[1]{\def\@person{\textit{#1}}}
\newcommand{\persontwo}[1]{\def\@persontwo{\textit{#1}}}

\newcommand{\header}{
	\begin{center}
		\begin{center}
			{\huge \textbf{\@author}}
		\end{center}
		\@address \quad
		% \textcolor{white!20!orange}{\faMapMarker} \; \href{https://maps.app.goo.gl/8VcvwSbvJyw1xLkr5}{Burnaby, British Columbia} \quad
		\@phone \quad
		\@email \quad
		\@linkedin
	\end{center}

	\today

	\@company\\
	\@person\\
	\@companyaddress

	\textbf{\@subject}

	Hi \@persontwo,
}

\if@sfu
	\newcommand{\closing}{
		Sincerely,

		\@signature

		\textbf{\@author}\\
		Pronouns:\ he, him, his\\
		Simon Fraser University\\
		8888 University Dr., Burnaby, B.C. V5A 1S6

		\includegraphics[width=2in]{~/Documents/Co-Op/Figures/SFU-IS.png}

		\begin{minipage}{4in}
			\raggedright%
			\scriptsize{I respectfully acknowledge the xwmetkhkweyem (Musqueam), Skwxwu7mesh Uxwumixw (Squamish), selilwetal (Tsleil-Waututh), qiceyi (Katzie), kwikwetlem (Kwikwetlem), Qayqayt, Kwantlen, Semiahmoo and Tsawwassen peoples on whose unceded traditional territories our three campuses reside.}
		\end{minipage}
	}
\else
	\newcommand{\closing}{
		Sincerely,

		\@signature

		\@author\\
		Pronouns:\ he, him, his
	}
\fi
