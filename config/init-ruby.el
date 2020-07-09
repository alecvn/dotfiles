(setq ruby-deep-indent-paren nil)

(use-package rbenv
  :ensure t
  :config
  (global-rbenv-mode)
  (rbenv-use-global))

(use-package rvm :ensure t)

(use-package inf-ruby
  :ensure t
  :init
  ;; hit C-x C-q when breakpoint is hit
  (add-hook 'after-init-hook 'inf-ruby-switch-setup)
  (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
    (rvm-activate-corresponding-ruby)))

(use-package flymake-ruby
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'flymake-ruby-load))

(use-package robe
  :ensure t
  :config
  (add-hook 'ruby-mode-hook 'robe-mode))
  ;; this needs to be done manually for now as robe needs to be started in context of dev environment
  ;; (with-eval-after-load 'robe
  ;;   (inf-ruby)
  ;;   (robe-start)))


(use-package company-inf-ruby
  :ensure t
  :config
  (add-to-list 'company-backends 'company-inf-ruby)
  )

(use-package enh-ruby-mode
  :ensure t
  :config
  (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
  ;; (setq enh-ruby-bounce-deep-indent t)
  ;; (setq enh-ruby-bounce-deep-indent-paren t)
  ;; (setq enh-ruby-hanging-brace-indent-level 2)
  ;; (setq enh-ruby-hanging-paren-deep-indent-level 2)
  ;; (setq enh-ruby-hanging-indent-level 2)
  ;; (setq enh-ruby-indent-level 2)
  (add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
  )

(use-package web-mode
  :ensure t
  :config
  (progn
    (defun my-web-mode-erb-hook()
      (if (equal web-mode-engine "erb")
          (setq web-mode-markup-indent-offset 4)
        )
      )
    (add-hook 'web-mode-hook 'my-web-mode-erb-hook)
    )
  )
