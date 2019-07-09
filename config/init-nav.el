;; Macro to revert buffer
;; (global-set-key [f6] 'revert-buffer)

;; Provides class and method overview
(global-set-key (kbd "M-i") 'imenu)

;; Silversearcher
(use-package ag :ensure t)

(global-set-key (kbd "C-x g") 'magit-status)

;; Git version control
(use-package magit :ensure t)

;; Provides versions of common Emacs commands which use Ivy
(use-package counsel :ensure t)

;; iSearcher with an overview
(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)))

;; Completion mechanism
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

;; Project viewer
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

;; Projects on Rails
(use-package projectile-rails
  :ensure t
  :config
  (projectile-rails-global-mode)
  (add-hook 'projectile-rails-mode-hook 'compilation-shell-minor-mode)
  (setq projectile-rails-vanilla-command "bin/rails")
  (setq projectile-rails-spring-command "bin/rails"))

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
  (use-package company-tern :ensure t)
  (add-hook 'after-init-hook 'global-company-mode)
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-tern)
    (global-set-key (kbd "M-SPC") 'company-complete)
    )
  (setq company-idle-delay 0)
)

;; Yasnippet
(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs
	'("/home/alec/.emacs.d/elpa/yasnippet-snippets-20190513.1049/snippets"))
  (yas-global-mode 1))
