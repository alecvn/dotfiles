;; Remove window ui elements
(menu-bar-mode -1)
(toggle-scroll-bar -1)
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
(set-frame-parameter (selected-frame) 'alpha '(90 . 80))
(add-to-list 'default-frame-alist '(alpha . (90 . 80)))

;; Emacs session management
(global-set-key (kbd "<C-f1>") 'desktop-save)
(global-set-key (kbd "<C-f2>") 'desktop-read)
(global-set-key (kbd "<C-f3>") 'desktop-clear)

(use-package markdown-mode :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  ;;:ensure-system-package (pylint . "pip3 install pylint")
  )

(use-package calmer-forest-theme :ensure t)

(use-package shader-mode :ensure t)

;; Requirements for dashboard
(use-package all-the-icons
  :ensure t
  :init
  (use-package all-the-icons-dired
    :ensure t
    :config
    (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
    :after all-the-icons
    )
  :config
  (when (not (member "all-the-icons" (font-family-list)))
    (all-the-icons-install-fonts t))
  )

;; refresh content asyncronously
;; (package-refresh-contents t)
;; (add-hook 'post-command-hook #'dashboard-refresh-buffer)
(use-package dashboard
  :ensure t
  :init
  (use-package auto-package-update :ensure t)
  (use-package page-break-lines :ensure t)
  ;; (use-package dashboard-hackernews :ensure t)
  :demand
  :bind (:map dashboard-mode-map
	      ("C-c r" . (lambda () (interactive) (package-refresh-contents t)))
	      ("C-c u" . auto-package-update-now))
  :custom
  (show-week-agenda-p t)
  (dashboard-set-heading-icons t)
  (dashboard-banner-logo-title "This is my Emacs. There are many like it, but this one is mine. My Emacs is my best friend. It is my life. I must master it as I master my life. My Emacs, without me, is useless. Without my Emacs, I am useless.")
  (dashboard-center-content t)
  (dashboard-set-file-icons t)
  (dashboard-set-footer nil)
  (dashboard-set-navigator t)
  (dashboard-navigator-buttons
   `(
     ((,(and (display-graphic-p)
	     (all-the-icons-material "update" :height 1.2 :v-adjust -0.24))
       "Refresh"
       "Refresh packages"
       (lambda (&rest _) (package-refresh-contents t)))
     (,(and (display-graphic-p)
	   (all-the-icons-faicon "upload" :height 1.2 :v-adjust 0.0))
     "Update"
     "Update emacs"
     (lambda (&rest _) (auto-package-update-now))))))
  :config
  (require 'dashboard-widgets)
  (load-file  "~/.emacs.d/config/update-package.el")
  (require 'update-package)

  (defun dashboard-insert-list-of-packages-to-update(list-size)
    (insert (all-the-icons-faicon "upload" :height 1.2 :v-adjust 0.0 :face 'dashboard-heading))
    (dashboard-insert-section
     "Package upgrades available:"
     (my-packages-to-install)
     list-size
     "u"
     `(lambda (&rest ignore)
    	(package-install-from-archive (cadr (assoc ',el package-archive-contents)))
    	(dashboard-refresh-buffer))
     (format "%s" el)))

    (add-to-list 'dashboard-item-generators '(list-of-packages-to-update . dashboard-insert-list-of-packages-to-update))

  (setq dashboard-items '((agenda . 5)
			  (projects . 5)
			  (recents  . 5)
			  (list-of-packages-to-update . 20)))
  (dashboard-setup-startup-hook))




;; Remove trailing whitespace after save when in programming mode
(use-package ws-butler
  :ensure t
  :defer
  :init
  (add-hook 'prog-mode-hook #'ws-butler-mode))

;; Inserts closing parentheses for a selection of packages
(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t))
