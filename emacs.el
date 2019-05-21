;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

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

;; org-mode
(setq org-src-fontify-natively t)

;; opacity
(set-frame-parameter (selected-frame) 'alpha '(90 . 80))
(add-to-list 'default-frame-alist '(alpha . (90 . 80)))

;; line number frame
(global-linum-mode t)

;; (defun forward-to-subword (arg)
;;   "Move forward until encountering the beginning of a word.
;; With argument, do this that many times."
;;   (interactive "^p")
;;   (or (re-search-forward (if (> arg 0) "\\W\\b" "\\b\\W") nil t arg)
;;       (goto-char (if (> arg 0) (point-max) (point-min)))))
;; (global-set-key (kbd "M-h") 'forward-to-subword)

;; (Require 'misc)
;; (global-set-key (kbd "M-f") 'forward-to-word)

;; macro to revert buffer
(fset 'alec-revert-buffer
    [?\M-x ?r ?e ?v ?e ?r ?t ?- ?b ?u ?f ?f ?e ?r return ?y ?e ?s return])
(global-set-key [f6] 'alec-revert-buffer)

;; rbenv
(global-rbenv-mode)
(rbenv-use-global)

;; projectile
(projectile-global-mode)
(projectile-rails-global-mode)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-completion-system 'ivy)

(setq projectile-switch-project-action 'projectile-commander)
(setq projectile-rails-vanilla-command "bin/rails")
(setq projectile-rails-spring-command "bin/rails")
(require 'projectile)
(def-projectile-commander-method ?s
  "Open a *shell* buffer for the project."
  (projectile-run-shell))
(def-projectile-commander-method ?d
  "Open project root in dired."
  (projectile-dired))
(require 'inf-ruby)
(add-hook 'after-init-hook 'inf-ruby-switch-setup) ;; hit C-x C-q when breakpoint is hit


;; ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; ido
(require 'ido)
(ido-mode t)
(setq ido-separator "\n")
(setq ido-use-filename-at-point 'guess)
(global-set-key (kbd "M-i") 'imenu)


;; ;; Flycheck
;; ;; (require 'flycheck)

;; ;; Company
;; (add-hook 'after-init-hook 'global-company-mode)

;; (with-eval-after-load 'company
;;   (add-to-list 'company-backends 'company-tern)
;;   (global-set-key (kbd "M-SPC") 'company-complete)
;;   )
;; (setq company-idle-delay 0)

;; ;; tide
;; (require 'tide)
;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   ;; company is an optional dependency. You have to
;;   ;; install it separately via package-install
;;   (company-mode +1))




;; Web mode

(use-package web-mode
	     :init (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)))

;;             :ensure t
;;	     :defer t
;;	     :mode (("\\.ios\\.js$" . web-mode)
;;	     :mode (("\\.ios\\.js$" . web-mode)
;; ;;          ("\\.android\\.js$" . web-mode)
;; ;;          ("\\.react\\.js$" . web-mode)
;; ;;          ("\\.js$" . web-mode))
;; ;;   :config
;; (require 'web-mode)
;; (setq web-mode-content-types-alist
;;       '(("jsx" . ".*\\.js[x]?\\'")))
;; (add-to-list 'magic-mode-alist '("^import React" . web-mode))
;; (add-to-list 'magic-mode-alist '("React.Component" . web-mode))
;; (add-to-list 'magic-mode-alist '("from 'react';$" . web-mode))
;; (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
;; (add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))

;; (with-eval-after-load 'flycheck
;;   (flycheck-add-mode 'javascript-eslint 'web-mode))

;; (add-hook 'web-mode-hook
;; 	  (lambda ()
;; 	    (If (equal web-mode-content-type "javascript")
;; 		(web-mode-set-content-type "jsx"))))
;; (setq-local web-mode-enable-auto-quoting nil)

;; (setq-default js-indent-level 4)

;; (add-hook 'web-mode-hook
;; 	  (lambda ()
;; 	    (setq web-mode-markup-indent-offset (symbol-value 'js-indent-level))
;; 	    (setq web-mode-attr-indent-offset (symbol-value 'js-indent-level))
;; 	    (setq web-mode-css-indent-offset (symbol-value 'js-indent-level))
;; 	    (setq web-mode-code-indent-offset (symbol-value 'js-indent-level))
;; 	    )
;; 	  )




;; ;; (require 'web-mode)
;; ;; (setq web-mode-content-types-alist
;; ;;       '(("jsx" . ".*\\.js[x]?\\'")))
;; ;; (add-to-list 'auto-mode-alist '("\\.jsx'" . web-mode))
;; ;; (add-to-list 'auto-mode-alist '("\\.tsx'" . web-mode))
;; ;; (add-to-list 'auto-mode-alist '(".*\\.js\\'" . web-mode))

;; ;; ;; Flycheck
;; (require 'flycheck)
;; ;; disable jshint since we prefer eslint checking
;; (setq-default flycheck-disabled-checkers
;; 	      (append flycheck-disabled-checkers
;; 		      '(javascript-jshint)))

;; ;; use eslint with web-mode for jsx files
;; (flycheck-add-mode 'javascript-eslint 'web-mode)
;; (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
;; ;; (flycheck-add-mode 'javascript-eslint 'javascript-mode)





;; ;; ;; rjsx-mode
;; ;; ;; strict mode off
;; ;; (setq js2-strict-missing-semi-warning nil)
;; ;; (add-hook 'rjsx-mode-hook #'setup-tide-mode)

;; ;; ;; don't auto close new tags
;; ;; ;; (eval-after-load 'rjsx-mode
;; ;; ;;   '(progn
;; ;; ;;      (define-key rjsx-mode-map "<" nil)))

;; ;; (add-hook 'rjsx-mode-hook
;; ;;           (lambda ()
;; ;;             (when (string-equal "jsx" (file-name-extension buffer-file-name))
;; ;;               (setup-tide-mode))))
;; ;; ;; configure jsx-tide checker to run after your default jsx checker
;; ;; (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)









;; ;; Python debugger
;; (fset 'pdb
;;    "import pdb; pdb.set_trace()")
;; (global-set-key (kbd "C-x , p") 'pdb )


;; ;; This has something to do with screen splitting ie. C-x 2 etc
;; ;; (setq split-height-threshold nil)
;; ;; (setq split-width-threshold 0)

;; ;; IDO
;; (require 'ido)
;; (ido-mode t)

;; ;; Helm and Projectile
;; (require 'helm)

;; (global-set-key (kbd "M-x") #'helm-M-x)
;; (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)

;; (helm-mode 1)

;; (require 'helm-config)

;; (require 'helm-projectile)
;; (projectile-global-mode)
;; (setq projectile-completion-system 'helm)
;; (helm-projectile-on)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (omnisharp calm-forest color-theme use-package bundler git-timemachine git-time-metric magit web-mode ivy ag projectile-rails projectile company calmer-forest-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default (selected-frame) :height 100)
