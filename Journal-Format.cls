% Journal Format Class Offline Version
% Author: Gossie Fan
% License: CC BY-SA 4.0 https://creativecommons.org/licenses/by-sa/4.0/deed.en
% Last updated on June 24, 2026

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Journal-Format}

\LoadClass[12pt]{article}

%%%%%%%%%% GENERAL FORMATTING %%%%%%%%%%

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage[margin=1in]{geometry}

\RequirePackage{lipsum}
\RequirePackage{graphicx}

%%%%%%%%%% FANCY BOX %%%%%%%%%%
\RequirePackage{pgfornament-han}

\RequirePackage{tikz}
\usetikzlibrary{decorations.markings, positioning}
\RequirePackage{xcolor}
\definecolor{red}{RGB}{158,25,22}
\RequirePackage{pgfornament-han}

%%%%%%%%%% HEADERS AND FOOTERS %%%%%%%%%%
\RequirePackage{fancyhdr}
\fancyhf{}
\renewcommand{\headrule}{}
\fancyhead[C]{\pgfornamenthan[scale=0.2,color=red]{60}}
\fancyfoot[C]{\thepage}
\pagestyle{fancy}

%%%%%%%%%% HEADINGS %%%%%%%%%%
\RequirePackage{titlesec}
\titleformat{\section}{\normalsize\bfseries}{}{0em}{}
\titlespacing{\section}{0em}{1em}{1em}
\titleformat{\subsection}{\normalsize\bfseries}{}{0em}{}
\titlespacing{\subsection}{0em}{0em}{0em}
\titleformat{\subsubsection}{\normalsize\itshape\bfseries}{}{0em}{}
\titlespacing{\subsubsection}{0em}{0em}{0em}

\setlength{\headheight}{22.1pt}
\setlength{\parindent}{0em}
\setlength{\parskip}{0.5em}

\RequirePackage{csquotes}
\MakeOuterQuote{"}

\RequirePackage{hyperref}

%%%%%%%%%% BETTER TYPOGRAPHY %%%%%%%%%%
\RequirePackage{microtype}

\newcommand{\settitlepage}{%
	\newgeometry{margin=1in}
	\begin{titlepage}
		\vspace*{1in}
		\centering
		\begin{tikzpicture}[x=1pt,y=1pt]
			\tikzset{every node/.append style={inner sep=0pt,color=red}}
			\node (nw) {\pgfornamenthan[scale=0.35]{1}};
			\node[anchor=north west,right=140bp of nw] (ne)
			{\pgfornamenthan[symmetry=v,scale=0.35]{1}};
			\node[anchor=north west,below=0pt of nw] (sw)
			{\pgfornamenthan[symmetry=h,scale=0.35]{1}};
			\node[anchor=north east,below=0pt of ne] (se)
			{\pgfornamenthan[symmetry=c,scale=0.35]{1}};
			\node[anchor=south west,xscale=2] at (sw.south east) {\pgfornamenthan[scale=0.35]{29}};
			\begin{scope}[decoration={markings,
							mark=between positions 0 and 0.75 step 70bp with
								{ \node[transform shape,anchor=north west]{\pgfornamenthan[scale=0.35]{29}};}
						}]
				\draw[decorate] (nw.north east) -- (ne.north west);
			\end{scope}
			\node[align=center,xshift=70,text=black] at (nw.south east)
			{{\Large{Practice Journal}}\\[1em]
				Eric Fan\\[0.5em]
				\today};
		\end{tikzpicture}
	\end{titlepage}
}
