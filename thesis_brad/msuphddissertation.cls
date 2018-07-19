% MSU Ph.D Dissertation class file
% Copyright by Clifford E. Weil and MSU Board of Trustees 2017
% This file must not to alter or distributed.
% New users should download the latest distribution from
% http://www.math.msu.edu/~weil/MSU_Ph.D._Dissertation.zip

% Report bugs to Clifford Weil (weil@math.msu.edu).
% Latest revision August, 2016
% This version handles appendices as required in the Formatting Guide of 2/2016.

% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{msuphddissertation}

% Bring in the regular book class
\LoadClass[12pt,oneside]{book}
	
% Bring in needed packages
\RequirePackage{ifthen}
\RequirePackage{setspace}
\RequirePackage[titles,subfigure]{tocloft}
\RequirePackage{subfig}
%\RequirePackage[margin=1in]{geometry}
\RequirePackage{pdflscape}

\AtBeginDocument{\@ifpackageloaded{hyperref}
{\newcommand{\tocentry}[2]{\addcontentsline{toc}{chapter}{\texorpdfstring{#1}{#2}}}}
{\newcommand{\tocentry}[2]{\addcontentsline{toc}{chapter}{#1}}}}

% Change the definition of \bibname to all Caps.
\renewcommand{\bibname}{BIBLIOGRAPHY}
\newcommand{\bibnamelc}{Bibliography}
\newcommand{\WorksCited}{WORKS CITED}
\newcommand{\LiteratureCited}{LITERATURE CITED}
\newcommand{\References}{REFERENCES}

\ifthenelse{\equal{\bibname}{\WorksCited}}
{\renewcommand{\bibnamelc}{Works Cited}}{\relax}

\ifthenelse{\equal{\bibname}{\LiteratureCited}}
{\renewcommand{\bibnamelc}{Literature Cited}}{\relax}

\ifthenelse{\equal{\bibname}{\References}}
{\renewcommand{\bibnamelc}{References}}{\relax}

\newcommand{\chapname}{Chapter}
\newcommand\covername{Appendix}
\renewcommand{\appendixname}{Appendix}

% Change to double spacing as defined by MS Word
% Redefine the \doublspacing command
\renewcommand{\doublespacing}{%
	\setstretch {1.9}%  default
	\ifcase \@ptsize \relax % 10pt
	\setstretch {1.9}%
	\or % 11pt
	\setstretch {1.9}%
	\or % 12pt
	\setstretch {1.9}%
	\fi
}

% Number all levels of document divisions
\setcounter{secnumdepth}{6}

% Set depth of table of contents
\setcounter{tocdepth}{6}

% Set second level of sub(super) scripts to 10 pt.
% Thanks to Lee Larson for this fix.
\DeclareMathSizes{12}{12}{10}{10}
\DeclareMathSizes{10}{10}{10}{10}
% Set footnote font size to 12pt.

% Define the command \unit 
\newcommand*{\unit}[1]{\def\fromunit{#1}}

%Define the Title Page
\newcommand\maketitlepage
	{\begin{titlepage}%
	\vspace*{0.5in}
	\begin{center}%
	\begin{singlespace}
	\MakeUppercase{\large{\@title}}% DO NOT REMOVE THE FOLLOWING BLANK LINE
	\end{singlespace}
        \begin{doublespace}% DO NOT REMOVE THE FOLLOWING BLANK LINE
           
           By
	      
	\begin{tabular}[t]{c}%
	\@author
	\end{tabular}%
	\end{doublespace}
	\vspace{\fill}
	{%
	A  DISSERTATION 
	\vspace{\baselineskip}%

	Submitted to \\
	Michigan State University \\
	in partial fulfillment of the requirements \\
	for the degree of 
   
	\vspace{\baselineskip}%
	
        Physics - Doctor of Philosophy

        %\fromunit % Inserts unit name and degree type%
  
	\vspace{\baselineskip}%
	{\number\year}  
	} 
	\vspace{\baselineskip}
	\end{center}
\end{titlepage}}%
 
% Define the command \abstractname
 \newcommand{\abstractname}{\textbf{ABSTRACT}}
 
%Define the abstract environment for the dissertation
  \newenvironment{abstract}{%
	\thispagestyle{empty}
	\pagenumbering{roman}
         \begin{center}%
         \large\abstractname\vspace{\baselineskip}
         
          \MakeUppercase{\@title}
        
          \vspace{\baselineskip}
       
          By 
	 \vspace{\baselineskip}
	      
	 \begin{tabular}[t]{c}%
          \@author
          \end{tabular}
          \end{center}
          \vspace*{-.5\baselineskip}
     
         \begin{doublespace}
         \addtocounter{page}{1}
         } 
         {\end{doublespace}\pagestyle{empty}\newpage}

% Define the command \pubabstractname
 \newcommand{\pubabstractname}{\textbf{PUBLIC ABSTRACT}}
 
%Define the pubabstract environment for the dissertation
\newcounter{pubabs}
\newenvironment{pubabstract}{%
	\setcounter{pubabs}{\value{page}}
	\thispagestyle{empty}
	\pagenumbering{roman}
         \begin{center}%
         {\bfseries\pubabstractname}
         
         \vspace{\baselineskip}
         
         \MakeUppercase{\@title}% DO NOT REMOVE THE FOLLOWING BLANK LINE
        
         \vspace{\baselineskip}% DO NOT REMOVE THE FOLLOWING BLANK LINE
       
         By 
	\vspace{\baselineskip}
	      
	\begin{tabular}[t]{c}%
         \@author
         \end{tabular}
         \end{center}
         \vspace*{-.5\baselineskip}
          
     	\begin{doublespace}
	} 
{\end{doublespace}\newpage\setcounter{page}{\value{pubabs}}
	}
   
% Define the Copyright Page
      \newenvironment{copyrt}{%
      \newpage
      \thispagestyle{empty}
      \vspace*{\fill}
      \begin{center}
      \begin{tabular}{l}
      Copyright by\\
      \MakeUppercase{\@author}\\
      \number\year
      \end{tabular}
      \end{center}\vfill}
     {\newpage}
     
% Define the Dedication Page
\newenvironment{dedication}{%
	\newpage
	\thispagestyle{plain}
	\pagestyle{plain}
	\vspace*{\fill}}
	{
\vfill}
             
% Define the Acknowledgement Page
\newcommand{\ackname}{ACKNOWLEDGMENTS}
\newenvironment{acknowledgment}{%
	\newpage
	\thispagestyle{plain}
	\pagestyle{plain}
	\begin{center}
	{\large\bfseries\ackname}
	\vspace{\baselineskip}
	\end{center}
	\begin{doublespace}
	}
	{\end{doublespace}\thispagestyle{plain}
\pagestyle{plain}}
     
% Define the Preface Page
\newcommand{\prefname}{PREFACE}
\newenvironment{preface}{%
     	\newpage
      	\thispagestyle{plain}
      	\pagestyle{plain}
       	\begin{center}
     	{\bfseries\prefname}
    	\vspace{\baselineskip}
     	\end{center}
	\begin{doublespace}
	}
     	{\thispagestyle{plain}
	\end{doublespace}
\pagestyle{plain}}

% Redefine the \@chapter command to put "Chapter" 
% before each chapter entry in the ToC and to put
% "Appendix" before each appendix entry in the ToC.
% Replaced \chaptername by \@chapapp 7-26-12

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
	\refstepcounter{chapter}%
	\vspace*{-3.5\baselineskip}
	\typeout{\@chapapp\space\thechapter.}%
		\ifx\chaptername\chapname
	    	\tocentry{\protect\numberline{\@chapapp\space\thechapter}#1}
		{\@chapapp\space\thechapter #1}%
		\else	
		\ifx\covername\appendixname%						
 		\else%										
			\addcontentsline{toc}{section}%				
    	{{\@chapapp\space\thechapter\space}#1}					
	\fi							 				
				\fi%
		 \else
          \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \else
          \addcontentsline{toc}{chapter}{#1}%
                    \fi
           \chaptermark{#1}%

% Standard practice calls for a little extra space in the LoF and LoT 
% between the last entry in the current chapter and the first entry of 
% the next chapter. To include this extra space, remove the "%" signs 
% in front of the following two lines. 
           %\addtocontents{lof}{\protect\addvspace{10\p@}}%
           %\addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
           \@topnewpage[\@makechapterhead{#2}]%
                   \else
           \@makechapterhead{#2}%
           	\@afterheading
                    \fi}
                    
% Rededefine the table of contents command 
\renewcommand\contentsname{TABLE OF CONTENTS}
\renewcommand\tableofcontents{\begin{singlespace}%
\addtocontents{toc}{\vspace{\normalbaselineskip}}
		\if@twocolumn
	\@restonecoltrue\onecolumn
    		\else
	\@restonecolfalse
    		\fi
          \chapter*{\vspace{-2.5\baselineskip}\centerline{\large \MakeUppercase\contentsname}
	\@mkboth{%
	\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
	\vspace{-\baselineskip}
	\@starttoc{toc}%
    		\if@restonecol\twocolumn\fi
	\end{singlespace}}
  
\newcommand{\TOC}{
	\clearpage
	\pagestyle{plain}
	\tableofcontents
	\clearpage


	\pagestyle{plain}}
\renewcommand{\cftchapleader}{\cftdotfill{\cftsecdotsep}}
	\renewcommand{\cftaftertoctitle}{\vspace{\baselineskip}}
     	\setlength{\cftbeforechapskip}{\baselineskip}
	\renewcommand{\cftchapnumwidth}{6.5em}  
	   
%  Define the \LOT command to augment the \listofftables command
\renewcommand\listoftables{%
		\if@twocolumn
	\@restonecoltrue\onecolumn
		\else
	\@restonecolfalse
		\fi
	\chapter*{\vspace{-1.05in}\centerline{\large \MakeUppercase\listtablename}}
	\tocentry{\textbf{LIST OF TABLES}}{List of Tables}%
	\@mkboth{\MakeUppercase\listtablesname}%
	{\MakeUppercase\listtablename}%
	\vspace*{-1\baselineskip} 
	\@starttoc{lot}%
		\if@restonecol\twocolumn
		\fi
}
	
\newcommand{\LOT}{
	\clearpage
	\setlength\cftbeforetabskip{\baselineskip}
	\listoftables
        \addtocontents{lot}{\vspace{\normalbaselineskip}}	
        \clearpage
	\pagestyle{plain}}
    
	\renewcommand{\cftafterlottitle}{\vspace{\baselineskip}}
	\renewcommand{\cfttabnumwidth}{5em} 
	\setlength{\cfttabindent}{0em}
	\renewcommand{\cfttabpresnum}{Table  }
 	\renewcommand{\cfttabaftersnum}{:}   
        
% Define the \LOF command to augment the \listoffigures command
	\renewcommand\listoffigures{%
		\if@twocolumn
	\@restonecoltrue\onecolumn
		\else
	\@restonecolfalse
		\fi
	\chapter*{\vspace{-1.05in}\centerline{\large \MakeUppercase\listfigurename}}
	\tocentry{\textbf{LIST OF FIGURES}}{List of Figures}%
	 \@mkboth{\MakeUppercase\listfigurename}%
	{\MakeUppercase\listfigurename}%
	\vspace*{-1\baselineskip}  
	\@starttoc{lof}%
		\if@restonecol\twocolumn
		\fi
}

\newcommand{\LOF}{
	\clearpage
	\setlength\cftbeforefigskip{\baselineskip}
	\listoffigures
        \addtocontents{lof}{\vspace{\normalbaselineskip}}	
	\clearpage
	\pagestyle{plain}}

	\renewcommand{\cftafterloftitle}{\vspace{\baselineskip}}
	\renewcommand{\cftfignumwidth}{5.5em} 
	\setlength{\cftfigindent}{0em}
	\renewcommand{\cftfigpresnum}{Figure  }
	\renewcommand{\cftfigaftersnum}{:\ }      
	        
% Define the KEY TO SYMBOLS
\newenvironment{symbols}{%
	\clearpage
	\thispagestyle{plain}\pagestyle{plain}
	\phantomsection
	\begin{center}
	\bfseries{\MakeUppercase{\large KEY TO SYMBOLS}}
	\end{center}
	\tocentry{KEY TO SYMBOLS}{Key To Symbols}%
	\vspace*{\baselineskip}}
{\newpage}

% Define the KEY TO ABBREVIATIONS
\newenvironment{abbrev}{%
	\clearpage
	\thispagestyle{plain}\pagestyle{plain}
	\phantomsection
	\begin{center}
	\bfseries{\MakeUppercase{\large KEY TO ABBREVIATIONS}}
	\end{center}
	\tocentry{KEY TO ABBREVIATIONS}{Key To Abbreviations}%
	\vspace*{\baselineskip}}
{\newpage}

% Single space quotation environments.
\renewenvironment{quotation}
	{\begin{singlespace}\list{}{\listparindent 1.5em%
	\itemindent    \listparindent
	\rightmargin   \leftmargin
	\parsep  \z@ \@plus\p@}%
	\item\relax}
{\endlist\end{singlespace}}
\renewenvironment{quote}
	{\begin{singlespace}\list{}{\rightmargin\leftmargin}%
	\item\relax}
{\endlist\end{singlespace}}    
               
% Redefine the \appendix command 
% to be used for a single appendix.
\renewcommand\appendix{\par
	\clearpage\thispagestyle{plain}\vspace*{\fill}
	\begin{center}
	\large{\textbf{APPENDIX}}
	\vspace{\baselineskip}%
	\end{center}
	\tocentry{APPENDIX}{Appendix}%
	\vfill
	\newpage
	\setcounter{chapter}{0}%
 	\setcounter{section}{0}%
	\renewcommand{\chaptername}{\appendixname}
 	\gdef\chaptername{\appendixname}%
 	\gdef\thechapter{\c@chapter\alpha}
	%\gdef\thechapter{\@Alph\c@chapter}
	\clearpage
}

% Define the command \appendices to be used 
% for 2 or more appendices.
\newcommand\appendices{\par
	\renewcommand{\covername}{Appendices}
	\clearpage\thispagestyle{plain}\vspace*{\fill}
	\begin{center}
	\large{\textbf{APPENDICES}}
	\vspace{\baselineskip}%
	\end{center}
	\tocentry{APPENDICES}{Appendices}%
	\vfill
	\newpage
	\setcounter{chapter}{0}%
 	\setcounter{section}{0}%
 	\gdef\chaptername{\appendixname}%
 	\gdef\thechapter{\@Alph\c@chapter}
  	\clearpage
}
     
% Single space the bibliography.
% To eliminate cover page number in ToC entry and replace with the actual first Bibliography page number, delete the eighth line down and remove the "%" signs in front of five lines further down.
\renewenvironment{thebibliography}[1]
	{\clearpage\thispagestyle{plain}
	\vspace*{\fill}
	\begin{center}
	\large\textbf{\MakeUppercase{\bibname}}
	\vspace{\baselineskip}% 
	\end{center}
	\tocentry{\bibname}{\bibnamelc}% Delete this line to remove cover page from ToC,
	\vfill
	\newpage
	\chapter*{\vspace{-2.65\baselineskip}\centerline{\large\MakeUppercase{\bibname}}}%
	\@mkboth{\bibname}{\bibname}%
	%\tocentry{\bibname}{\bibnamelc}%Include this line to move ToC entry.
	\begin{singlespace}
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
	\leftmargin\labelwidth
	\advance\leftmargin\labelsep
	\@openbib@code
	\usecounter{enumiv}%
	\let\p@enumiv\@empty
	\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\setlength{\itemsep}{.2in}
	\sloppy
      	\clubpenalty4000
      	\@clubpenalty \clubpenalty
      	\widowpenalty4000%
      	\sfcode`\.\@m}
      	{\def\@noitemerr
       	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist
	\end{singlespace}}
     
% Properly locates page number for landscape
\let\LS@makecol=\@makecol
\let\LS@makefcolumn=\@makefcolumn
\def\LS@rot{%
	\setbox\@outputbox\vbox{\hbox{\rotatebox{90}%
	{\makebox[-4.5in][l]{\raisebox{-.4in}{\the\value{page}}}\box\@outputbox}}}}

% Set the starting page style
\pagestyle{empty} 
 
