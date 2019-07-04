;; web mode
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'web-mode-indentation-params '("lineup-args" . t)))
