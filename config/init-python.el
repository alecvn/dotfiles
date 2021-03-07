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
  (add-hook 'python-mode-hook 'my/jedi-python-mode-hook)
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
  (fset 'ipdb "import ipdb; ipdb.set_trace()")
  :bind (:map python-mode-map
	      ("C-x , p" . pdb)
              ("C-c ." . jedi:goto-definition)
              ("C-c ," . jedi:goto-definition-pop-marker)
              )
  )

;; flycheck
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode t)
  )
;; flycheck-pycheckers
;; Allows multiple syntax checkers to run in parallel on Python code
;; Ideal use-case: pyflakes for syntax combined with mypy for typing
(use-package flycheck-pycheckers
  :after flycheck
  :ensure t
  :init
  (with-eval-after-load 'flycheck
    (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup)
    )
  (setq flycheck-pycheckers-checkers
    '(
      mypy3
      pyflakes
      )
    )
  )
;; elpy
(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  (setq elpy-rpc-virtualenv-path 'current)
  (setq elpy-syntax-check-command "~/.pyenv/shims/pyflakes") ;; or replace with the path to your pyflakes binary
  ;; allows Elpy to see virtualenv
  (add-hook 'elpy-mode-hook
        ;; pyvenv-mode
        '(lambda ()
           (pyvenv-mode +1)
           )
        )
  ;; use flycheck instead of flymake
  (when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
  )
