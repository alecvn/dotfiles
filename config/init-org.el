;; Slide shows
;; https://github.com/takaxp/org-tree-slied

;; GNU stow
;; http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
;; https://alexpearce.me/2016/02/managing-dotfiles-with-stow/

;; Davi's config
;; https://raw.githubusercontent.com/daviwil/dotfiles/master/Emacs.org

(setq org-log-done 'time)
(setq org-todo-keywords
      '((sequence "OPEN(o)" "TODO(t)" "|" "CLOSED(c)" "DONE(d)")))

(defun start-my-timer ()
  (interactive)
  (setq mytimer (run-with-timer 0 3000 'counsel-projectile-org-capture)))

(defun cancel-my-timer ()
  (interactive)
  (when (boundp 'mytimer)
    (cancel-timer mytimer)
    (setq mytimer nil)))

(defun avn/org-mode-setup ()
  (org-indent-mode))

(defun avn/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•")))))))

(use-package org-rich-yank
  :ensure t
  :demand t)

(use-package org
  :hook (org-mode . avn/org-mode-setup)
  :init
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c t") 'start-my-timer)
  (global-set-key (kbd "C-c s") 'cancel-my-timer)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (setq org-agenda-clockreport-parameter-plist
	(quote (:link t :maxlevel 7 :fileskip0 t :compact t :narrow 80 :formula %)))
  (setq org-duration-format (quote h:mm))
  (setq org-export-coding-system 'utf-8)
  (setq org-return-follows-link t)
  (setq org-agenda-files (directory-files-recursively "~/org/" "\\.org$"))
  :config
  (avn/org-font-setup)
  (setq org-ellipsis " ▾")
  (setq org-src-fontify-natively t)
  ;; (setq org-refile-targets
  ;; 	'((org-agenda-files . (:maxlevel . 3))))
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
  				   (org-agenda-files :maxlevel . 9))))
  :bind (:map org-mode-map
	      ("C-S-l" . org-shiftright)
	      ("C-S-j" . org-shiftleft)
	      ("C-M-y" . org-rich-yank)
	      ))


(use-package org-bullets
  :ensure t
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("𒄭" "𒄮" "𒄯" "𒄰" "𒄱" "𒄲" "𒄳" "𒄴" "𒄵" "𒄶")))

(defun avn/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :ensure t
  :hook (org-mode . avn/org-mode-visual-fill))


  ;; Look into this later:
  ;; (add-hook 'org-mode-hook (lambda ()
  ;; 			     (defadvice org-clock-in (after org-clock-in-after activate)
  ;; 			       (cancel-my-timer)
  ;; 			       (start-my-timer))
  ;; 			     (defadvice org-clock-out (after org-clock-out-after activate)
;; 			       (cancel-my-timer)))))


(defun org-ask-location ()
  (let* ((org-refile-targets '((nil :maxlevel . 9)))
         (hd (condition-case nil
                 (car (org-refile-get-location "Headline" nil t))
               (error (car org-refile-history)))))
    (goto-char (point-min))
    (outline-next-heading)
    (if (re-search-forward
         (format org-complex-heading-regexp-format (regexp-quote hd))
         nil t)
        (goto-char (point-at-bol))
      (goto-char (point-max))
      (or (bolp) (insert "\n"))
      (insert "* " hd "\n")))
  (end-of-line))



(defun org-subdir (subdir)
  (concat "~/org" subdir))

(defun open-new-project-file ()
   (let ((fpath (read-file-name "Project file name: "
                               (org-subdir "/blog/posts")
                               nil nil nil)))
    (find-file fpath)
    (goto-char (point-min))))

(global-set-key (kbd "C-c c") 'org-capture)
;; https://github.com/karlicoss/grasp
(setq org-capture-templates
      '(("c" "Item to Current Clocked Task"
	 item (clock)
	 "%i%?" :empty-lines 1)
	;; ("a" "Append"
	;;  checkitem (file+function "~/org/todo.org" org-ask-location)
	;;  "[ ] Additionally %?\n %u\n  %a")
	("b" "Blog entry"
	 entry (function open-new-project-file)
	 (file "~/.emacs.d/org-templates/blog_post.orgcaptmpl"))
	("t" "Task"
	 entry (file+headline "~/org/todo.org" "Tasks")
	 "* TODO %?\n  %u\n  %a" :empty-lines 1)
	("u" "Music"
	 entry (file+headline org-default-notes-file "Music")
	 "* TODO %?\n  %u\n  %a" :empty-lines 1)
	("j" "Journal entry"
	 entry (file+datetree "~/org/journal.org")
	 (file "~/.emacs.d/org-templates/journal.orgcaptmpl") :empty-lines 1)
	("m" "Meeting" entry (file "~/org/meetings.org")
	 "* MEETING with %? :MEETING:\n%U")
	("i" "Impromptu meeting" entry (file "~/org/meetings.org")
	 "* MEETING with %? :MEETING:\n%t" :clock-in t :clock-resume t empty-lines 1)
	("p" "Protocol" entry
	 (file+headline ,(concat org-directory "notes.org") "Inbox")
	 "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
	("L" "Protocol Link" entry
	 (file+headline ,(concat org-directory "notes.org") "Inbox")
	 "* %? [[%:link][%:description]] \nCaptured On: %U")
	;; ("s" "Scheduled Action" entry (file+datetree "~/org/meetings.org")
	;;  "* %?\n%U\n" :clock-in t :clock-resume t)
	("l" "Today I Learned"
	 entry (file+datetree "~/org/til.org" "TIL")
	 (file "~/.emacs.d/org-templates/til.orgcaptmpl")  :empty-lines 1)))

(use-package org-crypt
  :init
  (global-set-key [C-f5] (lambda() (interactive) (epa-decrypt-region (region-beginning) (region-end)))))

;; https://www.reddit.com/r/emacs/comments/ioenk2/ical_import_in_emacs_calendar/

(setq diary-location "/home/alec/.emacs.d/")

; calendars you want to download
; each item links to a remote iCal calendar
(setq calendars
      '(("mycalendar" . "file:///home/alec/tmp/mycalendar.ics")
        ))

(defun getcal (url file)
  "Download ics file and add it to file"
  (let ((tmpfile (url-file-local-copy url)))
    (icalendar-import-file tmpfile file)
    (kill-buffer (car (last (split-string tmpfile "/"))))))

(defun getcals ()
  "Load a set of ICS calendars into Emacs diary files"
  (interactive)
  (mapcar #'(lambda (x)
              (let ((file (concat diary-location (car x)))
                    (url (cdr x)))
                (message (concat "Loading " url " into " file))
                (find-file file)
                ;; (flush-lines "^[& ]") ;; if you import ical as non marking
                (erase-buffer) ;; to avoid duplicating events
                (getcal url file)
                ))
          calendars))


(add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
(add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)







(setq org-agenda-include-diary t)

;; Font and page layout stuff for latex-to-pdf
(setq org-latex-compiler "xelatex")
(setq org-latex-pdf-process
      (list (concat "latexmk -"
                    org-latex-compiler
                    " -recorder -synctex=1 -bibtex-cond %b")))
(setq org-latex-listings t)
(setq org-latex-default-packages-alist
      '(("" "graphicx" t)
        ("" "grffile" t)
        ("" "longtable" nil)
        ("" "wrapfig" nil)
        ("" "rotating" nil)
        ("normalem" "ulem" t)
        ("" "amsmath" t)
        ("" "textcomp" t)
        ("" "amssymb" t)
        ("" "capt-of" nil)
        ("" "hyperref" nil)))
(setq org-latex-classes
'(("article"
"\\RequirePackage{fix-cm}
\\PassOptionsToPackage{svgnames}{xcolor}
\\documentclass[11pt]{article}
\\usepackage{fontspec}
\\setmainfont{Raleway}
\\setsansfont[Scale=MatchLowercase]{ETBembo RomanOSF}
\\setmonofont[Scale=MatchLowercase]{Monofonto}
\\usepackage{sectsty}
\\allsectionsfont{\\sffamily}
\\usepackage{enumitem}
\\setlist[description]{style=unboxed,font=\\sffamily\\bfseries}
\\usepackage{listings}
\\lstset{frame=single,aboveskip=1em,
	framesep=.5em,backgroundcolor=\\color{AliceBlue},
	rulecolor=\\color{LightSteelBlue},framerule=1pt}
\\usepackage{xcolor}
\\newcommand\\basicdefault[1]{\\scriptsize\\color{Black}\\ttfamily#1}
\\lstset{basicstyle=\\basicdefault{\\spaceskip1em}}
\\lstset{literate=
	    {§}{{\\S}}1
	    {©}{{\\raisebox{.125ex}{\\copyright}\\enspace}}1
	    {«}{{\\guillemotleft}}1
	    {»}{{\\guillemotright}}1
	    {Á}{{\\'A}}1
	    {Ä}{{\\\"A}}1
	    {É}{{\\'E}}1
	    {Í}{{\\'I}}1
	    {Ó}{{\\'O}}1
	    {Ö}{{\\\"O}}1
	    {Ú}{{\\'U}}1
	    {Ü}{{\\\"U}}1
	    {ß}{{\\ss}}2
	    {à}{{\\`a}}1
	    {á}{{\\'a}}1
	    {ä}{{\\\"a}}1
	    {é}{{\\'e}}1
	    {í}{{\\'i}}1
	    {ó}{{\\'o}}1
	    {ö}{{\\\"o}}1
	    {ú}{{\\'u}}1
	    {ü}{{\\\"u}}1
	    {¹}{{\\textsuperscript1}}1
            {²}{{\\textsuperscript2}}1
            {³}{{\\textsuperscript3}}1
	    {ı}{{\\i}}1
	    {—}{{---}}1
	    {’}{{'}}1
	    {…}{{\\dots}}1
            {⮠}{{$\\hookleftarrow$}}1
	    {␣}{{\\textvisiblespace}}1,
	    keywordstyle=\\color{DarkGreen}\\bfseries,
	    identifierstyle=\\color{DarkRed},
	    commentstyle=\\color{Gray}\\upshape,
	    stringstyle=\\color{DarkBlue}\\upshape,
	    emphstyle=\\color{Chocolate}\\upshape,
	    showstringspaces=false,
	    columns=fullflexible,
	    keepspaces=true}
\\usepackage[a4paper,margin=1in,left=1.5in]{geometry}
\\usepackage{parskip}
\\makeatletter
\\renewcommand{\\maketitle}{%
  \\begingroup\\parindent0pt
  \\sffamily
  \\Huge{\\bfseries\\@title}\\par\\bigskip
  \\LARGE{\\bfseries\\@author}\\par\\medskip
  \\normalsize\\@date\\par\\bigskip
  \\endgroup\\@afterindentfalse\\@afterheading}
\\makeatother
[DEFAULT-PACKAGES]
\\hypersetup{linkcolor=Blue,urlcolor=DarkBlue,
  citecolor=DarkRed,colorlinks=true}
\\AtBeginDocument{\\renewcommand{\\UrlFont}{\\ttfamily}}
[PACKAGES]
[EXTRA]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}"))

("report" "\\documentclass[11pt]{report}"
("\\part{%s}" . "\\part*{%s}")
("\\chapter{%s}" . "\\chapter*{%s}")
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}"))

("book" "\\documentclass[11pt]{book}"
("\\part{%s}" . "\\part*{%s}")
("\\chapter{%s}" . "\\chapter*{%s}")
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
