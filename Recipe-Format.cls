% Recipe Format Class Offline Version
% Author: Gossie Fan
% License: CC BY-SA 4.0 https://creativecommons.org/licenses/by-sa/4.0/deed.en
% Last updated on May 12, 2026

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Recipe-Format}

\LoadClass{article}

%%%%%%%%%% PREAMBLE %%%%%%%%%%

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

%%%%%%%%%% PAGE GEOMETRY %%%%%%%%%%
\RequirePackage[top=2cm, bottom=2cm, left=2.5cm, right=2.5cm, headheight=21pt]{geometry}

%%%%%%%%%% COLOUR %%%%%%%%%%
\RequirePackage{xcolor}
\definecolor{red}{HTML}{C0392B}
\definecolor{redlight}{HTML}{E74C3C}
\definecolor{ginger}{HTML}{D4A017}
\definecolor{cream}{HTML}{FFF8F0}
\definecolor{darktext}{HTML}{2C3E50}
\definecolor{lightgraybg}{HTML}{FDF2E9}
\definecolor{warningred}{HTML}{E74C3C}
\definecolor{successgreen}{HTML}{27AE60}

%%%%%%%%%% FONTS %%%%%%%%%%
\RequirePackage{ebgaramond}
\RequirePackage[scaled=0.85]{sourcecodepro}

%%%%%%%%%% ENHANCED LISTS %%%%%%%%%%
\RequirePackage{enumitem}
\setlist[itemize]{leftmargin=1.5em, nosep, label=\textcolor{red}{$\bullet$}}
\setlist[enumerate]{leftmargin=1.5em, nosep, itemsep=2pt}

%%%%%%%%%% MULTICOL %%%%%%%%%%
\RequirePackage{multicol}

%%%%%%%%%% FIX QUOTES %%%%%%%%%%
\RequirePackage{csquotes}
\MakeOuterQuote{"}

%%%%%%%%%% LINKS %%%%%%%%%%
\RequirePackage[hidelinks]{hyperref}

%%%%%%%%%% BETTER TYPOGRAPHY %%%%%%%%%%
\RequirePackage{microtype}

%%%%%%%%%% TIKZ FOR DECORATIONS %%%%%%%%%%
\RequirePackage{tikz}
\usetikzlibrary{decorations.pathmorphing, calc}

%%%%%%%%%% ICONS %%%%%%%%%%
\RequirePackage{fontawesome5}

%%%%%%%%%% BOXES %%%%%%%%%%
\RequirePackage{tcolorbox}
\tcbuselibrary{skins, breakable, most}

%%%%%%%%%% HEADERS %%%%%%%%%%
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
% \fancyhead[L]{\textcolor{red!60}{\small\textsc{Sichuan Stir-Fried Green Beans}}}
% \fancyhead[R]{\textcolor{red!60}{\small\textsc{Chef Wang Gang}}}
% \renewcommand{\headrulewidth}{0.4pt}
% \renewcommand{\headrule}{\hbox to\headwidth{\textcolor{red!40}{\leaders\hrule height0.4pt\hfill}}}
\fancyfoot[C]{\textcolor{red!40}{\thepage}}

\renewcommand{\headrulewidth}{0em}

%%%%%%%%%% CUSTOM SECTION STYLING %%%%%%%%%%
\RequirePackage{titlesec}
\titleformat{\section}
{\normalfont\Large\bfseries\color{red}}
{\llap{\textcolor{red}{\rule[2pt]{1.2em}{1.5pt}}\hspace{0.5em}}}{0pt}
{}

\titleformat{\subsection}
{\normalfont\large\itshape\color{red!80}}
{\llap{\textcolor{red!60}{\rule[2pt]{0.8em}{1.2pt}}\hspace{0.5em}}}{0pt}
{}

%%%%%%%%%% DECORATIVE ORNAMENT %%%%%%%%%%
\newcommand{\recipeornament}{%
	\begin{center}
		\textcolor{red!35}{%
			\rule[2pt]{2.5cm}{0.4pt}%
			\hspace{0.5em}%
			{\small$\star$}%
			\hspace{0.5em}%
			\rule[2pt]{2.5cm}{0.4pt}%
		}
	\end{center}
}

%%%%%%%%%% RECIPE INFO BOX %%%%%%%%%%
\newtcolorbox{recipebox}[2]{
	colback=cream,
	colframe=red,
	coltitle=white,
	fonttitle=\bfseries\large,
	title={\faShoppingBasket\hspace{0.4em}#1},
	sharp corners,
	boxrule=1.5pt,
	arc=0pt,
	left=6pt,
	right=6pt,
	top=4pt,
	bottom=4pt,
	enhanced,
	drop fuzzy shadow,
	beforeafter skip=12pt,
	overlay={
			\node[anchor=south east, xshift=-8pt, yshift=6pt] at (frame.south east)
			{\textcolor{red!40}{\small #2}};
		}
}

%%%%%%%%%% META INFO BOX %%%%%%%%%%
\newtcolorbox{metabox}[1][]{
	colback=lightgraybg,
	colframe=red!40,
	sharp corners,
	boxrule=0.8pt,
	arc=0pt,
	left=8pt,
	right=8pt,
	top=6pt,
	bottom=6pt,
	enhanced,
	beforeafter skip=8pt,
	#1
}

%%%%%%%%%% WARNING BOX %%%%%%%%%%
\newtcolorbox{warningbox}[1][]{
	colback=cream,
	colframe=warningred,
	coltext=warningred!90!black,
	sharp corners,
	boxrule=1.2pt,
	arc=0pt,
	left=8pt,
	right=8pt,
	top=4pt,
	bottom=4pt,
	enhanced,
	drop fuzzy shadow,
	beforeafter skip=10pt,
	#1
}

%%%%%%%%%% TIP BOX %%%%%%%%%%
\newtcolorbox{tipbox}[1][]{
	colback=cream,
	colframe=ginger,
	coltext=darktext!80,
	sharp corners,
	boxrule=1.2pt,
	arc=0pt,
	left=8pt,
	right=8pt,
	top=4pt,
	bottom=4pt,
	enhanced,
	drop fuzzy shadow,
	beforeafter skip=10pt,
	#1
}

%%%%%%%%%% TITLE %%%%%%%%%%

\renewcommand{\title}[1]{\def\@title{
		{\Huge\bfseries\color{red} #1}
	}}
\newcommand{\youtube}[2]{\def\@youtube{
		{\normalsize\color{darktext!60} \faYoutube\hspace{0.3em}\href{#1}{#2}}
	}}

\newcommand{\header}{
	\begin{center}
		{\@title}\\[1em]
		{\@youtube}
	\end{center}
}

\newcommand{\serves}[1]{\def\@serves{#1}}
\newcommand{\preptime}[1]{\def\@preptime{#1}}
\newcommand{\cooktime}[1]{\def\@cooktime{#1}}

\newcommand{\infobox}{
	\begin{metabox}
		\begin{multicols}{3}
			\begin{center}
				\textcolor{red}{\faClock}\\[3pt]
				{\small\bfseries Prep} \\[-1pt]
				{\footnotesize \@preptime}
			\end{center}
			\columnbreak
			\begin{center}
				\textcolor{red}{\faFire}\\[3pt]
				{\small\bfseries Cook} \\[-1pt]
				{\footnotesize \@cooktime}
			\end{center}
			\columnbreak
			\begin{center}
				\textcolor{red}{\faUsers}\\[3pt]
				{\small\bfseries Serves} \\[-1pt]
				{\footnotesize \@serves}
			\end{center}
		\end{multicols}
	\end{metabox}
}
