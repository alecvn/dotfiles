(use-package restclient :ensure t)
(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))

(require 'url-util)
