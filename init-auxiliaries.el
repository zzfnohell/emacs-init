;;; init-auxiliaries.el --- Auxiliaries

;;; Commentary:
;; 

;;; Session
(use-package session
  :config (add-hook 'after-init-hook 'session-initialize))
  
(message "loading init-auxiliaries/Session done.")

;;; EDIFF
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(message "loading init-auxiliaries/EDIFF done.")

;;; DIRED
(require 'dired)
(setq dired-listing-switches "-alh")

(when (eq system-type 'windows-nt)
  (setq find-program (purecopy "gfind")))

(when (eq system-type 'darwin)
  (setq dired-use-ls-dired nil))

(when (eq system-type 'windows-nt)
  (setq w32-get-true-file-attributes nil)
  (global-auto-revert-mode -1))
  
(message "loading init-auxiliaries/DIRED done.")

;;; Regex 
(use-package visual-regexp)
(use-package regex-tool
  :ensure t
  :demand t)
  
(message "loading init-auxiliaries/Regex done.")

;;; RFC
(use-package rfc-mode
  :ensure t)

(message "loading init-auxiliaries/RFC done.")

;;; TRAMP
(require 'tramp-gvfs)

(message "loading init-auxiliaries/TRAMP done.")

(use-package httprepl
  :ensure t
  :demand t)

(message "loading init-auxiliaries/httprepl done.")

(use-package mqtt-mode
  :ensure t
  :demand t)
  
(message "loading init-auxiliaries/mqtt-mode done.")

(use-package rg
  :ensure t
  :demand t
  :config
  (rg-enable-menu))
  
(message "loading init-auxiliaries/rg done.")

(use-package logview
  :ensure t)
  
(message "loading init-auxiliaries/logview done.")

(use-package vlf
  :ensure t
  :config
  (require 'vlf-setup))
  
(message "loading init-auxiliaries/vlf done.")

;;; ERC
(setq erc-server-coding-system '(utf-8 . utf-8))
(setq erc-encoding-coding-alist '(("#linuxfire" . chinese-iso-8bit)))

(setq erc-nick "zzfnohell"
      erc-user-full-name "ZF.Z")

(require 'erc-log)
(erc-log-mode 1)
(setq erc-log-channels-directory "~/.emacs.d/log/erc/"
      erc-save-buffer-on-part t
      erc-log-file-coding-system 'utf-8
      erc-log-write-after-send t
      erc-log-write-after-insert t)

(unless (file-exists-p erc-log-channels-directory)
  (mkdir erc-log-channels-directory t))

(message "loading init-auxiliaries/ERC done.")

;;; SPEEDBAR
(require 'speedbar)

(message "loading init-auxiliaries/SPEEDBAR done.")

(use-package memory-usage
  :ensure t
  :demand t)
  
(message "loading init-auxiliaries/memory-usage done.")

;;; projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
  
(message "loading init-auxiliaries/projectile done.")

(use-package sr-speedbar
  :ensure t)
  
(message "loading init-auxiliaries/sr-speedbar done.")

(use-package minimap
  :ensure t
  :demand t)
  
(message "loading init-auxiliaries/minimap done.")

;;; ICONS
(use-package all-the-icons
  :ensure t
  :demand t)
;; Slow Rendering
;; If you experience a slow down in performance when rendering multiple
;; icons simultaneously, you can try setting the following variable
(setq inhibit-compacting-font-caches t)

(message "loading init-auxiliaries/ICONS done.")

;;; FUZZY
(use-package fuzzy
  :ensure t
  :demand t)
  
(message "loading init-auxiliaries/FUZZY done.")

;;; WINNUM
(use-package winum
  :ensure t
  :demand t
  :config
  (winum-mode))

;;; ABBREV
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq-default abbrev-mode t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))
(setq save-abbrevs t)

(message "loading init-auxiliaries/ABBREV done.")

;;; XTERM
(xterm-mouse-mode 1)

;;; TLDR
(use-package tldr
	:ensure t)
(message "loading init-auxiliaries/tldr done.")

(use-package telega
	:ensure t
	:init
	(setq telega-proxies
				(list
				 '(:server "sshost"
									 :port 2003
									 :enable :false
									 :type (:@type "proxyTypeSocks5")))))

(message "loading init-auxiliaries/telega done.")

(use-package bm
  :ensure t
  :demand t
	
  :init
  ;; restore on load (even before you require bm)
  (setq bm-restore-repository-on-load t)
	
	
  :config
  ;; Allow cross-buffer 'next'
  (setq bm-cycle-all-buffers t)
	
  ;; where to store persistant files
  (setq bm-repository-file "~/.emacs.d/bm-repository")
	
  ;; save bookmarks
  (setq-default bm-buffer-persistence t)
	
  ;; Loading the repository from file when on start up.
  (add-hook 'after-init-hook 'bm-repository-load)
	
  ;; Saving bookmarks
  (add-hook 'kill-buffer-hook #'bm-buffer-save)
	
  ;; Saving the repository to file when on exit.
  ;; kill-buffer-hook is not called when Emacs is killed, so we
  ;; must save all bookmarks first.
  (add-hook 'kill-emacs-hook #'(lambda nil
                                 (bm-buffer-save-all)
                                 (bm-repository-save)))

  ;; The `after-save-hook' is not necessary to use to achieve persistence,
  ;; but it makes the bookmark data in repository more in sync with the file
  ;; state.
  (add-hook 'after-save-hook #'bm-buffer-save)
	
  ;; Restoring bookmarks
  (add-hook 'find-file-hooks   #'bm-buffer-restore)
  (add-hook 'after-revert-hook #'bm-buffer-restore)
	
  ;; The `after-revert-hook' is not necessary to use to achieve persistence,
  ;; but it makes the bookmark data in repository more in sync with the file
  ;; state. This hook might cause trouble when using packages
  ;; that automatically reverts the buffer (like vc after a check-in).
  ;; This can easily be avoided if the package provides a hook that is
  ;; called before the buffer is reverted (like `vc-before-checkin-hook').
  ;; Then new bookmarks can be saved before the buffer is reverted.
  ;; Make sure bookmarks is saved before check-in (and revert-buffer)
  (add-hook 'vc-before-checkin-hook #'bm-buffer-save)
	
	
  :bind (("M-<f2>" . bm-next)
         ("S-<f2>" . bm-previous)
         ("C-<f2>" . bm-toggle))
  )

(message "loading init-auxiliaries/bm done.")

(use-package window-purpose
	:config
	(purpose-mode)

	(require 'window-purpose-x)
	(purpose-x-magit-multi-on)
	(purpose-x-kill-setup)
	
	(add-to-list 'purpose-user-mode-purposes
							 '(ggtags-global-mode . ggtags-global))
	(add-to-list 'purpose-user-mode-purposes
							 '(rg-mode . rg))
	;; (add-to-list 'purpose-user-mode-purposes '(<major-mode> . <purpose>))
	;; (add-to-list 'purpose-user-name-purposes '(<name> . <purpose>))
	;; (add-to-list 'purpose-user-regexp-purposes '(<pattern> . <purpose>))
	(setq purpose-use-default-configuration t) ; not really necessary, default is t
	(purpose-compile-user-configuration))

(message "loading init-auxiliaries/window-purpose done.")

(use-package perspective
	:bind (("C-x b" . persp-switch-to-buffer*)
         ("C-x k" . persp-kill-buffer*))
  :config
  (persp-mode))
(message "loading init-auxiliaries/perspective done.")

(use-package golden-ratio
	:config
	(golden-ratio-mode 1))
(message "loading init-auxiliaries/golden ratio")

(winner-mode)
(message "loading init-auxiliaries/winner mode done.")

(message "loading init-auxiliaries done.")

(provide 'init-auxiliaries)

;;; init-auxiliaries.el ends here
