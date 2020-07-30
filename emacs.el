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
   '(((#("" 0 1
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
	 (auto-package-update-now))))))
 '(dashboard-set-file-icons t)
 '(dashboard-set-footer nil)
 '(dashboard-set-heading-icons t)
 '(dashboard-set-navigator t)
 '(package-selected-packages
   '(prettier-js tide pyimpsort poetry elpy flycheck-pycheckers yasnippet ws-butler wgrep web-mode use-package-ensure-system-package spacemacs-theme solarized-theme so-long smartparens shx shader-mode rvm robe restclient rbenv py-isort projectile-rails org omnisharp markdown-mode magit highlight-indent-guides git-timemachine flymake-ruby exec-path-from-shell enh-ruby-mode doom-themes doom-modeline diminish dashboard counsel-projectile company-tern company-jedi company-inf-ruby calmer-forest-theme buffer-move blacken auto-package-update all-the-icons-dired ag add-node-modules-path))
 '(show-week-agenda-p t t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
