;; Git version control
(use-package magit
  :ensure t
  :init
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package git-timemachine :ensure t)
