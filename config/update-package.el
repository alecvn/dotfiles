(require 'dash)

(defun my-package-up-to-date-p (package)
  (when (and (package-installed-p package)
             (cadr (assq package package-archive-contents)))
    (let* ((newest-desc (cadr (assq package package-archive-contents)))
           (installed-desc (cadr (or (assq package package-alist)
                                     (assq package package--builtins))))
           (newest-version  (package-desc-version newest-desc))
           (installed-version (package-desc-version installed-desc)))
      (version-list-<= newest-version installed-version))))

(defun my-package-out-of-date-p (package)
  (not (my-package-up-to-date-p package)))

(defun my-packages-to-install ()
  (delete-dups (-filter 'my-package-out-of-date-p package-activated-list)))

(provide 'update-package)
;;; update-package.el ends here
