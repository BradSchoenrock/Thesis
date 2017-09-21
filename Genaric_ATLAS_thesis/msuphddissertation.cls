% MSU Ph.D Dissertation class file
% Copyright by Clifford E. Weil and MSU Board of Trustees 2010
% This file must not to alter or distributed.
% New users should download the latest distribution from
% http://www.math.msu.edu/~weil/MSU_Ph.D._Dissertation.zip

% Report bugs to Clifford Weil (weil@math.msu.edu).
% Latest revision 9/12/2012 
% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{msuphddissertation}

% Bring in the regular book class
\LoadClass[12pt,oneside]{book}

% Bring in needed packages
\RequirePackage{ifthen}
\RequirePackage{setspace}
\RequirePackage[titles,subfigure]{tocloft}
%\RequirePackage{subfig}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{pdflscape}
\RequirePackage{fancyhdr}
\RequirePackage{rotating}

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

% Set footnote font size to 12pt.
\renewcommand{\footnotesize}{\normalsize}

% Define the command \unit 
\newcommand*{\munit}[1]{\def\fromunit{#1}}

%Define the Title Page
\newcommand\maketitlepage{\begin{titlepage}%
    \vspace*{.55in}
          \begin{center}%
          \begin{singlespace}
          \MakeUppercase{\@title}%
           \end{singlespace}
           \begin{doublespace}
           
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
   
	\vspace{\baselineskip}
   	Physics - Doctor of Philosophy
	
	\vspace{\baselineskip}%
     \fromunit % Inserts unit name%
  
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
         \bfseries \abstractname\vspace{\baselineskip}
         
        \MakeUppercase{\@title}
        
       \vspace{\baselineskip}
       
      By 
	  \vspace{\baselineskip}
	      
	       \begin{tabular}[t]{c}%
     \@author
      \end{tabular}
     \end{center}
     
      \begin{doublespace}
     \addtocounter{page}{1}
     } 
     {\end{doublespace}\pagestyle{empty}\newpage}
  
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
  \newcommand{\dedname}{DEDICATION}
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
     {\bfseries\ackname}
     \vspace{\baselineskip}
     \end{center}
     \begin{doublespace}
      }
     { \end{doublespace}\thispagestyle{plain}
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
      		\pagestyle{plain}
}

% Redefine the \chapter command to put "Chapter" 
% before each chapter entry in the ToC and to put
% "Appendix" before each appendix entry in the ToC.
% Move up to top of page.
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \vspace*{-4\baselineskip}
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}
                         %%Replaced \chaptername by \@chapapp 7-26-12
                                   {\protect\numberline{\@chapapp\space\thechapter} #1}%
                   	\else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}

