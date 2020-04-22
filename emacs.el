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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242730" "#ff665c" "#7bc275" "#FCCE7B" "#51afef" "#C57BDB" "#5cEfFF" "#bbc2cf"])
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "229c5cf9c9bd4012be621d271320036c69a14758f70e60385e87880b46d60780" "51956e440cec75ba7e4cff6c79f4f8c884a50b220e78e5e05145386f5b381f7b" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "6bacece4cf10ea7dd5eae5bfc1019888f0cb62059ff905f37b33eec145a6a430" "24132f7b6699c6e0118d742351b74141bac3c4388937e40db9207554eaae78c9" "1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "3577ee091e1d318c49889574a31175970472f6f182a9789f1a3e9e4513641d86" "a83f05e5e2f2538376ea2bfdf9e3cd8b7f7593b16299238c1134c1529503fa88" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "845103fcb9b091b0958171653a4413ccfad35552bc39697d448941bcbe5a660d" "6231254e74298a1cf8a5fee7ca64352943de4b495e615c449e9bb27e2ccae709" "56911bd75304fdb19619c9cb4c7b0511214d93f18e566e5b954416756a20cc80" "7c4cfa4eb784539d6e09ecc118428cd8125d6aa3053d8e8413f31a7293d43169" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "58c3313b4811ed8b30239b1d04816f74d438bcb72626d68181f294b115b7220d" "1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "615123f602c56139c8170c153208406bf467804785007cdc11ba73d18c3a248b" "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "d5f8099d98174116cba9912fe2a0c3196a7cd405d12fa6b9375c55fc510988b5" "7f791f743870983b9bb90c8285e1e0ba1bf1ea6e9c9a02c60335899ba20f3c94" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "361f5a2bc2a7d7387b442b2570b0ef35198442b38c2812bf3c70e1e091771d1a" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "fa3bdd59ea708164e7821574822ab82a3c51e262d419df941f26d64d015c90ee" "8dc7f4a05c53572d03f161d82158728618fb306636ddeec4cce204578432a06d" default)))
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
	 (auto-package-update-now))))))
 '(dashboard-set-file-icons t)
 '(dashboard-set-footer nil)
 '(dashboard-set-heading-icons t)
 '(dashboard-set-navigator t)
 '(fci-rule-color "#62686E")
 '(jdee-db-active-breakpoint-face-colors (cons "#1c1f24" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1c1f24" "#7bc275"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1c1f24" "#484854"))
 '(objed-cursor-color "#ff665c")
 '(package-selected-packages
   (quote
    (org so-long restclient helm lsp-mode i3wm-config-mode wgrep dashboard-hackernews company-tern all-the-icons-dired use-package-ensure-system-package blacken yasnippet-snippets yasnippet shader-mode flycheck omnisharp calm-forest color-theme use-package bundler git-timemachine git-time-metric magit web-mode ivy ag projectile-rails projectile company calmer-forest-theme)))
 '(pdf-view-midnight-colors (cons "#bbc2cf" "#242730"))
 '(rustic-ansi-faces
   ["#242730" "#ff665c" "#7bc275" "#FCCE7B" "#51afef" "#C57BDB" "#5cEfFF" "#bbc2cf"])
 '(show-week-agenda-p t t)
 '(vc-annotate-background "#242730")
 '(vc-annotate-color-map
   (list
    (cons 20 "#7bc275")
    (cons 40 "#a6c677")
    (cons 60 "#d1ca79")
    (cons 80 "#FCCE7B")
    (cons 100 "#f4b96e")
    (cons 120 "#eda461")
    (cons 140 "#e69055")
    (cons 160 "#db8981")
    (cons 180 "#d082ae")
    (cons 200 "#C57BDB")
    (cons 220 "#d874b0")
    (cons 240 "#eb6d86")
    (cons 260 "#ff665c")
    (cons 280 "#d15e59")
    (cons 300 "#a35758")
    (cons 320 "#754f56")
    (cons 340 "#62686E")
    (cons 360 "#62686E")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray12" :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "PfEd" :family "DejaVu Sans Mono"))))
 '(all-the-icons-dired-dir-face ((t (:foreground "steel blue"))))
 '(org-agenda-date ((t (:foreground "DeepSkyBlue3" :weight ultra-bold))))
 '(org-agenda-date-today ((t (:foreground "cyan" :weight ultra-bold))))
 '(org-agenda-date-weekend ((t (:foreground "DeepSkyBlue4" :weight ultra-bold))))
 '(org-table ((t (:foreground "deep sky blue")))))

(set-face-attribute 'default (selected-frame) :height 90)
