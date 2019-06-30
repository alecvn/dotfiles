;; web mode
(use-package web-mode
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)))
