(use-package python
  :ensure t
  :init
  (add-hook 'python-mode-hook 'blacken-mode)
  (fset 'pdb "import pdb; pdb.set_trace()")
  :bind (:map python-mode-map
         ("C-x , p" . pdb))
  )

(use-package blacken
  :ensure t
  :ensure-system-package (black . "pip3 install black")
)
