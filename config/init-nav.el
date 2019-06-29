;; macro to revert buffer
;; (fset 'alec-revert-buffer
;;    [?\M-x ?r ?e ?v ?e ?r ?t ?- ?b ?u ?f ?f ?e ?r return ?y ?e ?s return])
;; (global-set-key [f6] 'alec-revert-buffer)

(global-set-key (kbd "M-i") 'imenu)

;; desktop
(global-set-key (kbd "<C-f1>") 'desktop-save)
(global-set-key (kbd "<C-f2>") 'desktop-read)
(global-set-key (kbd "<C-f3>") 'desktop-clear)

;; ivy
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))


;; projectile
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-completion-system 'ivy)
  (setq projectile-switch-project-action 'projectile-commander)
  (def-projectile-commander-method ?s
    "Open a *shell* buffer for the project."
    (projectile-run-shell))
  (def-projectile-commander-method ?d
    "Open project root in dired."
    (projectile-dired))
)

(use-package projectile-rails
  :ensure t
  :config
  (projectile-rails-global-mode)
  (setq projectile-rails-vanilla-command "bin/rails")
  (setq projectile-rails-spring-command "bin/rails"))

(use-package inf-ruby
  :ensure t
  :config
  (add-hook 'after-init-hook 'inf-ruby-switch-setup) ;; hit C-x C-q when breakpoint is hit
)

;; ido
(use-package ido
  :ensure t
  :config
  (ido-mode t)
  (setq ido-separator "\n")
  (setq ido-use-filename-at-point 'guess))

;; Company
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)

  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-tern)
    (global-set-key (kbd "M-SPC") 'company-complete)
    )
  (setq company-idle-delay 0))

;; yasnippet
(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs
	'("/home/alec/.emacs.d/elpa/yasnippet-snippets-20190513.1049/snippets"))
  (yas-global-mode 1))
