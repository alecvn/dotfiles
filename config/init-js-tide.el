(require 'use-package)

(use-package json-mode
  :ensure t
  )

(use-package company
  :custom
  (company-dabbrev-downcase nil)
  (company-dabbrev-ignore-case nil)
  (company-idle-delay 0)
  :config
  (global-company-mode)
  :general
  (:keymaps 'company-active-map
            "C-n" 'company-select-next
            "C-p" 'company-select-previous
            "C-f" 'company-filter-candidates))

(use-package prettier
  :hook
  ((typescript-mode json-mode) . prettier-mode))

(use-package typescript-mode
  :mode "\\.tsx?$"
  :hook
  (typescript-mode . lsp)
  :custom
  (typescript-indent-level 2))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck web-mode)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         )
  :config
  (define-key tide-mode-map (kbd "C-c .") 'tide-jump-to-definition)
  (define-key tide-mode-map (kbd "C-c ,") 'tide-jump-back)
  (define-key tide-mode-map (kbd "C-c r") 'tide-rename-symbol)
  (add-to-list 'flycheck-disabled-checkers 'tsx-tide)
  (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
  (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
  )

(setq company-tooltip-align-annotations t)

(use-package web-mode
  :ensure t
  :config
  (progn
    (defun my-web-mode-js-hook()
      
      (flycheck-mode 0)
      (if (equal web-mode-content-type "jsx")
          (setup-tide-mode)
        (flycheck-mode 1)
        )
    
      (when (string-equal "tsx" (file-name-extension buffer-file-name))
        (setup-tide-mode)
        (flycheck-mode 1)
        )
      )

    (add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

    ;; (flycheck-add-mode 'typescript-tslint 'web-mode)

    )
  (setq web-mode-content-types-alist '(("jsx"  . "\\.js[x]?\\'")))
  (add-hook 'web-mode-hook 'my-web-mode-js-hook)
  (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  )

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint json-jsonlist)))
;; (add-hook 'flycheck-mode-hook 'add-node-modules-path)
;; (eval-after-load
;;   'typescript-mode
;;   '(add-hook 'typescript-mode-hook #'add-node-modules-path))
;; (defun web-mode-init-prettier-hook ()
;;   (add-node-modules-path)
;;   (prettier-js-mode))
;; (add-hook 'web-mode-hook  'web-mode-init-prettier-hook)
;; (add-hook 'after-save-hook 'prettier-js-mode)

(provide 'init-js-tide)
;;; init-js-tide.el ends here
