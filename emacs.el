;; Working on Emacs 26.2 and 25.2

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
;;(load-file "~/.emacs.d/config/init-dap.el")

;;(load-file "~/.emacs.d/config/init-lsp.el")
(load-file "~/.emacs.d/config/init-ruby.el")
(load-file "~/.emacs.d/config/init-python.el")
(load-file "~/.emacs.d/config/init-web.el")
(load-file "~/.emacs.d/config/init-csharp.el")

;; (set-face-attribute 'default (selected-frame) :height 90)
(load-file "~/.emacs.d/config/init-rest.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(dashboard-banner-logo-title
   "This is my Emacs. There are many like it, but this one is mine. My Emacs is my best friend. It is my life. I must master it as I master my life. My Emacs, without me, is useless. Without my Emacs, I am useless.")
 '(dashboard-center-content t)
 '(dashboard-navigator-buttons
   (quote
    (((#("" 0 1
	 (rear-nonsticky t display
			 (raise -0.288)
			 font-lock-face
			 (:family "Material Icons" :height 1.44)
			 face
			 (:family "Material Icons" :height 1.44)))
       "Refresh" "Refresh packages"
       (lambda
	 (&rest _)
	 (package-refresh-contents t)))
      (#("" 0 1
	 (rear-nonsticky t display
			 (raise 0.0)
			 font-lock-face
			 (:family "FontAwesome" :height 1.44)
			 face
			 (:family "FontAwesome" :height 1.44)))
       "Update" "Update emacs"
       (lambda
	 (&rest _)
	 (auto-package-update-now))))))
 '(dashboard-set-file-icons t)
 '(dashboard-set-footer nil)
 '(dashboard-set-heading-icons t)
 '(dashboard-set-navigator t)
 '(fci-rule-color "#073642")
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   '("#3b2b40b432a1" "#07ab45f64ce9" "#475733ea3554" "#1d623c04567f" "#2d5343d8332c" "#436f35f73166" "#0613413e597e"))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   '(("#073642" . 0)
     ("#5b7300" . 20)
     ("#007d76" . 30)
     ("#0061a8" . 50)
     ("#866300" . 60)
     ("#992700" . 70)
     ("#a00559" . 85)
     ("#073642" . 100)))
 '(hl-bg-colors
   '("#866300" "#992700" "#a7020a" "#a00559" "#243e9b" "#0061a8" "#007d76" "#5b7300"))
 '(hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(lsp-ui-doc-border "#93a1a1")
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#5b7300" "#b3c34d" "#0061a8" "#2aa198" "#d33682" "#6c71c4"))
 '(package-selected-packages
   '(tide add-node-modules-path yasnippet ws-butler wgrep web-mode use-package-ensure-system-package spacemacs-theme solarized-theme smartparens shader-mode restclient rbenv py-isort projectile-rails org omnisharp markdown-mode magit highlight-indent-guides git-timemachine exec-path-from-shell doom-modeline diminish dashboard counsel-projectile company-tern company-jedi calmer-forest-theme blacken auto-package-update all-the-icons-dired ag))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(show-week-agenda-p t t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f")
     (40 . "#ca7966832090")
     (60 . "#c05578c91534")
     (80 . "#b58900")
     (100 . "#a6088eed0000")
     (120 . "#9e3a91a60000")
     (140 . "#9628943b0000")
     (160 . "#8dc596ad0000")
     (180 . "#859900")
     (200 . "#76ef9b6045e8")
     (220 . "#6cd69ca95b9d")
     (240 . "#5f5f9e06701f")
     (260 . "#4c1a9f778424")
     (280 . "#2aa198")
     (300 . "#3002984eaf4d")
     (320 . "#2f6f93e8bae0")
     (340 . "#2c598f79c66f")
     (360 . "#268bd2")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#002b36" "#073642" "#a7020a" "#dc322f" "#5b7300" "#859900" "#866300" "#b58900" "#0061a8" "#268bd2" "#a00559" "#d33682" "#007d76" "#2aa198" "#839496" "#657b83"))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
=======
 '(package-selected-packages
   (quote
    (yasnippet-snippets ws-butler wgrep-ag web-mode vterm use-package-ensure-system-package solarized-theme so-long smartparens shx shader-mode rvm robe restclient rbenv rainbow-mode py-isort projectile-rails org omnisharp markdown-mode magit lv ioccur highlight-indent-guides helm git-timemachine git-time-metric flymake-ruby exec-path-from-shell enh-ruby-mode doom-themes doom-modeline diminish dashboard counsel-projectile company-tern company-jedi company-inf-ruby calmer-forest-theme bundler buffer-move blacken auto-package-update all-the-icons-dired ag)))
 '(show-week-agenda-p t t))
>>>>>>> 9b187bc79e2af7c72063e1150a0f986f067a2f24
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
