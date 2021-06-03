;; web mode
(use-package web-mode
  :ensure t
  :defer 5
  :mode "\\.html?\\'" "\\.phtml\\'" "\\.tpl\\.php\\'" "\\.jsp\\'"
  "\\.as[cp]x\\'" "\\.erb\\'" "\\.mustache\\'" "\\.djhtml\\'" "\\.blade.php\\'"
  :config
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-indentation-params '("lineup-args" . t))
  (setq web-mode-engines-alist
        '(("erb" . "\\.html\\'")
	  ("django"."\\.html\\'"))
        )
  )

(flycheck-add-mode 'javascript-eslint 'web-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

(use-package vue-mode
  :ensure t)
