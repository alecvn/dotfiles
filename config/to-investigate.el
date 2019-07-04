;; ;; Flycheck
;; ;; (require 'flycheck)


;; ;; tide
;; (require 'tide)
;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   ;; company is an optional dependency. You have to
;;   ;; install it separately via package-install
;;   (company-mode +1))





;;             :ensure t
;;	     :defer t
;;	     :mode (("\\.ios\\.js$" . web-mode)
;;	     :mode (("\\.ios\\.js$" . web-mode)
;; ;;          ("\\.android\\.js$" . web-mode)
;; ;;          ("\\.react\\.js$" . web-mode)
;; ;;          ("\\.js$" . web-mode))
;; ;;   :config
;; (require 'web-mode)
;; (setq web-mode-content-types-alist
;;       '(("jsx" . ".*\\.js[x]?\\'")))
;; (add-to-list 'magic-mode-alist '("^import React" . web-mode))
;; (add-to-list 'magic-mode-alist '("React.Component" . web-mode))
;; (add-to-list 'magic-mode-alist '("from 'react';$" . web-mode))
;; (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
;; (add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))

;; (with-eval-after-load 'flycheck
;;   (flycheck-add-mode 'javascript-eslint 'web-mode))

;; (add-hook 'web-mode-hook
;; 	  (lambda ()
;; 	    (If (equal web-mode-content-type "javascript")
;; 		(web-mode-set-content-type "jsx"))))
;; (setq-local web-mode-enable-auto-quoting nil)

;; (setq-default js-indent-level 4)

;; (add-hook 'web-mode-hook
;; 	  (lambda ()
;; 	    (setq web-mode-markup-indent-offset (symbol-value 'js-indent-level))
;; 	    (setq web-mode-attr-indent-offset (symbol-value 'js-indent-level))
;; 	    (setq web-mode-css-indent-offset (symbol-value 'js-indent-level))
;; 	    (setq web-mode-code-indent-offset (symbol-value 'js-indent-level))
;; 	    )
;; 	  )




;; ;; (require 'web-mode)
;; ;; (setq web-mode-content-types-alist
;; ;;       '(("jsx" . ".*\\.js[x]?\\'")))
;; ;; (add-to-list 'auto-mode-alist '("\\.jsx'" . web-mode))
;; ;; (add-to-list 'auto-mode-alist '("\\.tsx'" . web-mode))
;; ;; (add-to-list 'auto-mode-alist '(".*\\.js\\'" . web-mode))

;; ;; ;; Flycheck
;; (require 'flycheck)
;; ;; disable jshint since we prefer eslint checking
;; (setq-default flycheck-disabled-checkers
;; 	      (append flycheck-disabled-checkers
;; 		      '(javascript-jshint)))

;; ;; use eslint with web-mode for jsx files
;; (flycheck-add-mode 'javascript-eslint 'web-mode)
;; (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
;; ;; (flycheck-add-mode 'javascript-eslint 'javascript-mode)





;; ;; ;; rjsx-mode
;; ;; ;; strict mode off
;; ;; (setq js2-strict-missing-semi-warning nil)
;; ;; (add-hook 'rjsx-mode-hook #'setup-tide-mode)

;; ;; ;; don't auto close new tags
;; ;; ;; (eval-after-load 'rjsx-mode
;; ;; ;;   '(progn
;; ;; ;;      (define-key rjsx-mode-map "<" nil)))

;; ;; (add-hook 'rjsx-mode-hook
;; ;;           (lambda ()
;; ;;             (when (string-equal "jsx" (file-name-extension buffer-file-name))
;; ;;               (setup-tide-mode))))
;; ;; ;; configure jsx-tide checker to run after your default jsx checker
;; ;; (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)










;; ;; This has something to do with screen splitting ie. C-x 2 etc
;; ;; (setq split-height-threshold nil)
;; ;; (setq split-width-threshold 0)

;; ;; Helm and Projectile
;; (require 'helm)

;; (global-set-key (kbd "M-x") #'helm-M-x)
;; (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)

;; (helm-mode 1)

;; (require 'helm-config)

;; (require 'helm-projectile)
;; (projectile-global-mode)
;; (setq projectile-completion-system 'helm)
;; (helm-projectile-on)




(concat (all-the-icons-octicon "package" :height 1.1 :v-adjust 0.01)


(defmacro dashboard-insert-my-section(list action &rest rest)
    (message "%S" `list)
    (message "%S" `action)
    (message "%S" `@rest)
    `(when (car ,list)
       (mapc
	(lambda (el)
	  (let ((tag ,@rest))
	    (insert "\n    ")

	    (setq tag (concat icon " " ,@rest))))

	(widget-create 'item
		       :tag tag
		       :action ,action
		       :mouse-face 'highlight
		       :button-prefix ""
		       :button-suffix ""
		       :format "%[%t%]")))
    ,list)

  (defun dashboard-insert-list-of-packages-to-update(list-size)
    (insert (all-the-icons-faicon "upload" :height 1.2 :v-adjust 0.0 :face 'dashboard-heading))
    (insert " Package upgrades available:")
    (dashboard-insert-my-section
     (dashboard-subseq ,(auto-package-update-now) 0 ,list-size)
     (lambda (&rest ignore)
       (package-install-from-archive (cadr (assoc (intern ,el) package-archive-contents)))
       (dashboard-refresh-buffer))
     (concat (all-the-icons-octicon "package" :height 1.1 :v-adjust 0.01 :face 'dashboard-heading) (format "%s" el)))

    ;; (dashboard-insert-section
    ;;  "Package upgrades available:"
    ;;  (auto-package-update-now)
    ;;  list-size
    ;;  "u"
    ;;  `(lambda (&rest ignore)
    ;; 	(package-install-from-archive (cadr (assoc (intern ,el) package-archive-contents)))
    ;; 	(dashboard-refresh-buffer))
    ;;  (concat (all-the-icons-octicon "package" :height 1.1 :v-adjust 0.01 :face 'dashboard-heading) (format "%s" el)))
    )
