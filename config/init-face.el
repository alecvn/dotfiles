(require 'use-package)

;; common
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1)
(setq x-select-enable-clipboard t) ;; Enable copy/past-ing from clipboard
;; (prefer-coding-system 'UTF-8) ;; Prefer UTF-8 encoding

;; (setq confirm-kill-emacs 'yes-or-no-p) ;; Ask for confirmation before closing emacs
(fset 'yes-or-no-p 'y-or-n-p) ;; Answer with y and n instead of yes and no

(global-auto-revert-mode 1) ;; Always reload the file if it changed on disk, see also: auto-revert-tail-mode
(add-hook 'dired-mode-hook 'auto-revert-mode) ;; Auto update dired when files change
(show-paren-mode 1) ;; Highlight matching parens
;; (global-subword-mode 1) ;; correctly jump between words in CamelCase
(global-visual-line-mode 1)
(global-linum-mode t) ;; line number frame

;; opacity
(set-frame-parameter (selected-frame) 'alpha '(90 . 80))
(add-to-list 'default-frame-alist '(alpha . (90 . 80)))

(use-package markdown-mode :ensure t)

;; Requirements for dashboard
(use-package all-the-icons :ensure t)
(use-package page-break-lines :ensure t)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq show-week-agenda-p t)
)

;; remove trailing whitespace after save when in programming mode
(use-package ws-butler
  :ensure t
  :defer
  :init
  (add-hook 'prog-mode-hook #'ws-butler-mode))

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t))
