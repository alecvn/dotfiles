;; Works best with Emacs 26.2

;; Install use-package if necessary
(require 'package)
;; This stops package-initialize from being called
;; twice during start-up decreasing start-up time
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package diminish :ensure t)

;; Inherits environment variables from the shell
(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

(load-file "~/.emacs.d/config/init-face.el")
(load-file "~/.emacs.d/config/init-org.el")
(load-file "~/.emacs.d/config/init-nav.el")

(load-file "~/.emacs.d/config/init-ruby.el")
(load-file "~/.emacs.d/config/init-python.el")
(load-file "~/.emacs.d/config/init-web.el")
(load-file "~/.emacs.d/config/init-csharp.el")
