(require 'use-package)

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

;; common
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1)
(setq x-select-enable-clipboard t) ;; Enable copy/past-ing from clipboard
;;(prefer-coding-system ‘utf-8) ;; Prefer UTF-8 encoding
;;(fset 'yes-or-no-p ‘y-or-n-p) ;; Answer with y and n instead of yes and no
;;(setq confirm-kill-emacs ‘yes-or-no-p) ;; Ask for confirmation before closing emacs
(global-auto-revert-mode 1) ;; Always reload the file if it changed on disk
(show-paren-mode 1) ;; Highlight matching parens
(global-subword-mode 1) ;; correctly jump between words in CamelCase
(global-visual-line-mode 1)

;; org-mode
(setq org-src-fontify-natively t)

;; opacity
(set-frame-parameter (selected-frame) 'alpha '(90 . 80))
(add-to-list 'default-frame-alist '(alpha . (90 . 80)))

;; line number frame
(global-linum-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (calmer-forest)))
 '(custom-safe-themes
   (quote
    ("8dc7f4a05c53572d03f161d82158728618fb306636ddeec4cce204578432a06d" default)))
 '(package-selected-packages
   (quote
    (blacken yasnippet-snippets yasnippet shader-mode flycheck omnisharp calm-forest color-theme use-package bundler git-timemachine git-time-metric magit web-mode ivy ag projectile-rails projectile company calmer-forest-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default (selected-frame) :height 100)
