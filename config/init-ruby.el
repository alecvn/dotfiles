;; rbenv
(use-package rbenv
  :ensure t
  :config
  (global-rbenv-mode)
  (rbenv-use-global))

(use-package inf-ruby
  :ensure t
  :config
  (add-hook 'after-init-hook 'inf-ruby-switch-setup) ;; hit C-x C-q when breakpoint is hit
)
