(use-package ido
  :ensure t
  :config
  (ido-mode t)
  (setq ido-separator "\n")
  (setq ido-use-filename-at-point nil)
  )

(use-package ivy
  :ensure t
  :bind
  (("C-c C-o" . ivy-occur))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-use-selectable-prompt t)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-re-builders-alist
	;; allow input not in order
        '((t   . ivy--regex-ignore-order)))
  (setq search-default-mode #'char-fold-to-regexp)
  (setq enable-recursive-minibuffers t))

(use-package ivy-prescient
  :ensure t
  :config
  (ivy-prescient-mode)
  (add-to-list 'ivy-prescient-sort-commands 'kill-ring t)
  (add-to-list 'ivy-prescient-sort-commands 'counsel-yank-pop t))

(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs
	'("~/.emacs.d/elpa/yasnippet-snippets-20190513.1049/snippets"))
  (yas-global-mode 1))

(use-package company
  :ensure t
  :config
  (use-package company-tern :ensure t)
  (add-hook 'after-init-hook 'global-company-mode)
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-tern)
    (add-to-list 'company-backends 'company-robe)
    (global-set-key (kbd "M-SPC") 'company-complete)
    )
  (setq company-idle-delay 0))
