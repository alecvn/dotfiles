;; Working on Emacs 26.2 and 25.2
(scroll-bar-mode -1)
;; Remove window ui elements
(menu-bar-mode -1)
;;(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Should help with Emacs slowing down on big one-liners
(setq bidi-paragraph-direction 'left-to-right)

;; Show current function in modeline - via imenu
(which-function-mode 1)

;; Enable copy/past-ing from clipboard
(setq select-enable-clipboard t)

;; Prefer UTF-8 encoding
;; (prefer-coding-system 'UTF-8)

;; Always reload the file if it changed on disk, see also: auto-revert-tail-mode
(global-auto-revert-mode 1)

;; Auto update dired when files change
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; Highlight matching parens
(show-paren-mode 1)

;; Jump between words in CamelCase - this isn't as great as I had hoped
;; (global-subword-mode 1)

;; Text wraps around buffer edges - still not convinced about this
(global-visual-line-mode 1)

;; Line number frame
(global-display-line-numbers-mode t)
(setq column-number-mode t)

;; Opacity
(set-frame-parameter (selected-frame) 'alpha '(95 . 85))
(add-to-list 'default-frame-alist '(alpha . (95 . 85)))

;; Emacs session management
(global-set-key (kbd "<C-f1>") 'desktop-save)
(global-set-key (kbd "<C-f2>") 'desktop-read)
(global-set-key (kbd "<C-f3>") 'desktop-clear)
;; Automatically save and restore sessions
;; (setq desktop-dirname             "~/.emacs.d/desktop/"
;;       desktop-base-file-name      "emacs.desktop"
;;       desktop-base-lock-name      "lock"
;;       desktop-path                (list desktop-dirname)
;;       desktop-save                t
;;       desktop-files-not-to-save   "^$" ;reload tramp paths
;;       desktop-load-locked-desktop nil
;;       desktop-auto-save-timeout   30)
;; (desktop-save-mode 1)

;; Install use-package if necessary
(require 'package)
;; This stops package-initialize from being called
;; twice during start-up, decreasing start-up time
(setq package-enable-at-startup nil)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Allows hiding modes in the modeline
(use-package diminish :ensure t)

;; Inherits environment variables from the shell
(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

;; Provides the ability to ensure system package dependencies are met
(use-package use-package-ensure-system-package :ensure t)

;; (add-to-list 'load-path "~/dev/auto-package-update.el")
;; (require 'auto-package-update)

;;(server-start)
;;(use-package org-protocol
;;  :ensure t)

(load-file "~/.emacs.d/config/init-org.el")
(load-file "~/.emacs.d/config/init-face.el")
(load-file "~/.emacs.d/config/init-completion.el")
(load-file "~/.emacs.d/config/init-nav.el")
(load-file "~/.emacs.d/config/init-git.el")
(load-file "~/.emacs.d/config/init-shell.el")
(load-file "~/.emacs.d/config/init-ruby.el")
(load-file "~/.emacs.d/config/init-python.el")
(load-file "~/.emacs.d/config/init-js-tide.el")
(load-file "~/.emacs.d/config/init-web.el")
(load-file "~/.emacs.d/config/init-csharp.el")
(load-file "~/.emacs.d/config/init-rest.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dashboard-banner-logo-title
   "This is my Emacs. There are many like it, but this one is mine. My Emacs is my best friend. It is my life. I must master it as I master my life. My Emacs, without me, is useless. Without my Emacs, I am useless.")
 '(dashboard-center-content t)
 '(dashboard-navigator-buttons
   (quote
    (((#("" 0 1
	 (face
	  (:family "Material Icons" :height 1.44)
	  font-lock-face
	  (:family "Material Icons" :height 1.44)
	  display
	  (raise -0.288)
	  rear-nonsticky t))
       "Refresh" "Refresh packages"
       (lambda
	 (&rest _)
	 (package-refresh-contents t)))
      (#("" 0 1
	 (face
	  (:family "FontAwesome" :height 1.44)
	  font-lock-face
	  (:family "FontAwesome" :height 1.44)
	  display
	  (raise 0.0)
	  rear-nonsticky t))
       "Update" "Update emacs"
       (lambda
	 (&rest _)
	 (auto-package-update-now)))))))
 '(dashboard-set-file-icons t)
 '(dashboard-set-footer nil)
 '(dashboard-set-heading-icons t)
 '(dashboard-set-navigator t)
 '(org-agenda-files
   (quote
    ("/home/andrew/gtd/meeting_notes/charlotte.org" "/home/andrew/gtd/meeting_notes/formulad.org" "/home/andrew/gtd/meeting_notes/i3.org" "/home/andrew/gtd/meeting_notes/urbian.org" "/home/andrew/gtd/emacs-notes.org" "/home/andrew/gtd/id-1address.org" "/home/andrew/gtd/id-aag.org" "/home/andrew/gtd/id-admin.org" "/home/andrew/gtd/id-african.org" "/home/andrew/gtd/id-biomarker.org" "/home/andrew/gtd/id-cephia.org" "/home/andrew/gtd/id-charlotte.org" "/home/andrew/gtd/id-coraltech-property.org" "/home/andrew/gtd/id-formulad-learning.org" "/home/andrew/gtd/id-gemsreport.org" "/home/andrew/gtd/id-impact.org" "/home/andrew/gtd/id-impd.org" "/home/andrew/gtd/id-imptime.org" "/home/andrew/gtd/id-katalyst.org" "/home/andrew/gtd/id-malcolm.org" "/home/andrew/gtd/id-moozle.org" "/home/andrew/gtd/id-npoconnect.org" "/home/andrew/gtd/id-odrin.org" "/home/andrew/gtd/id-samsung.org" "/home/andrew/gtd/id-stint.org" "/home/andrew/gtd/id-systemworks.org" "/home/andrew/gtd/id-tutorhouse.org" "/home/andrew/gtd/id-tuyu.org" "/home/andrew/gtd/id-unionswiss.org" "/home/andrew/gtd/id-upcycles.org" "/home/andrew/gtd/id-urbian.org" "/home/andrew/gtd/id-yebo_fresh.org" "/home/andrew/gtd/new_notes.org" "/home/andrew/gtd/notes.org" "/home/andrew/gtd/passwords.org")))
 '(package-selected-packages
   (quote
    (docker tramp yasnippet-snippets ws-butler wgrep-ag web-mode vterm use-package-ensure-system-package solarized-theme so-long smartparens shx shader-mode rvm robe restclient rbenv rainbow-mode py-isort projectile-rails org omnisharp markdown-mode magit lv ioccur highlight-indent-guides helm git-timemachine git-time-metric flymake-ruby exec-path-from-shell enh-ruby-mode doom-themes doom-modeline diminish dashboard counsel-projectile company-tern company-jedi company-inf-ruby calmer-forest-theme bundler buffer-move blacken auto-package-update all-the-icons-dired ag)))
 '(show-week-agenda-p t t)
 '(tramp-remote-process-environment
   (quote
    ("ENV=''" "TMOUT=0" "LC_CTYPE=''" "CDPATH=" "HISTORY=" "MAIL=" "MAILCHECK=" "MAILPATH=" "PAGER=cat" "autocorrect=" "correct="))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
