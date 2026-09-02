%% Reference-Format.cls
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
% This work consists of the file Reference-Format.cls.

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Reference-Format}

\LoadClass[letterpaper,11pt]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage[margin=1in]{geometry}

\RequirePackage{fontawesome5}
\RequirePackage{xcolor}

\RequirePackage{titlesec}
\titleformat{\section}{\large\bfseries}{}{0em}{}[{\vspace{2pt}\titlerule[1pt]}]

\RequirePackage[textsize=scriptsize, obeyFinal, textwidth=2cm, colorinlistoftodos]{todonotes}
\setuptodonotes{color=red!30!white} %Default (General/big picture stuff)
\todostyle{green}{color=green!40!white} %Rewording stuff
\todostyle{blue}{color=blue!40!white} %Adding stuff
\todostyle{grey}{color=black!30!white} %Todos in notes sections

\RequirePackage[firstpageonly=true, fontsize=12pt, scale=13]{draftwatermark}
\RequirePackage{mdframed}


\RequirePackage[hidelinks=true]{hyperref}
\RequirePackage{microtype}

\setlength{\parindent}{0em}
\setlength{\parskip}{1em}

%%%%%%%%%% HEADER %%%%%%%%%%
\newcommand{\address}[2]{\def\@address{\href{#1}{#2}}}
\newcommand{\linkedin}[2]{\def\@linkedin{\href{#1}{#2}}}
\newcommand{\email}[1]{\def\@email{\href{mailto:#1}{#1}}}
\newcommand{\phone}[3]{\def\@phone{(#1) #2-#3}}

\newcommand{\header}{
	\begin{center}
		\begin{center}
			{\huge \textbf{\@author}}
		\end{center}
		\vspace{10pt}
		\@address \quad
		% \textcolor{white!20!orange}{\faMapMarker} \; \href{https://maps.app.goo.gl/8VcvwSbvJyw1xLkr5}{Burnaby, British Columbia} \quad
		\@phone \quad
		\@email \quad
		\@linkedin
	\end{center}
}

\newcommand{\referenceentry}[6]{
	\begin{mdframed}[linecolor=white!20!orange,linewidth=2pt,topline=false,bottomline=false,rightline=false]
		\textbf{#1} \hfill Phone:\ #2 | Email:\ \href{mailto:#3}{#3}\\
		\textit{#4}, \textit{#5}

		Relationship:\ #6
	\end{mdframed}
}
