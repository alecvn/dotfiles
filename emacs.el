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

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
;; Line number frame
(global-display-line-numbers-mode t)
(setq column-number-mode t)

;; Opacity
(set-frame-parameter (selected-frame) 'alpha '(95 . 85))
(add-to-list 'default-frame-alist '(alpha . (95 . 85)))

(global-set-key (kbd "<C-x C-a>") 'desktop-save)

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
(load-file "~/.emacs.d/config/init-org.el")
(load-file "~/.emacs.d/config/init-completion.el")
(load-file "~/.emacs.d/config/init-nav.el")
(load-file "~/.emacs.d/config/init-git.el")
(load-file "~/.emacs.d/config/init-shell.el")
(load-file "~/.emacs.d/config/init-macros.el")
(load-file "~/.emacs.d/config/init-docker.el")
;;(load-file "~/.emacs.d/config/init-dap.el")

;;(load-file "~/.emacs.d/config/init-lsp.el")
(load-file "~/.emacs.d/config/init-ruby.el")
(load-file "~/.emacs.d/config/init-python.el")
(load-file "~/.emacs.d/config/init-web.el")
(load-file "~/.emacs.d/config/init-csharp.el")
(load-file "~/.emacs.d/config/init-rest.el")









;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Allow find-file-at-point to go to the line number if available
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar ffap-file-at-point-line-number nil
  "Variable to hold line number from the last `ffap-file-at-point' call.")

(defadvice ffap-file-at-point (after ffap-store-line-number activate)
  "Search `ffap-string-at-point' for a line number pattern and
save it in `ffap-file-at-point-line-number' variable."
  (let* ((string (ffap-string-at-point)) ;; string/name definition copied from `ffap-string-at-point'
         (name
          (or (condition-case nil
                  (and (not (string-match "//" string)) ; foo.com://bar
                       (substitute-in-file-name string))
                (error nil))
              string))
         (line-number-string
          (and (string-match ":[0-9]+" name)
               (substring name (1+ (match-beginning 0)) (match-end 0))))
         (line-number
          (and line-number-string
               (string-to-number line-number-string))))
    (if (and line-number (> line-number 0))
        (setq ffap-file-at-point-line-number line-number)
      (setq ffap-file-at-point-line-number nil))))

(defadvice find-file-at-point (after ffap-goto-line-number activate)
  "If `ffap-file-at-point-line-number' is non-nil goto this line."
  (when ffap-file-at-point-line-number
    (forward-line ffap-file-at-point-line-number)
    (setq ffap-file-at-point-line-number nil)))




(defun mark-from-point-to-end-of-line ()
  "Marks everything from point to end of line"
  (interactive)
  (set-mark (line-end-position))
  (activate-mark))
(global-set-key (kbd "<C-M-@>") 'mark-from-point-to-end-of-line)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#222222" "#aa4450" "#87875f" "#cc8800" "#87AFD7" "#8787AF" "#87ceeb" "#c2c2b0"])
 '(custom-safe-themes
   (quote
    ("229c5cf9c9bd4012be621d271320036c69a14758f70e60385e87880b46d60780" "f9cae16fd084c64bf0a9de797ef9caedc9ff4d463dd0288c30a3f89ecf36ca7e" "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" "7f791f743870983b9bb90c8285e1e0ba1bf1ea6e9c9a02c60335899ba20f3c94" default)))
 '(dashboard-banner-logo-title
   "This is my Emacs. There are many like it, but this one is mine. My Emacs is my best friend. It is my life. I must master it as I master my life. My Emacs, without me, is useless. Without my Emacs, I am useless." t)
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
	 (auto-package-update-now)))))) t)
 '(dashboard-set-file-icons t)
 '(dashboard-set-footer nil)
 '(dashboard-set-heading-icons t)
 '(dashboard-set-navigator t)
 '(fci-rule-color "#62686E")
 '(jdee-db-active-breakpoint-face-colors (cons "#1d2127" "#87ceeb"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1d2127" "#87875f"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1d2127" "#686858"))
 '(objed-cursor-color "#aa4450")
 '(org-agenda-files
   (quote
    ("/home/alec/org/homes.org" "/home/alec/org/projects/gtd.org" "/home/alec/Dropbox/org/blogging.org" "/home/alec/Dropbox/org/birthdays.org" "/home/alec/org/Kommetjie.org" "/home/alec/org/beer.org" "/home/alec/org/cEDH AI.org" "/home/alec/org/cubigama.org" "/home/alec/org/finance.org" "/home/alec/org/games.org" "/home/alec/org/interview.org" "/home/alec/org/journal.org" "/home/alec/org/kids.org" "/home/alec/org/kubigawa.org" "/home/alec/org/magic.org" "/home/alec/org/marisca.org" "/home/alec/org/meetings.org" "/home/alec/org/music.org" "/home/alec/org/oupa.org" "/home/alec/org/passwords.org" "/home/alec/org/project_management.org" "/home/alec/org/projects.org" "/home/alec/org/recipes.org" "/home/alec/org/social_work.org" "/home/alec/org/tattoo.org" "/home/alec/org/til.org" "/home/alec/org/todo.org" "/home/alec/org/vehicle.org")))
 '(package-selected-packages
   (quote
    (which-key vue-mode ivy-prescient forge org-sync impatient-mode phps-mode php-mode mtg company docker transient docker-cli docker-compose org-rich-yank ansible-vault yaml-mode dockerfile-mode yasnippet-snippets ws-butler wgrep-ag web-mode vterm use-package-ensure-system-package solarized-theme so-long smartparens shx shader-mode rvm robe restclient rbenv rainbow-mode py-isort projectile-rails org omnisharp markdown-mode magit lv ioccur highlight-indent-guides helm git-timemachine git-time-metric flymake-ruby exec-path-from-shell enh-ruby-mode doom-themes doom-modeline diminish dashboard counsel-projectile company-tern company-jedi company-inf-ruby calmer-forest-theme bundler buffer-move blacken auto-package-update all-the-icons-dired ag)))
 '(pdf-view-midnight-colors (cons "#c2c2b0" "#222222"))
 '(rustic-ansi-faces
   ["#222222" "#aa4450" "#87875f" "#cc8800" "#87AFD7" "#8787AF" "#87ceeb" "#c2c2b0"])
 '(show-week-agenda-p t t)
 '(vc-annotate-background "#222222")
 '(vc-annotate-color-map
   (list
    (cons 20 "#87875f")
    (cons 40 "#9e873f")
    (cons 60 "#b5871f")
    (cons 80 "#cc8800")
    (cons 100 "#dd8d00")
    (cons 120 "#ee9200")
    (cons 140 "#ff9800")
    (cons 160 "#d7923a")
    (cons 180 "#af8c74")
    (cons 200 "#8787AF")
    (cons 220 "#92708f")
    (cons 240 "#9e5a6f")
    (cons 260 "#aa4450")
    (cons 280 "#994d51")
    (cons 300 "#895654")
    (cons 320 "#785f55")
    (cons 340 "#62686E")
    (cons 360 "#62686E")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
