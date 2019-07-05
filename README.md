# Desktop Environment
Latest desktop environment configuration

## Installation

### 1. Install Kubuntu 18.04

### 2. Install i3-gaps
https://github.com/Airblader/i3

### 3. Follow guide to configure i3-gaps sitting on top of Plasma
https://github.com/avivace/dotfiles
- Copy i3 config
- Copy plasma-workspace bash file
- install compton
- install wmctrl
- sudo mv /usr/bin/ksplashqml /usr/bin/ksplashqml.old
- double check plasma-workspace wm.sh file to see that it's invoking i3 from the correct path:  /usr/bin/i3 not /usr/local/bin/i3
- install feh and put a background image at ~/Pictures/wallpaper.jpg (or change this in the i3 config)




## Emacs

### Clone dotfiles repo and symlink
Any dotfiles copied from another machine needs the following command executed within the folder:
    
    find . -type f -print0 | xargs -0 chmod 400

Symlink the config files

    ln -s ~/dotfiles/emacs.el ~/.emacs.d/init.el
    ln -s ~/dotfiles/i3_config ~/.config/i3/config
    ln -s ~/dotfiles/config ~/.emacs.d/config
	
### Configuring emacs-dashboard

This is my customized version of [emacs-dashboard]: https://github.com/emacs-dashboard/emacs-dashboard and includes a section for displaying outdated packages.  Navigation options like section shortcuts are available.

To interact with the package update manager, your options are:

- `C-c r` or click/`Enter` on the `Refresh` button to have your package archive refreshed asynchonously.
- `C-c u` or click/`Enter` on the `Update` button to upgrade all your packages.
- go to the "Package upgrades available:" section with shortcut `u` and `Enter` on a package to upgrade.

You need the `update-package.el` file inside the `config` directory for per package updating to work.  If you place it somewhere other than `~/.emacs.d/config` you will need to update the `load-file` line that sources it accordingly.

	(use-package dashboard
	  :ensure t
	  :init
	  ;; Requirements for dashboard
	  (use-package all-the-icons
	    :ensure t
	    :config
	    (when (not (member "all-the-icons" (font-family-list)))
		  (all-the-icons-install-fonts t)))
	  (use-package auto-package-update :ensure t)
	  (use-package page-break-lines :ensure t)
	  :demand
	  :bind (:map dashboard-mode-map
			  ("C-c r" . (lambda () (interactive) (package-refresh-contents t)))
			  ("C-c u" . auto-package-update-now))
	  :custom
	  (show-week-agenda-p t)
	  (dashboard-set-heading-icons t)
	  (dashboard-center-content t)
	  (dashboard-set-file-icons t)
	  (dashboard-set-footer nil)
	  (dashboard-set-navigator t)
	  (dashboard-navigator-buttons
	   `(
		 ((,(and (display-graphic-p)
			 (all-the-icons-material "update" :height 1.2 :v-adjust -0.24))
		   "Refresh"
		   "Refresh packages"
		   (lambda (&rest _) (package-refresh-contents t)))
		 (,(and (display-graphic-p)
		   (all-the-icons-faicon "upload" :height 1.2 :v-adjust 0.0))
		 "Update"
		 "Update emacs"
		 (lambda (&rest _) (auto-package-update-now))))))
	  :config
	  (require 'dashboard-widgets)
	  (load-file  "~/.emacs.d/config/update-package.el")
	  (require 'update-package)

	  (defun dashboard-insert-list-of-packages-to-update(list-size)
		(insert (all-the-icons-faicon "upload" :height 1.2 :v-adjust 0.0 :face 'dashboard-heading))
		(dashboard-insert-section
		 "Package upgrades available:"
		 (my-packages-to-install)
		 list-size
		 "u"
		 `(lambda (&rest ignore)
			(package-install-from-archive (cadr (assoc ',el package-archive-contents)))
			(dashboard-refresh-buffer))
		 (format "%s" el)))

		(add-to-list 'dashboard-item-generators '(list-of-packages-to-update . dashboard-insert-list-of-packages-to-update))

	  (setq dashboard-items '((agenda . 5)
				  (projects . 5)
				  (recents  . 5)
				  (list-of-packages-to-update . 20)))
	  (dashboard-setup-startup-hook))



## Additional software
Install lastfm scrobbler
https://github.com/lastfm/lastfm-desktop

Install Mellow Player
https://colinduquesnoy.gitlab.io/MellowPlayer/
