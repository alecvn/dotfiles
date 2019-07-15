(use-package org
  :init
  (setq org-export-coding-system 'utf-8)
  (setq org-return-follows-link t)
  :config
  (setq org-src-fontify-natively t)
  (setq org-agenda-files '("~/org")))

(use-package org-capture
  :init
  (global-set-key (kbd "C-c c") 'org-capture)
  (setq org-capture-templates
	'(("t" "Task"
	   entry (file+headline org-default-notes-file "Tasks")
	   "* TODO %?\n  %t\n  %a")
	  ("j" "Journal entry"
	   entry (file+datetree "~/org/journal.org")
	   (file "~/.emacs.d/org-templates/journal.orgcaptmpl"))
	  ("b" "Titbit: quote, zinger, one-liner, textlet, code snippet"
	   entry (file+headline org-default-notes-file "Titbits")
	   (file "~/.emacs.d/org-templates/titbit.orgcaptmpl")))))

(use-package org-crypt
  :init
  (global-set-key [C-f5] (lambda() (interactive) (epa-decrypt-region (region-beginning) (region-end)))))
