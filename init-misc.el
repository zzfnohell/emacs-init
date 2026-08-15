;;; init-misc.el --- miscellaneous -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:
(use-package desktop
  :ensure nil
  :defer t
  :init
  (setq desktop-restore-eager 10
        desktop-load-locked-desktop t)
  ;; Load/restore at end of init (not while requiring init-misc).
  :hook (after-init . desktop-save-mode))

;; recentf
(use-package recentf
  :ensure nil
  :defer t
  :commands find-file
  :config
  (setq-default recentf-max-saved-items 100)
  (add-to-list 'recentf-exclude "\\elpa")
  (add-to-list 'recentf-exclude "/tmp")
  (add-to-list 'recentf-exclude "/ssh:")
  (add-to-list 'recentf-exclude (concat package-user-dir "/.*-autoloads\\.el\\'"))
  (recentf-mode))

(use-package memory-usage
  :ensure t
  :defer t
  :commands memory-usage)

;;; projectile
;; Per projectile docs: enable after init and expose command map via
;; :bind-keymap (avoids :defer + enable-only-in-:config never loading).
(use-package projectile
  :ensure t
  :custom
  (projectile-require-project-root t)
  ;; t = transient (memory-only); 'persistent survives Emacs restarts
  (projectile-enable-caching 'persistent)
  (projectile-indexing-method 'alien)
  (projectile-globally-ignored-file-suffixes
   '("#" "~" ".swp" ".o" ".so" ".exe" ".dll" ".elc" ".pyc" ".jar"))
  (projectile-globally-ignored-directories
   '(".git" "node_modules" "__pycache__" ".vs" "bin" "obj" "build" "dist" "target"))
  (projectile-globally-ignored-files '("TAGS" "tags" ".DS_Store"))
  :bind-keymap
  (("s-p" . projectile-command-map)
   ("C-c p" . projectile-command-map))
  :hook (after-init . projectile-mode))

(message "[init] init-misc/projectile loaded")

;;; ICONS
(use-package all-the-icons
  :ensure t
  :defer t)

;; Slow Rendering
;; If you experience a slow down in performance when rendering multiple
;; icons simultaneously, you can try setting the following variable
(setq inhibit-compacting-font-caches t)

(message "[init] init-misc/ICONS loaded")

;;; ABBREV
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq-default abbrev-mode t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))
(setq save-abbrevs t)

(message "[init] init-misc/ABBREV loaded")


(use-package ssh-config-mode
  :ensure t
  :defer t
  ;; Package already registers autoloads for these patterns; only add
  ;; the extras that match its README (known_hosts, not knownhosts).
  :mode (("/\\.ssh/config\\'" . ssh-config-mode)
         ("/sshd?_config\\'" . ssh-config-mode)
         ("/known_hosts\\'" . ssh-known-hosts-mode)
         ("/authorized_keys2?\\'" . ssh-authorized-keys-mode))
  :hook (ssh-config-mode . turn-on-font-lock))
(message "[init] init-misc/ssh-config mode loaded")


(use-package ellocate
  :ensure t
  :defer t
  ;; :custom
  ;; ((ellocate-scan-dirs
  ;;  '(("~/" "~/.emacs.d/.ellocate-db/home-db")
  ;;    ("/mnt/" nil))))
  )


(setq dired-listing-switches "-alh")
(autoload 'dired "dired" nil t)

(when (eq system-type 'darwin)
  (setq dired-use-ls-dired nil))

(when (eq system-type 'windows-nt)
  (setq w32-get-true-file-attributes nil)
  (global-auto-revert-mode -1))

(use-package dired-rsync
  :ensure t
  :defer t
  :bind
  (:map dired-mode-map
        ( "C-c C-r" . dired-rsync))
  :commands dired-rsync
  ;;  :init
  ;;  (bind-key "C-c C-r" 'dired-rsync dired-mode-map)
  )

(use-package elgrep
  :ensure t
  :commands elgrep)

;; Nicer naming of buffers for files with identical names
(use-package uniquify
  :ensure nil
  :defer t
  :init
  (setq uniquify-buffer-name-style 'reverse
        uniquify-separator " • "
        uniquify-after-kill-buffer-p t
        uniquify-ignore-buffers-re "^\\*")
  ;; uniquify advises find-file-noselect; load once after init.
  :hook (after-init . (lambda () (require 'uniquify))))

(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(use-package logview
  :ensure t
  :defer t)

(use-package vlf
  :ensure t
  :defer t
  :commands vlf
  :config
  (require 'vlf-setup))

(use-package syslog-mode
  :ensure t
  :commands syslog-mode)

;; extra tools
(use-package rfc-mode
  :ensure t
  :autoload rfc-mode)

(use-package rg
  :ensure t
  :commands rg
  :config
  (rg-enable-menu))

(use-package tldr
  :ensure t
  :commands tldr)

;; git config --global github.user <your-github-user-name>
;; git config --global github.oauth-token <your-personal-access-token-with-gist-scope>
(use-package gist
  :ensure t
  :defer t)

(use-package httprepl
  :ensure t
  :commands httprepl)

(use-package syntree
  :ensure t
  :after org
  :commands syntree-new)

(use-package format-all
  :ensure t
  :commands (format-all-mode format-all-buffer format-all-region)
  ;; Docs: enable format-all-mode on prog-mode; ensure a formatter when
  ;; the minor mode turns on (not format-all-ensure-formatter on prog-mode).
  :hook ((prog-mode . format-all-mode)
         (format-all-mode . format-all-ensure-formatter))
  :bind ("C-c C-f" . format-all-buffer))

(use-package dabbrev
  :bind (("M-/" . #'dabbrev-completion))
  :custom
  (dabbrev-case-replace nil))

(use-package prodigy
  :defer t
  :bind
  (("C-c 8" . #'prodigy)
   :map prodigy-view-mode-map
   ("$" . #'end-of-buffer))
  :custom (prodigy-view-truncate-by-default t)
  :config
  (let ((srv-file "~/.emacs.d/services.el"))
    (when (file-exists-p srv-file)
      (load srv-file 'noerror))))

(use-package prescient
  :ensure t
  :defer t
  :config
  (prescient-persist-mode))

(defun set-transparency (alpha-level)
  (interactive "p")
  (message (format "Alpha level passed in: %s" alpha-level))
  (let ((alpha-level (if (< alpha-level 2)
                         (read-number "Opacity percentage: " 85)
                       alpha-level))
        (myalpha (frame-parameter nil 'alpha)))
    (set-frame-parameter nil 'alpha alpha-level))
  (message (format "Alpha level is %d" (frame-parameter nil 'alpha))))

;; (set-frame-parameter (selected-frame) 'alpha '(85 50))
;; (add-to-list 'default-frame-alist '(alpha 85 50))


;; scroll other window
(global-set-key (kbd "C-c C-v") 'scroll-other-window)
(global-set-key (kbd "C-c C-b") 'scroll-other-window-down)

;;; https://superuser.com/questions/132225/how-to-get-back-to-an-active-minibuffer-prompt-in-emacs-without-the-mouse
(defun switch-to-minibuffer-window ()
  "Switch to minibuffer window (if active)."
  (interactive)
  (when (active-minibuffer-window)
    (select-frame-set-input-focus (window-frame (active-minibuffer-window)))
    (select-window (active-minibuffer-window))))

(global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)

(use-package jq-mode
  :ensure t
  :defer t
  :mode
  (("\\.jq$" . jq-mode)))


(use-package jq-format
  :ensure t
  :after json-mode
  :defer t
  :commands
  (jq-format-json-buffer
   jq-format-json-region
   jq-format-jsonlines-buffer
   jq-format-jsonlines-region))

(message "[init] init-misc loaded")
(provide 'init-misc)

;;; init-misc.el ends here
