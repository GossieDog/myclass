%% Assignment-Format.cls
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
% This work consists of the file Assignment-Format.cls.


\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Assignment-Format}

% \newif\if@answerkey
%
% \DeclareOption{answerkey}{\answerkeytrue}
%
% \ProcessOptions\relax

\LoadClass{article}

% \if@answerkey
% 	\AtBeginDocument{
% 		\newcommand\answers[1]{\textcolor{red}{\textbf{Answer Key:}#1}}
% 	}
% \else
% 	\AtBeginDocument{
% 		\newcommand\answers[1]{}
% 	}
% \fi

%%%%%%%%%% ENCODING AND FONTS %%%%%%%%%%
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[american]{babel}

%%%%%%%%%% PAGE SETUP %%%%%%%%%%
\RequirePackage[top=0.5in, left=0.5in, right=0.5in, bottom=0.75in]{geometry}

%%%%%%%%%% DOUBLE SPACING %%%%%%%%%%
\RequirePackage{setspace}
\doublespacing

\RequirePackage{xparse}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
\RequirePackage{lipsum}
\RequirePackage{mdframed}
\usepackage{xcolor}

%%%%%%%%%% QUOTES %%%%%%%%%%
\RequirePackage{csquotes}
\MakeOuterQuote{"}

%%%%%%%%%% COUNTERS %%%%%%%%%%
\newcounter{mycounter}
\setcounter{mycounter}{0}

%%%%%%%%%% HEADER %%%%%%%%%%
\newcommand{\@checkfield}[3]{%
	\@ifundefined{#1}{%
		\ClassError{Assignment-Format}%
		{#2 is missing}%
		{Add \string#3 to your document preamble.}%
		#3% apply fallback so compilation can continue if user presses 'i' to ignore
	}{}%
}

\newcommand{\course}[1]{\def\@course{#1}}
\newcommand{\duedate}[1]{\def\@duedate{#1}}
\newcommand{\assignmenttitle}[1]{\def\@assignmenttitle{#1}}

\newcommand{\setheader}{%
	\@checkfield{@course}{Course}{\course{course name}}%
	\@checkfield{@duedate}{Due date}{\institution{date}}%
	\@checkfield{@assignmenttitle}{Assignment title}{\instructor{assignment title}}%
	\begin{mdframed}[frametitle=\Large{\@course}\hfill \normalsize{\@author}, linewidth=2pt]
		\textbf{\@assignmenttitle} \hfill Due \@duedate
	\end{mdframed}
}

%%%%%%%%%% ENVIRONMENTS %%%%%%%%%%
\newenvironment{problem}
{
	\stepcounter{mycounter}
	\begin{mdframed}[linewidth=2pt, linecolor=white!75!black, frametitle=Question \themycounter, frametitlebackgroundcolor=white!75!black, backgroundcolor=white!95!black]}
		{\end{mdframed}
}

\newenvironment{answer}
{
	\begin{mdframed}[topline=false,bottomline=false,rightline=false, linewidth=3pt, linecolor=white!75!black]}
		{\end{mdframed}
}

% \RequirePackage{amsmath}
% \newcommand{\infin}{\infty}
% \newcommand{\deriv}{\frac{\mathrm d}{\mathrm dx}}
% \newcommand{\dx}{\ \mathrm dx}
%
% \newcommand{\eq}[1]{
% 	\begin{equation*}
% 		#1
% 	\end{equation*}
% }
%
% \newcommand{\al}[1]{
% 	\begin{align*}
% 		#1
% 	\end{align*}
% }
%
% \newcommand{\li}[1]{
% 	\begin{enumerate}[label=(\alph*)]
% 		#1
% 	\end{enumerate}
% }
