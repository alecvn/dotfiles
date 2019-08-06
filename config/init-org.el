(use-package org
  :init
  (global-set-key (kbd "C-c a") 'org-agenda)
  (setq org-export-coding-system 'utf-8)
  (setq org-return-follows-link t)
  :config
  (setq org-src-fontify-natively t)
  (setq org-refile-targets
	'((org-agenda-files . (:maxlevel . 3))))
  (setq mytimer (run-with-timer 3000 3000 'invert-face 'mode-line))
  (add-hook 'org-mode-hook (lambda ()
			     (defadvice org-clock-in (after org-clock-in-after activate)
			       (cancel-timer mytimer)
			       (setq mytimer nil)
			       (setq mytimer (run-with-timer 3000 3000 'invert-face 'mode-line)))
			     (defadvice org-clock-out (after org-clock-out-after activate)
			       (cancel-timer mytimer)
			       (setq mytimer nil)
			       (setq mytimer (run-with-timer 3000 3000 'invert-face 'mode-line))))))

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

(use-package org-capture
  :init
  (global-set-key (kbd "C-c c") 'org-capture)
  (setq org-capture-templates
	'(("c" "Item to Current Clocked Task"
	   item (clock)
	   "%i%?" :empty-lines 1)
	  ("a" "Append"
	   checkitem (file+function org-default-notes-file org-ask-location)
	   "[ ] Additionally %?\n %u\n  %a")
	  ("t" "Task"
	   entry (file+headline org-default-notes-file "Tasks")
	   "* TODO %?\n  %u\n  %a" :empty-lines 1)
	  ("j" "Journal entry"
	   entry (file+datetree "~/org/journal.org")
	   (file "~/.emacs.d/org-templates/journal.orgcaptmpl") :empty-lines 1)
	  ("l" "Today I Learned"
	   entry (file+datetree org-default-notes-file "TIL")
	   (file "~/.emacs.d/org-templates/til.orgcaptmpl")  :empty-lines 1))))

(use-package org-crypt
  :init
  (global-set-key [C-f5] (lambda() (interactive) (epa-decrypt-region (region-beginning) (region-end)))))
