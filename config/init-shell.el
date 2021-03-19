(global-set-key (kbd "C-c M-o") 'comint-clear-buffer)
(use-package shx :ensure t)
(shx-global-mode 1)

;; History searching already available through M-r, C-r to cycle

(defun my-shell-mode-hook ()
  (setq comint-input-ring-file-name "~/.bash_history")
  (comint-read-input-ring t))

(defun disable-company-mode ()
    (company-mode -1))

(add-hook 'shell-mode-hook (lambda () (goto-address-mode)))
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
(add-hook 'shell-mode-hook 'my-shell-mode-hook)
(add-hook 'shx-mode-hook 'disable-company-mode)
