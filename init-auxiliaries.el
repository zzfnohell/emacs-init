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

(message "loading init-auxiliaries done.")

(provide 'init-auxiliaries)

;;; init-auxiliaries.el ends here