% Rededefine the table of contents command 
\renewcommand\contentsname{Table of Contents}
 \renewcommand\tableofcontents{\begin{singlespace}%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\vspace{-2.5\baselineskip}\centerline{\large \MakeUppercase\contentsname}
        \@mkboth{%
          \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
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
	\renewcommand{\cftchapnumwidth}{6em}  
	    
%  Define the \LOT command to augment the \listofftables command
\renewcommand\listtablename{LIST OF TABLES}
 \renewcommand\listoftables{%
       \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
   \chapter*{\vspace{-2.5\baselineskip}\centerline{\large \MakeUppercase
   \listtablename}} 
   \addcontentsline{toc}{chapter}{\textbf{LIST OF TABLES}}%
      \@mkboth{\MakeUppercase\listtablesname}%
              {\MakeUppercase\listtablename}%
   \begin{singlespace} 
   \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    \end{singlespace}
    }

\newcommand{\LOT}{
\clearpage
\listoftables
\clearpage
\pagestyle{plain}}
    
	\renewcommand{\cftafterlottitle}{\vspace{\baselineskip}}
	\renewcommand{\cfttabnumwidth}{6em}  
	\renewcommand{\cfttabpresnum}{Table }     
        
% Define the \LOF command to augment the \listoffigures command
\renewcommand\listfigurename{LIST OF FIGURES}
 \renewcommand\listoffigures{%
       \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
   \chapter*{\vspace{-2.5\baselineskip}\centerline{\large \MakeUppercase\listfigurename}} 
   \addcontentsline{toc}{chapter}{\textbf{LIST OF FIGURES}}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
   \begin{singlespace} 
   \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    \end{singlespace}
    }

\newcommand{\LOF}{
\clearpage
 \listoffigures
\clearpage
\pagestyle{plain}}

	\renewcommand{\cftafterloftitle}{\vspace{\baselineskip}}
	\renewcommand{\cftfignumwidth}{6em}  
	\renewcommand{\cftfigpresnum}{Figure }     
	        
% Define the Abbreviations Page
	\newcommand{\keyname}{\large KEY TO SYMBOLS AND ABBREVIATIONS}
	\newenvironment{abbreviationskey}{%
	\addcontentsline{toc}{chapter}
		{\textbf{Key to Symbols and Abbreviations}\textmd{\leaders\hbox to 1em{\hss.\hss}\hfill}
		\thispagestyle{plain}\pagestyle{plain}}
	\begin{center}
	{\bfseries\keyname}
	\end{center}
	\vspace*{2\baselineskip}
        }{\newpage}
                       
%Refedine figure environment to double space List of Figures.
      \renewenvironment{figure}
      {
      \@float{figure}}%
      {\addtocontents{lof}{\protect\addvspace{1.2\baselineskip}}\end@float}
      
%Refedine table environment to double space List of Tables.
      \renewenvironment{table}
      {
      \@float{table}}%
      {\addtocontents{lot}{\protect\addvspace{1.2\baselineskip}}\end@float}

% Single space quotation environments.
\renewenvironment{quotation}
               {\begin{singlespace}\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist\end{singlespace}}
\renewenvironment{quote}
               {\begin{singlespace}\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist\end{singlespace}}    
               
% Redefine the \appendix command to replace "Chapter"
% by "Appendix" for appendices in the ToC 
\newcommand{\appname}{APPENDICES}
\renewcommand\appendix{\par
\clearpage\vspace*{\fill}
\addcontentsline{toc}{chapter}{\textbf{\appname}\textmd{\leaders\hbox to 1em{\hss.\hss}\hfill}}    
\begin{center}
\Huge{\textbf{\appname}}
\end{center}
\vfill
\newpage
%%  The next three lines added 8-2-12
            
%\thispagestyle{myheadings}
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}
   \clearpage
 }
     
% Single space the bibliography
\renewenvironment{thebibliography}[1]
      {    \clearpage
          \vspace*{\fill}
          \addcontentsline{toc}{chapter}{\textbf{\bibname}\textmd{\leaders\hbox to 1em{\hss.\hss}\hfill}
         \vspace{\baselineskip}}%
          \begin{center}
          \Huge \textbf{\MakeUppercase{\bibname}}
          \end{center}
          \vfill
          \newpage
      \chapter*{\vspace{-2.2\baselineskip}\centerline{\MakeUppercase{\bibname}}}%
          \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%

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
     \endlist\end{singlespace}}

% Define the msulandscape environment.
\let\LS@makecol=\@makecol
\let\LS@makefcolumn=\@makefcolumn
\def\LS@rot{%
	\setbox\@outputbox\vbox{\hbox{\rotatebox{90}%
	{\makebox[-4.5in][l]{\raisebox{-.4in}{\the\value{page}}}\box\@outputbox}}}}
\def\msulandscape{%
	\clearpage
	\thispagestyle{empty}
	\begingroup
	\vsize=\textwidth
	\hsize=\textheight
	\linewidth=\hsize
	\columnwidth=\hsize
	\@colroom=\vsize
	\textheight=\vsize
	\@colht=\vsize
	\def\@makecol{\LS@makecol\LS@rot}%
	\def\@makefcolumn##1{\LS@makefcolumn{##1}\LS@rot}}
\def\endmsulandscape{%
	\ifGin@pdftex
	\pdfpageattr{/Rotate 90}
	\fi
	\clearpage
	 \endgroup
	\global\@colht=\textheight
	\global\vsize=\textheight
	\global\@colroom=\textheight}
	
% Define the lscapenum environment.
\newenvironment{lscapenum}{
 \clearpage\thispagestyle{empty}
  \begin{landscape}
   \pagestyle{fancy}
   \fancyhead{} % clear all header fields
   \fancyfoot{} % clear all footer fields
   \renewcommand{\headrulewidth}{0pt}
   \rfoot{
      \setlength{\unitlength}{\textheight}
     \begin{picture}(0,0)
         \put(.077,0.78){\begin{sideways}\thepage\end{sideways}}
     \end{picture}
   }
}
{
 \end{landscape}
 \pagestyle{plain}
}
    
% Set the starting page style
\pagestyle{empty} 
 
