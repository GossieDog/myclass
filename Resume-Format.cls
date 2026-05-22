% Resume Format Class Offline Version
% Author: Gossie Fan
% License: CC BY-SA 4.0 https://creativecommons.org/licenses/by-sa/4.0/deed.en
% Last updated on May 10, 2026

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Resume-Format}

\LoadClass[letterpaper,11pt]{article}

\RequirePackage[top=0.5in, left=0.5in, right=0.5in, bottom=1in]{geometry}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[c]{\thepage}

\RequirePackage{xcolor}
\RequirePackage{enumitem}

\RequirePackage{titlesec}
\titleformat{\section}{\large\bfseries}{}{0em}{}[{\vspace{2pt}\titlerule[1pt]}]

\RequirePackage{tabularx}
\RequirePackage{fontawesome5}
\RequirePackage{multicol}
\RequirePackage{mdframed}

\RequirePackage[textsize=scriptsize, obeyFinal, textwidth=2cm, colorinlistoftodos]{todonotes}
\setuptodonotes{color=red!30!white} %Default (General/big picture stuff)
\todostyle{green}{color=green!40!white} %Rewording stuff
\todostyle{blue}{color=blue!40!white} %Adding stuff
\todostyle{grey}{color=black!30!white} %Todos in notes sections

\RequirePackage[firstpageonly=true, fontsize=12pt, scale=13]{draftwatermark}

\RequirePackage[hidelinks]{hyperref}

\RequirePackage{microtype}

\setlength{\parindent}{0pt}
\setlist[itemize]{noitemsep, topsep=0pt}

\renewcommand{\headrulewidth}{0em}

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
		\textcolor{white!20!orange}{\faMapMarker} \; \@address \quad
		% \textcolor{white!20!orange}{\faMapMarker} \; \href{https://maps.app.goo.gl/8VcvwSbvJyw1xLkr5}{Burnaby, British Columbia} \quad
		\textcolor{white!20!orange}{\faPhone} \; \@phone \quad
		\textcolor{white!20!orange}{\faEnvelope} \; \@email \quad
		\textcolor{white!20!orange}{\faLinkedin} \; \@linkedin
	\end{center}
}

%%%%%%%%%% ENTRY COMMANDS %%%%%%%%%%
\newcommand{\workentry}[5]{
	\begin{mdframed}[linecolor=white!20!orange,linewidth=2pt,topline=false,bottomline=false,rightline=false]
		\textbf{#1} \hfill #2 \\
		\textit{#3, #4}

		#5
	\end{mdframed}
}

\newcommand{\educationentry}[4]{
	\begin{mdframed}[linecolor=white!20!orange,linewidth=2pt,topline=false,bottomline=false,rightline=false]
		\textbf{#1} \hfill #2 \\
		\textit{#3}

		#4
	\end{mdframed}
}

% \newcommand{\educationentry}[3]{
% 	\begin{mdframed}[linecolor=white!20!orange,linewidth=2pt,topline=false,bottomline=false,rightline=false]
% 		\textbf{#1} \hfill #2 \\
% 		#3
% 	\end{mdframed}
% }

\newcommand{\summary}[1]{
	\begin{mdframed}[linecolor=white!20!orange,linewidth=2pt,topline=false,bottomline=false,rightline=false]
		#1
	\end{mdframed}
}
