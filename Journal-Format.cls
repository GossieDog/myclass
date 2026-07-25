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
\RequirePackage{mdframed}

%%%%%%%%%% FANCY BOX %%%%%%%%%%
\RequirePackage{pgfornament-han}
\definecolor{red}{RGB}{158,25,22}

%%%%%%%%%% HEADERS AND FOOTERS %%%%%%%%%%
\RequirePackage{fancyhdr}
\fancyhf{}
\renewcommand{\headrule}{}
\fancyhead[C]{\pgfornamenthan[scale=0.2,color=red]{60}}
\fancyfoot[C]{\thepage}

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

%%%%%%%%%% GENERAL INFORMATION %%%%%%%%%%
