\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{solis}[2023/03/09 v1.0 The Solis Project]
\LoadClass[twoside,11pt]{article}

\renewcommand{\author}[1]{\gdef\solis@author{#1}}
\renewcommand{\title}[1]{\gdef\solis@title{#1}}
\newcommand{\subtitle}[1]{\gdef\solis@subtitle{#1}}
\newcommand{\controlnumber}[1]{\gdef\solis@controlnumber{#1}}
\newcommand{\context}[1]{\gdef\solis@context{#1}}
\newcommand{\releasedate}[1]{\gdef\solis@releasedate{#1}}
\newcommand{\doctype}[1]{\gdef\solis@doctype{#1}}
\newcommand{\docclass}[1]{\gdef\solis@docclass{#1}}
\newcommand{\docstatus}[1]{\gdef\solis@docstatus{#1}}
\newcommand{\branch}[1]{\gdef\solis@branch{#1}}
\newcommand{\address}[1]{\gdef\solis@address{#1}}
\newcommand{\email}[1]{\gdef\solis@email{#1}}
\newcommand{\contact}[1]{\gdef\solis@contact{#1}}
\renewcommand{\date}{%
  \ClassError{solis}{Use `\\releasedate' command instead}}

\gdef\solis@slogan{There can be no peace without freedom}

\providecommand{\hairsp}{\hspace{1pt}}
\providecommand{\ie}{\textit{i.\nobreak\hairsp{}e.}}
\providecommand{\eg}{\textit{e.\nobreak\hairsp{}g.}}

\RequirePackage{calc}
\RequirePackage{xifthen}
\RequirePackage{xstring}

\RequirePackage{fontspec}
\setsansfont{Figtree}[%
  Extension = .ttf,
  Path = ./fonts/,
  FontFace = {l}{n}{*-Light},
  FontFace = {l}{it}{*-LightItalic},
  FontFace = {sl}{n}{*-Medium},
  FontFace = {sl}{it}{*-MediumItalic},
  UprightFont = *-Regular,
  ItalicFont = *-Italic,
  BoldFont = *-SemiBold,
  BoldItalicFont = *-SemiBoldItalic,
  FontFace = {k}{n}{*-Bold},
  FontFace = {k}{it}{*-BoldItalic},
  FontFace = {eb}{n}{*-ExtraBold},
  FontFace = {eb}{it}{*-ExtraBoldItalic},
  FontFace = {ub}{n}{*-Black},
  FontFace = {ub}{it}{*-BlackItalic}]
\newcommand{\textbbf}[1]{{\fontseries{k}\selectfont{}#1}}
\renewcommand{\familydefault}{\sfdefault}

\RequirePackage{luacolor}
\definecolor{foreground}{RGB}{255,173,0}
\definecolor{links}{RGB}{255,108,0}

\def\@mpwidth{4.5cm}
\def\@mpsep{0.75cm}
\def\@tcwidth{10.75cm}
\def\@hmargin{2.5cm}
\def\@twwidth{16cm}
\RequirePackage[%
  a4paper,
  includeall,
  hmargin = \@hmargin,
  vmargin = 0cm,
  head = 2cm,
  headsep = 1.5cm,
  foot = 2cm,
  marginpar = \@mpwidth,
  marginparsep = \@mpsep]{geometry}

\RequirePackage[%
  bookmarks = true,
  bookmarksnumbered = true,
  bookmarksopen = true,
  unicode = true,
  colorlinks = true,
  linktoc = all,
  linkcolor = links,
  citecolor = links,
  filecolor = links,
  urlcolor = links,
  pdfstartview = FitH,
  pdfencoding = auto]{hyperref}
\PassOptionsToPackage{hyphens}{url}

\RequirePackage[nocheck]{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[english]{babel}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{sidenotes}
\RequirePackage[absolute]{textpos}
\RequirePackage[scale=2.75]{ccicons}

\RequirePackage[nottoc,numbib]{tocbibind}
\setcounter{tocdepth}{4}

\RequirePackage{csquotes}
\RequirePackage[%
  backend  = biber,
  natbib = true,
  hyperref = true,
  style = authoryear-comp]{biblatex}
\RequirePackage[titletoc,title,header]{appendix}

\newenvironment{pagelayout}[1][fullwidth]
  {\ifthenelse{\equal{wide}{#1}}
    {\newgeometry{%
      includeall,
      hmargin = 2.5cm,
      vmargin = 0cm,
      head = 3cm,
      headsep = 0.75cm,
      foot = 2cm,
      marginpar = 0cm,
      marginparsep = 0cm,}}
    {\newgeometry{%
      hmargin = 0cm,
      vmargin = 0cm,
      marginpar = 0cm,
      marginparsep = 0cm}}}
  {\restoregeometry}

\fancypagestyle{empty}{%
  \fancyhf{}
  \fancyheadoffset[LE,RO]{\marginparsep+\marginparwidth}
  \fancyfootoffset[LE,RO]{\marginparsep+\marginparwidth}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}

\fancypagestyle{plain}[empty]{%
  \fancyfoot[RO]{%
    \makebox[\@twwidth][r]{%
       \makebox[\@mpsep][c]{\color{foreground}\rule[-3mm]{2pt}{\footskip-2mm}}
       \makebox(\@mpwidth,\footskip-5mm)[lt]{\textbf{at page~\thepage~out of~\pageref{LastPage}}}}}
  \fancyfoot[LE]{%
    \makebox[\@twwidth][l]{%
       \makebox(\@mpwidth,\footskip-5mm)[rt]{\textbf{at page~\thepage~out of~\pageref{LastPage}}}
       \makebox[\@mpsep][c]{\color{foreground}\rule[-3mm]{2pt}{\footskip-2mm}}}}}

\fancypagestyle{text}[plain]{%
  \fancyhead[RO]{%
    \makebox[\@twwidth][r]{%
      \makebox[\@tcwidth][r]{\Large\textbf{\@markshort}}
      \makebox[\@mpsep][c]{\color{foreground}\rule{2pt}{\headheight+5mm}}
      \makebox(\@mpwidth,\headheight+5mm)[lb]{\Large\textbf{\thesection}}}}
  \fancyhead[LE]{%
    \makebox[\@twwidth][l]{%
      \makebox(\@mpwidth,\headheight+5mm)[rb]{\Large\textbf{\thesection}}
      \makebox[\@mpsep][c]{\color{foreground}\rule{2pt}{\headheight+5mm}}
      \makebox[\@tcwidth][l]{\Large\textbf{\@markshort}}}}}

\fancypagestyle{section}[plain]{%
  \fancyhead[RO]{%
    \makebox[\@twwidth][r]{%
      \makebox[\@tcwidth][r]{\fontsize{0.8cm}{0.8cm}\selectfont\textbf{\@marktitle}}
      \makebox[\@mpsep][c]{\color{foreground}\rule{2pt}{\headheight+15mm}}
      \makebox(\@mpwidth,\headheight+15mm)[lb]{\fontsize{2.75cm}{2.75cm}\selectfont\textbf{\color{foreground}\thesection}}}}
  \fancyhead[LE]{%
    \makebox[\@twwidth][l]{%
      \makebox(\@mpwidth,\headheight+15mm)[rb]{\fontsize{2.75cm}{2.75cm}\selectfont\textbf{\color{foreground}\thesection}}
      \makebox[\@mpsep][c]{\color{foreground}\rule{2pt}{\headheight+15mm}}
      \makebox[\@tcwidth][l]{\fontsize{0.8cm}{0.8cm}\selectfont\textbf{\@marktitle}}}}}

\fancypagestyle{widesection}[plain]{%
  \fancyhead[C]{%
    \makebox[\@twwidth][c]{%
      \fontsize{1.5cm}{1.5cm}\selectfont\textbf{\@marktitle}}}}

\newcommand{\blankpage}{%
  \clearpage
  \begingroup
  \pagestyle{empty}
  \cleardoublepage
  \endgroup}

\renewcommand{\thefootnote}{\textbbf{\roman{footnote}}}
  
\newfloat{@wt}{h!}{widetext}
\newenvironment{widetext}
  {\vspace*{2mm+\parskip}\leavevmode\par\@wt
    \ifthenelse{\isodd{\thepage}}
      {\hspace*{-\parindent}}
      {\hspace*{-\marginparsep-\marginparwidth-\parindent}}
    \minipage[t]{\@twwidth}}
  {\endminipage\end@wt\vspace*{2mm+\parskip}\leavevmode\newline}

\newenvironment{beware}[1][Beware]
  {\vspace*{2mm+\parskip}\leavevmode\par\noindent
    \textcolor{foreground}{\vrule \@width 1mm\relax}
    \hspace*{2mm}\minipage[t]{\textwidth-3mm}
    \noindent\colorbox{foreground}{\fontseries{ub}\selectfont{}#1 :\hspace{3mm}}}
  {\endminipage\vspace*{2mm+\parskip}\leavevmode\newline}

\renewcommand{\part}[1]{%
  \clearpage
  \refstepcounter{part}
  \phantomsection
  \addcontentsline{toc}{part}{\textcolor{black}{\fontseries{k}\selectfont\partname~\protect\numberline{\thepart}\colorbox{foreground}{#1}}}
  \begin{pagelayout}[wide]
    \thispagestyle{plain}
    \vspace*{0.2\pageheight}
    \centering
    \par\fontsize{1.5cm}{1.5cm}\selectfont\textbbf{\partname~\thepart}\\
    \vspace*{1.5mm}
    \par\colorbox{foreground}{\fontsize{1cm}{1cm}\selectfont\textbf{#1}}
  \end{pagelayout}
  \newpage}

\let\oldsectionmark\sectionmark
\renewcommand{\sectionmark}[2]{%
  \oldsectionmark{#2}
  \gdef\@marktitle{#2}
  \ifthenelse{\equal{#1}{\null}}
    {\gdef\@markshort{#2}}
    {\gdef\@markshort{#1}}}

\renewcommand{\section}[2][\null]{%
  \IfStrEq{\@currenvir}{appendices}
    {\@startsection{section}{1}{0em}
      {-3.25ex\@plus -1ex \@minus -0.2ex}
      {1.5ex \@plus 0.2ex}
      {\fontseries{k}\fontsize{0.75cm}{0.75cm}\selectfont}
      [#2]{#2}
      \vspace*{5mm}}
    {\clearpage
      \vspace*{1cm}
      \par\refstepcounter{section}
      \sectionmark{#1}{#2}
      \phantomsection
      \addcontentsline{toc}{section}{\fontseries{k}\selectfont\protect\numberline{\thesection}\textcolor{black}{\@markshort}}
      \thispagestyle{section}
      \leavevmode\newline}}

\renewcommand{\subsection}{%
  \@startsection{subsection}{2}{0em}
    {-3.25ex\@plus -1ex \@minus -0.2ex}
    {1.5ex \@plus 0.2ex}
    {\fontseries{k}\selectfont\Large}}

\renewcommand{\subsubsection}{%
  \@startsection{subsubsection}{3}{0em}
    {-3.25ex\@plus -1ex \@minus -0.2ex}
    {1.5ex \@plus 0.2ex}
    {\fontseries{b}\selectfont\large}}

\renewcommand{\paragraph}[1]{%
  \vspace*{0.25cm}
  \par\refstepcounter{paragraph}
  \paragraphmark{#1}
  \phantomsection
  \IfEndWith{\thesubsubsection}{.0}
    {\IfEndWith{\thesubsection}{.0}%
      {\addcontentsline{toc}{subsection}{#1}}
      {\addcontentsline{toc}{subsubsection}{#1}}}
    {\addcontentsline{toc}{paragraph}{#1}}
  \noindent\textbf{#1}\hspace{0.15cm}}

\renewcommand{\subparagraph}{%
  \ClassError{solis}{This section is not implemented}}
\renewenvironment{titlepage}
  {\ClassError{solis}{Title page cannot be overwritten}}
  {\null}
\renewcommand{\abstract}{%
  \ClassError{solis}{Use `abstract' environment instead}}
\renewcommand{\thanks}{%
  \ClassError{solis}{Use `acknowledgement' environment instead}}
\renewcommand{\tableofcontents}{%
  \ClassError{solis}{Use `\\maketoc' command instead}}
\renewcommand{\listoffigures}{%
  \ClassError{solis}{This section is not implemented}}
\renewcommand{\listoftables}{%
  \ClassError{solis}{This section is not implemented}}
\renewenvironment{thebibliography}
  {\ClassError{solis}{Use `\\makebib' command instead}}
  {\null}
\renewenvironment{theindex}
  {\ClassError{solis}{This section is not implemented}}
  {\null}
\renewcommand{\appendix}{%
  \ClassError{solis}{Use `appendices' environment instead}}

\newcommand{\frontmatter}{\pagestyle{plain}}
\newcommand{\mainmatter}{\pagestyle{text}}
\newcommand{\backmatter}{\clearpage\pagestyle{plain}}

\newcommand{\keyword}[1]{%
  \ifthenelse{\isundefined{\solis@keywords}}
    {\gdef\solis@keywords{#1}}
    {\expandafter\gdef\expandafter\solis@keywords\expandafter{\solis@keywords, #1}}}
\@onlypreamble\keyword

\newsavebox{\@absbox}
\renewenvironment{abstract}
  {\gdef\solis@abstract{\null}\lrbox\@absbox\large\fontfamily{\familydefault}\selectfont}
  {\endlrbox}
  
\newsavebox{\@ackbox}
\newenvironment{acknowledgement}
  {\gdef\solis@acknowledgement{\null}\lrbox\@ackbox\large\fontfamily{\familydefault}\selectfont}
  {\endlrbox}

\newcommand{\maketoc}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{section}{\textcolor{black}{\fontseries{k}\selectfont\contentsname}}
  \begin{pagelayout}[wide]
    \sectionmark{\null}{\contentsname}
    \thispagestyle{widesection}
    \@starttoc{toc}
    \pagestyle{plain}
  \end{pagelayout}}

\newcommand{\makeabstract}{%
  \ifthenelse{\isundefined{\solis@abstract}}{}{%
    \clearpage
    \begin{pagelayout}[wide]
      \pagestyle{plain}
      \noindent\Large\textbbf{\colorbox{foreground}{Abstract}}
      \vspace*{2.5mm}\\
      \large\unhcopy\@absbox\relax
      \ifthenelse{\isundefined{\solis@keywords}}{}{%
        \vspace*{1.25mm}\\
        \noindent\textbf{Keywords: }\solis@keywords{}.}
    \end{pagelayout}}}

\newcommand{\@startchangelog}{%
  \InputIfFileExists{solis.changelog}
    {\typeout{solis: changelog...}}
    {\ClassError{solis}{Cannot create changelog}}
   \newwrite\@clfile\relax
   \immediate\openout\@clfile=solis.changelog\relax}

\newcommand{\addhistory}[4]{\@nodocument
   \immediate\write\@clfile{#1 & #2 & #3 & #4\\ [1mm]}}

\newcommand{\makehistory}{%
  \clearpage
  \begingroup
  \renewcommand{\arraystretch}{1.5}
  \setlength{\tabcolsep}{0pt}
  \begin{pagelayout}[wide]
    \pagestyle{plain}
    \noindent\Large\textbbf{\colorbox{foreground}{Edit History}}
    \vspace*{2.5mm}\\
    \large\input{static/history}\\
    \vspace*{0.25cm}\\
    \begin{tabular}{p{3cm}p{2.25cm}p{4cm}p{6.75cm}}
      \textbbf{\textcolor{links}{DATE}} & \textbbf{\textcolor{links}{V.}} & \textbbf{\textcolor{links}{EDITOR}} & \textbbf{\textcolor{links}{CHANGES}}\\
      \hline
      \@startchangelog
    \end{tabular}
  \end{pagelayout}
  \endgroup}

\newcommand{\makebackcover}{%
  \clearpage
  \begin{pagelayout}[wide]
    \pagestyle{plain}
    \noindent\Large\textbbf{\colorbox{foreground}{Declaration}}
    \vspace*{2.5mm}\\
    \large\input{static/declaration}
    \ifthenelse{\isundefined{\solis@acknowledgement}}{}{%
      \vspace{\fill}\\
      \noindent\Large\textbbf{\colorbox{foreground}{Acknowledgement}}
      \vspace*{2.5mm}\\
      \large\unhcopy\@ackbox\relax}
    \vspace{\fill}\\
    \noindent\Large\textbbf{\colorbox{foreground}{Copyright}}
    \vspace*{2.5mm}\\
    \large\input{static/copyright}
    \vspace*{2cm}
  \end{pagelayout}}

\newcommand{\covername}{Cover}
\newcommand{\makecover}{%
  \phantomsection
  \addcontentsline{toc}{section}{\textcolor{black}{\fontseries{k}\selectfont\covername}}
  \begin{pagelayout}
    \thispagestyle{empty}
    \noindent\newline\centering
     % organization background
    \begin{textblock*}{\paperwidth}(0cm,0cm)
      \includegraphics[width=\paperwidth,height=\paperheight]{images/background}
    \end{textblock*}
    % organization slogan
    \begin{textblock*}{4.75cm}(2cm,10cm)
      \colorbox{foreground}{\parbox{4.75cm}{\raggedleft\noindent\large\textbf{\solis@slogan}}}
    \end{textblock*}
    % organization information
    \begin{textblock*}{4.75cm}[0,1](2cm,\paperheight-2cm)
      \raggedright\noindent\large
      \textbbf{\ifthenelse{\isundefined{\solis@branch}}
        {Main Branch}
        {\solis@branch}}\\
      \ifthenelse{\isundefined{\solis@address}}{}{\solis@address}\\
      \vspace*{2.5mm}
      \textbf{%
        \ifthenelse{\isundefined{\solis@email}}{}{\url{\solis@email}}\\
        \ifthenelse{\isundefined{\solis@contact}}{}{\large{\solis@contact}}}
    \end{textblock*}
    % title and subtitle
    \begin{textblock*}{11cm}(8cm,5.5cm)
      \colorbox{foreground}{\parbox{11cm}{%
        \raggedright\noindent\fontsize{1cm}{1cm}\selectfont\textbbf{\solis@title}}}\\
      \vspace*{2.5mm}\raggedright\noindent%
      \fontsize{0.75cm}{0.75cm}\selectfont\textbf{%
        \ifthenelse{\isundefined{\solis@subtitle}}{}{\solis@subtitle}}
    \end{textblock*}
    % document information
    \begin{textblock*}{11cm}[0,1](8cm,22cm)
      \raggedright\noindent\Large
      \colorbox{foreground}{\textbbf{Control Number}}\\
      \solis@controlnumber\\
      \vspace*{2.5mm}
      \colorbox{foreground}{\textbbf{Context}}\\
      \solis@context\\
      \vspace*{2.5mm}
      \colorbox{foreground}{\textbbf{Author}}\\
      \solis@author\\
      \vspace*{2.5mm}
      \colorbox{foreground}{\textbbf{Release Date}}\\
      \solis@releasedate\\
      \vspace*{2.5mm}
      \colorbox{foreground}{\textbbf{Document Type}}\\
      \solis@doctype\\
      \vspace*{2.5mm}
      \colorbox{foreground}{\textbbf{Document Classification}}\\
      \solis@docclass\\
      \vspace*{2.5mm}
      \colorbox{foreground}{\textbbf{Document Status}}\\
      \solis@docstatus
    \end{textblock*}
  \end{pagelayout}}

\renewcommand{\maketitle}{%
  \makecover
  \makebackcover
  \makehistory
  \makeabstract
  \maketoc}

\newcommand{\makebib}{%
  \newpage
  \phantomsection
  \addcontentsline{toc}{section}{\textcolor{black}{\fontseries{k}\selectfont\bibname}}
  \begin{pagelayout}[wide]
    \sectionmark{\null}{\bibname}
    \thispagestyle{widesection}
    \printbibliography[heading=none]
    \pagestyle{plain}
  \end{pagelayout}}

\let\oldappendices\appendices
\let\oldendappendices\endappendices
\renewenvironment{appendices}
  {\clearpage
    \phantomsection
    \addcontentsline{toc}{section}{\textcolor{black}{\fontseries{k}\selectfont\appendixtocname}}
    \begin{pagelayout}[wide]
      \sectionmark{\null}{\appendixtocname}
      \thispagestyle{widesection}
      \pagestyle{plain}
      \oldappendices
      \def\@currenvir{appendices}
      \leavevmode\newline}
  {\oldendappendices
    \def\@currenvir{pagelayout}
    \end{pagelayout}}

\AddToHook{enddocument}[solis:lastpage]{%
  \begin{pagelayout}
    \thispagestyle{empty}
    \noindent\newline\centering
    \begin{textblock*}{\paperwidth}(0cm,0cm)
      \includegraphics[width=\paperwidth,height=\paperheight]{images/lastpage}
    \end{textblock*}
    \begin{textblock*}{0.75\paperwidth}[0.5,0.5](0.5\paperwidth,0.5\paperheight)
      \large\textcolor{white}{\textbf{\solis@slogan}}
    \end{textblock*}
  \end{pagelayout}}
