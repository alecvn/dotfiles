(global-set-key (kbd "C-c M-o") 'comint-clear-buffer)

(shx-global-mode 1)

;; History searching already available through M-r, C-r to cycle

(defun my-shell-mode-hook ()
  (setq comint-input-ring-file-name "~/.bash_history")
  (comint-read-input-ring t))

(add-hook 'shell-mode-hook (lambda () (goto-address-mode)))
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
(add-hook 'shell-mode-hook 'my-shell-mode-hook)
