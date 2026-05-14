% Cover Letter Format Class Offline Version
% Author: Gossie Fan
% License: CC BY-SA 4.0 https://creativecommons.org/licenses/by-sa/4.0/deed.en
% Last updated on May 10, 2026

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Cover-Letter-Format}

\LoadClass{article}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

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
\newcommand{\hiringmanager}[1]{\def\@hiringmanager{\textit{#1}}}
\newcommand{\department}[1]{\def\@department{\textit{#1}}}
\newcommand{\companyaddress}[2]{\def\@companyaddress{
		\textit{#1}\\
		\textit{#2}
	}}

\newcommand{\signature}[1]{\def\@signature{\includegraphics[width=1in]{#1}}}
\newcommand{\person}[1]{\def\@person{\textit{#1}}}

\newcommand{\header}{
	\begin{center}
		\begin{center}
			{\huge \textbf{\@author}}
		\end{center}
		\textcolor{white!20!orange}{\faMapMarker} \; \@address \quad
		% \textcolor{white!20!orange}{\faMapMarker} \; \href{https://maps.app.goo.gl/8VcvwSbvJyw1xLkr5}{Burnaby, British Columbia} \quad
		\textcolor{white!20!orange}{\faPhone} \; \@phone \quad
		\textcolor{white!20!orange}{\faEnvelope} \; \@email \quad
		\textcolor{white!20!orange}{\faLinkedin} \; \@linkedin
	\end{center}

	\today

	\@company\\
	\@hiringmanager\\
	\@department\\
	\@companyaddress

	Dear \@person,
}

\newcommand{\closing}{
	Sincerely,

	\@signature

	\@author\\
	Pronouns:\ he, him, his\\
	% T:\ 720 456 8675\\
	% E:\ erickylefan@gmail.com
}
