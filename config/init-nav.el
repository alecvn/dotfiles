;; Macro to revert buffer
(global-set-key [f6] 'revert-buffer)
(use-package so-long :ensure t)
(global-so-long-mode 1)

(global-set-key (kbd "H-p") 'previous-buffer)
(global-set-key (kbd "H-n") 'next-buffer)

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(global-set-key (kbd "H-j") 'windmove-left)
(global-set-key (kbd "H-l") 'windmove-right)
(global-set-key (kbd "H-i") 'windmove-up)
(global-set-key (kbd "H-k") 'windmove-down)


(use-package buffer-move
  :ensure t
  :config
  (global-set-key (kbd "H-M-i") 'buf-move-up)
  (global-set-key (kbd "H-M-k") 'buf-move-down)
  (global-set-key (kbd "H-M-j") 'buf-move-left)
  (global-set-key (kbd "H-M-l") 'buf-move-right)
  )

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))
(global-set-key (kbd "C-x |") 'toggle-window-split)

;; Provides class and method overview
(global-set-key (kbd "M-i") 'imenu)

(setq mouse-yank-at-point t)

;; Silversearcher
(use-package ag
  :ensure t
  :config
  (setq ag-highlight-search t)
  (add-hook 'ag-mode-hook 'toggle-truncate-lines))

;; Provides versions of common Emacs commands which use Ivy
(use-package counsel
  :ensure t
  :init
  (global-set-key (kbd "M-y") 'counsel-yank-pop))

(use-package wgrep :ensure t)

;; iSearcher with an overview
(use-package swiper
  :ensure t
  :init
  (setq swiper-use-visual-line nil)
  (setq swiper-use-visual-line-p (lambda (a) nil))
  :bind (
	 ("C-s" . swiper)
	 ("C-M-s" . swiper-thing-at-point)
	 )
  )
;;(global-set-key (kbd "C-s") (lambda () (interactive)
;;			      (swiper (format "%s" (let ((sym (thing-at-point 'symbol))) (if sym sym ""))))))
(global-set-key (kbd "C-z") 'isearch-forward)
(define-key isearch-mode-map "\C-z" 'isearch-repeat-forward)

;; Project viewer
(use-package projectile
  :ensure t
  :init
  (projectile-global-mode)
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p s") 'counsel-projectile-ag)
  (define-key projectile-mode-map (kbd "C-c p e") 'projectile-run-shell)
  (define-key projectile-mode-map (kbd "C-c p x") 'projectile-compile-project)
  (define-key projectile-mode-map (kbd "C-c p c") 'counsel-projectile-org-capture)
  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'hybrid)
  ;; (setq projectile-sort-order 'recently-active)
  (setq projectile-globally-ignored-file-suffixes '("~" "#"))
  (setq projectile-globally-unignored-files '("gtd.org"))
  (setq projectile-completion-system 'ivy)
  (setq projectile-switch-project-action 'projectile-commander)
  (def-projectile-commander-method ?s
    "Open a *shell* buffer for the project."
    (projectile-run-shell))
  (def-projectile-commander-method ?x
    "Run `compile' in the project."
    (projectile-compile-project nil))
  (def-projectile-commander-method ?d
    "Open project root in dired."
    (projectile-dired))
  (def-projectile-commander-method ?a
    "Run ag on project."
    (counsel-projectile-ag))
  (def-projectile-commander-method ?g
    "Run magit-status on project."
    (magit-status))
  (use-package counsel-projectile
    :ensure t
    :init
    (setq counsel-projectile-org-capture-templates
	  '(("w" "Task"
	     entry (file+olp "~/org/gtd/id-${name}.org" "DEVELOPMENT" "sprint2714 Inbox")
	     "* TODO %?\n  %u\n  %a" :empty-lines 1)))))


;; Projects on Rails
(use-package projectile-rails
  :ensure t
  :config
  (define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map)
  (projectile-rails-global-mode)
  (add-hook 'projectile-rails-mode-hook 'compilation-shell-minor-mode)
  (setq projectile-rails-vanilla-command "bin/rails")
  (setq projectile-rails-spring-command "bin/rails"))
