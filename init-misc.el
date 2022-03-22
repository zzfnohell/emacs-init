;;; init-misc.el --- miscellaneous -*- lexical-binding: t -*-

;;; Commentary:
;; 

;;; Code:
(use-package session
  :config (add-hook 'after-init-hook 'session-initialize))

;; recentf
(require 'recentf)
(add-hook 'after-init-hook 'recentf-mode)
(setq-default
 recentf-max-saved-items 1000
 recentf-exclude `("/tmp/" "/ssh:" ,(concat package-user-dir "/.*-autoloads\\.el\\'")))

(use-package memory-usage
  :ensure t)
  
(message "loading init-misc/memory-usage done.")

;;; projectile
(use-package projectile
	:custom
	(projectile-require-project-root t)
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
  
(message "loading init-misc/projectile done.")

;;; ICONS
(use-package all-the-icons
  :ensure t)

;; Slow Rendering
;; If you experience a slow down in performance when rendering multiple
;; icons simultaneously, you can try setting the following variable
(setq inhibit-compacting-font-caches t)

(message "loading init-misc/ICONS done.")

;;; FUZZY
(use-package fuzzy
  :ensure t)
  
(message "loading init-misc/FUZZY done.")

;;; ABBREV
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq-default abbrev-mode t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))
(setq save-abbrevs t)

(message "loading init-misc/ABBREV done.")


(use-package ssh-config-mode
	:config
	(autoload 'ssh-config-mode "ssh-config-mode" t)
  (add-to-list 'auto-mode-alist '("/\\.ssh/config\\'"     . ssh-config-mode))
  (add-to-list 'auto-mode-alist '("/sshd?_config\\'"      . ssh-config-mode))
  (add-to-list 'auto-mode-alist '("/knownhosts\\'"       . ssh-known-hosts-mode))
  (add-to-list 'auto-mode-alist '("/authorized_keys2?\\'" . ssh-authorized-keys-mode))
  (add-hook 'ssh-config-mode-hook 'turn-on-font-lock))
(message "loading init-misc/ssh-config mode done.")


(use-package ellocate
	:ensure t
	;; :custom
	;; ((ellocate-scan-dirs
	;; 	'(("~/" "~/.emacs.d/.ellocate-db/home-db")
	;; 		("/mnt/" nil))))
  )


(require 'dired)
(setq dired-listing-switches "-alh")

(when (eq system-type 'darwin)
  (setq dired-use-ls-dired nil))

(when (eq system-type 'windows-nt)
  (setq w32-get-true-file-attributes nil)
  (global-auto-revert-mode -1))

(require 'tramp-gvfs)

(use-package dired-rsync
  :config
  (bind-key "C-c C-r" 'dired-rsync dired-mode-map))

(use-package elgrep
  :ensure t)

;; Nicer naming of buffers for files with identical names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(use-package logview
  :ensure t)

(use-package vlf
  :ensure t
  :config
  (require 'vlf-setup))

(use-package syslog-mode
	:ensure t)

;; extra tools
(use-package rfc-mode
  :ensure t)

(use-package mqtt-mode
  :ensure t)

(use-package rg
  :ensure t
  :ensure-system-package
  (rg . ripgrep)
  :config
  (rg-enable-menu))

(use-package tldr
	:ensure t)

;; git config --global github.user <your-github-user-name>
;; git config --global github.oauth-token <your-personal-access-token-with-gist-scope>
(use-package gist
	:ensure t)

(use-package httprepl
  :ensure t)

(message "loading init-misc done.")
(provide 'init-misc)

;;; init-misc.el ends here
