;;; init-misc.el --- miscellaneous -*- lexical-binding: t -*-

;;; Commentary:
;; 

;;; Code:

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


(when (not (eq system-type 'windows-nt))
	(use-package ellocate
	:ensure t
	:custom
	((ellocate-scan-dirs
		'(("~/" "~/.emacs.d/.ellocate-db/home-db")
			("/mnt/" nil))))))

(message "loading init-misc done.")
(provide 'init-misc)

;;; init-misc.el ends here
