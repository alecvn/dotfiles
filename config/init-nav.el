;; Macro to revert buffer
;; (global-set-key [f6] 'revert-buffer)

;; Provides class and method overview
(global-set-key (kbd "M-i") 'imenu)

(setq mouse-yank-at-point t)

;; Silversearcher
(use-package ag
  :ensure t
  :config
  (setq ag-highlight-search t)
  (add-hook 'ag-mode-hook 'toggle-truncate-lines))

;; Provides versions of common Emacs commands which use Ivy
(use-package counsel
  :ensure t
  :init
  (global-set-key (kbd "M-y") 'counsel-yank-pop))

;; iSearcher with an overview
(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)))
;;(global-set-key (kbd "C-s") (lambda () (interactive)
;;			      (swiper (format "%s" (let ((sym (thing-at-point 'symbol))) (if sym sym ""))))))

;; Project viewer
(use-package projectile
  :ensure t
  :init
  (projectile-global-mode)
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p s") 'counsel-projectile-ag)
  (define-key projectile-mode-map (kbd "C-c p x") 'projectile-compile-project)
  (define-key projectile-mode-map (kbd "C-c p c") 'counsel-projectile-org-capture)
  (setq projectile-completion-system 'ivy)
  (setq projectile-switch-project-action 'projectile-commander)
  (def-projectile-commander-method ?s
    "Open a *eshell* buffer for the project."
    (projectile-run-eshell))
  (def-projectile-commander-method ?x
    "Run `compile' in the project."
    (projectile-compile-project nil))
  (def-projectile-commander-method ?d
    "Open project root in dired."
    (projectile-dired))
  (def-projectile-commander-method ?a
    "Run ag on project."
    (counsel-projectile-ag))
  (def-projectile-commander-method ?g
    "Run magit-status on project."
    (magit-status))
  (use-package counsel-projectile
    :ensure t
    :init
    (setq counsel-projectile-org-capture-templates
	  '(("w" "Task"
	     entry (file+olp "~/org/gtd/id-${name}.org" "DEVELOPMENT" "sprint2714 Inbox")
	     "* TODO %?\n  %u\n  %a" :empty-lines 1)))))

;; Projects on Rails
(use-package projectile-rails
  :ensure t
  :config
  (projectile-rails-global-mode)
  (add-hook 'projectile-rails-mode-hook 'compilation-shell-minor-mode)
  (setq projectile-rails-vanilla-command "bin/rails")
  (setq projectile-rails-spring-command "bin/rails"))
