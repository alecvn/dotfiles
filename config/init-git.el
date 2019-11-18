;; Git version control
(use-package magit
  :ensure t
  :init
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package git-timemachine :ensure t)
