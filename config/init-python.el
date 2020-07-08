(use-package py-isort
  :ensure t
  )

(use-package blacken
  :ensure t
  ;;:ensure-system-package (black . "pip3 install black")
  )

(use-package company
  :ensure t
  )

(use-package company-jedi
  :ensure t
  :config
  (defun my/jedi-python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'my/python-mode-hook)
  )

(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'python-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'bitmap)
  (setq highlight-indent-guides-auto-enabled t)
  )

(use-package python
  :ensure t
  :init
  (setq python-shell-interpreter "python3")
  (add-hook 'python-mode-hook 'blacken-mode)
  (fset 'pdb "import pdb; pdb.set_trace()")
  :bind (:map python-mode-map
	      ("C-x , p" . pdb)
              ("C-c ." . jedi:goto-definition)
              ("C-c ," . jedi:goto-definition-pop-marker)
              )

  )
