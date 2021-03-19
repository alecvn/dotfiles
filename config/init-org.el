(setq org-log-done 'time)
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w)" "IN PROGRESS(i)" "|" "DONE(d)" "DELEGATED(e)" "CANCELLED(c)")))

(defun start-my-timer ()
  (interactive)
  (setq mytimer (run-with-timer 0 3000 'counsel-projectile-org-capture)))

(defun cancel-my-timer ()
  (interactive)
  (when (boundp 'mytimer)
    (cancel-timer mytimer)
    (setq mytimer nil)))

(use-package org
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
  (setq org-agenda-files (directory-files-recursively "~/gtd/" "\\.org$"))
  :config
  (setq org-src-fontify-natively t)
  ;; (setq org-refile-targets
  ;; 	'((org-agenda-files . (:maxlevel . 3))))
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
  				   (org-agenda-files :maxlevel . 9))))
  :bind (:map org-mode-map
	      ("C-S-l" . org-shiftright)
	      ("C-S-j" . org-shiftleft)
	 )
  )

  ;; look into this later:
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

(use-package org-capture
  :init
  (global-set-key (kbd "C-c c") 'org-capture)
  (setq org-capture-templates
	'(("c" "Item to Current Clocked Task"
	   item (clock)
	   "%i%?" :empty-lines 1)
	  ;; ("a" "Append"
	  ;;  checkitem (file+function "~/org/todo.org" org-ask-location)
	  ;;  "[ ] Additionally %?\n %u\n  %a")
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
	  ;; ("s" "Scheduled Action" entry (file+datetree "~/org/meetings.org")
	  ;;  "* %?\n%U\n" :clock-in t :clock-resume t)
	  ("l" "Today I Learned"
	   entry (file+datetree "~/org/til.org" "TIL")
	   (file "~/.emacs.d/org-templates/til.orgcaptmpl")  :empty-lines 1))))

(use-package org-crypt
  :init
  (global-set-key [C-f5] (lambda() (interactive) (epa-decrypt-region (region-beginning) (region-end)))))

;; (use-package spotify
;;   :ensure t
;;   :bind-keymap
;;   ("C-c s" . spotify-command-map)
;;   :init
;;   (setq spotify-oauth2-client-secret (getenv "SPOTIFY_CLIENT_SECRET"))
;;   (setq spotify-oauth2-client-id (getenv "SPOTIFY_CLIENT_ID"))
;;   )

(setq org-agenda-include-diary t)
