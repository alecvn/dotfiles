;; History searching already available through M-r, C-r to cycle

(add-hook 'shell-mode-hook (lambda () (goto-address-mode)))
(add-hook 'shell-mode-hook 'compilation-shell-minor-mode)
(add-hook 'shell-mode-hook 'my-shell-mode-hook)
(defun my-shell-mode-hook ()
  (setq comint-input-ring-file-name "~/.bash_history")
  (comint-read-input-ring t))
