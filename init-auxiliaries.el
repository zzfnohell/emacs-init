;;; init-auxiliaries.el --- Auxiliaries

;;; Commentary:
;; 

;;; Session
(use-package session
  :config (add-hook 'after-init-hook 'session-initialize))

;;; EDIFF
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


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

;;; Regex 
(use-package visual-regexp)
(use-package regex-tool
  :ensure t
  :demand t)

;;; RFC
(use-package rfc-mode
  :ensure t)

;;; TRAMP
(require 'tramp-gvfs)

(use-package httprepl
  :ensure t
  :demand t)

(use-package mqtt-mode
  :ensure t
  :demand t)

(use-package rg
  :ensure t
  :demand t
  :config
  (rg-enable-menu))

(use-package logview
  :ensure t)

(use-package vlf
  :ensure t
  :config (require 'vlf-setup))

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

;;; SPEEDBAR
(require 'speedbar)

(use-package memory-usage
  :ensure t
  :demand t)

(use-package projectile
  :ensure t
  :demand t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package sr-speedbar
  :ensure t)

(use-package minimap
  :ensure t
  :demand t)

;;; ICONS
(use-package all-the-icons
  :ensure t
  :demand t)
;; Slow Rendering
;; If you experience a slow down in performance when rendering multiple
;; icons simultaneously, you can try setting the following variable
(setq inhibit-compacting-font-caches t)

;;; FUZZY
(use-package fuzzy
  :ensure t
  :demand t)

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

;;; XTERM
(xterm-mouse-mode 1)

(message "loading init-auxiliaries done.")

(provide 'init-auxiliaries)

;;; init-auxiliaries.el ends here
