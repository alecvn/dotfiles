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

(load-file "~/.emacs.d/config/init-face.el")
(load-file "~/.emacs.d/config/init-org.el")
(load-file "~/.emacs.d/config/init-completion.el")
(load-file "~/.emacs.d/config/init-nav.el")
(load-file "~/.emacs.d/config/init-git.el")
(load-file "~/.emacs.d/config/init-shell.el")
(load-file "~/.emacs.d/config/init-macros.el")
;;(load-file "~/.emacs.d/config/init-dap.el")

;;(load-file "~/.emacs.d/config/init-lsp.el")
(load-file "~/.emacs.d/config/init-ruby.el")
(load-file "~/.emacs.d/config/init-python.el")
(load-file "~/.emacs.d/config/init-web.el")
(load-file "~/.emacs.d/config/init-csharp.el")
(load-file "~/.emacs.d/config/init-rest.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dashboard-banner-logo-title
   "This is my Emacs. There are many like it, but this one is mine. My Emacs is my best friend. It is my life. I must master it as I master my life. My Emacs, without me, is useless. Without my Emacs, I am useless." t)
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
	 (auto-package-update-now)))))) t)
 '(dashboard-set-file-icons t)
 '(dashboard-set-footer nil)
 '(dashboard-set-heading-icons t)
 '(dashboard-set-navigator t)
 '(org-agenda-files
   (quote
    ("/home/alec/org/gtd/id-1address.org" "/home/alec/org/gtd/id-7days.org" "/home/alec/org/gtd/id-admin.org" "/home/alec/org/gtd/id-african.org" "/home/alec/org/gtd/id-bountyxp.org" "/home/alec/org/gtd/id-bunchcut.org" "/home/alec/org/gtd/id-charlottetilbury.org" "/home/alec/org/gtd/id-cliffcentral.org" "/home/alec/org/gtd/id-coin-it.org" "/home/alec/org/gtd/id-csir.org" "/home/alec/org/gtd/id-dannfica.org" "/home/alec/org/gtd/id-evolabs.org" "/home/alec/org/gtd/id-evolabs2.org" "/home/alec/org/gtd/id-fonk-fieldmate.org" "/home/alec/org/gtd/id-fonk-ing.org" "/home/alec/org/gtd/id-fonk-nbk.org" "/home/alec/org/gtd/id-fonk.org" "/home/alec/org/gtd/id-foodlink.org" "/home/alec/org/gtd/id-handheld.org" "/home/alec/org/gtd/id-hungrylion.org" "/home/alec/org/gtd/id-impact-spii.org" "/home/alec/org/gtd/id-impd.org" "/home/alec/org/gtd/id-imptime.org" "/home/alec/org/gtd/id-jobber.org" "/home/alec/org/gtd/id-katalyst.org" "/home/alec/org/gtd/id-koen-hfm.org" "/home/alec/org/gtd/id-malcolm.org" "/home/alec/org/gtd/id-mixtelamtics.org" "/home/alec/org/gtd/id-optics.org" "/home/alec/org/gtd/id-orca.org" "/home/alec/org/gtd/id-pemas.org" "/home/alec/org/gtd/id-quindici.org" "/home/alec/org/gtd/id-samsung.org" "/home/alec/org/gtd/id-sparrow.org" "/home/alec/org/gtd/id-stint.org" "/home/alec/org/gtd/id-tastemakersafrica.org" "/home/alec/org/gtd/id-timesheet.org" "/home/alec/org/gtd/id-tusk.org" "/home/alec/org/gtd/id-unionswiss.org" "/home/alec/org/gtd/id-vumela.org" "/home/alec/org/gtd/id-yebo-fresh.org" "/home/alec/org/gtd/id-youverify.org" "/home/alec/org/gtd/notes.org" "/home/alec/org/gtd/passwords.org" "/home/alec/org/gtd/traveltime.org" "/home/alec/org/gtd/us.org" "/home/alec/org/Boardgames.org" "/home/alec/org/Kommetjie.org" "/home/alec/org/beer.org" "/home/alec/org/blogposts.org" "/home/alec/org/cEDH AI.org" "/home/alec/org/cubigama.org" "/home/alec/org/finance.org" "/home/alec/org/games.org" "/home/alec/org/interview.org" "/home/alec/org/journal.org" "/home/alec/org/kids.org" "/home/alec/org/kubigawa.org" "/home/alec/org/magic.org" "/home/alec/org/marisca.org" "/home/alec/org/meetings.org" "/home/alec/org/music.org" "/home/alec/org/oupa.org" "/home/alec/org/passwords.org" "/home/alec/org/podcasts_and_audiobooks.org" "/home/alec/org/project_management.org" "/home/alec/org/projects.org" "/home/alec/org/recipes.org" "/home/alec/org/social_work.org" "/home/alec/org/tattoo.org" "/home/alec/org/til.org" "/home/alec/org/todo.org" "/home/alec/org/vehicle.org")))
 '(package-selected-packages
   (quote
    (mtg company docker transient docker-cli docker-compose org-rich-yank ansible-vault yaml-mode dockerfile-mode yasnippet-snippets ws-butler wgrep-ag web-mode vterm use-package-ensure-system-package solarized-theme so-long smartparens shx shader-mode rvm robe restclient rbenv rainbow-mode py-isort projectile-rails org omnisharp markdown-mode magit lv ioccur highlight-indent-guides helm git-timemachine git-time-metric flymake-ruby exec-path-from-shell enh-ruby-mode doom-themes doom-modeline diminish dashboard counsel-projectile company-tern company-jedi company-inf-ruby calmer-forest-theme bundler buffer-move blacken auto-package-update all-the-icons-dired ag)))
 '(show-week-agenda-p t t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
