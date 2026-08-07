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


(defun init-misc/dired-rainbow-setup ()
  (require 'dired-rainbow)
  (progn
    (dired-rainbow-define-chmod directory "#6cb2eb" "d.*")
    (dired-rainbow-define html "#eb5286" ("css" "less" "sass" "scss" "htm" "html" "jhtm" "mht" "eml" "mustache" "xhtml"))
    (dired-rainbow-define xml "#f2d024" ("xml" "xsd" "xsl" "xslt" "wsdl" "bib" "json" "msg" "pgn" "rss" "yaml" "yml" "rdata"))
    (dired-rainbow-define document "#9561e2" ("docm" "doc" "docx" "odb" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub" "odp" "ppt" "pptx"))
    (dired-rainbow-define markdown "#696969" ("org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textfile" "txt"))
    (dired-rainbow-define database "#6574cd" ("xlsx" "xls" "csv" "accdb" "db" "mdb" "sqlite" "nc"))
    (dired-rainbow-define media "#de751f" ("mp3" "mp4" "MP3" "MP4" "avi" "mpeg" "mpg" "flv" "ogg" "mov" "mid" "midi" "wav" "aiff" "flac"))
    (dired-rainbow-define image "#f66d9b" ("tiff" "tif" "cdr" "gif" "ico" "jpeg" "jpg" "png" "psd" "eps" "svg"))
    (dired-rainbow-define log "#c17d11" ("log"))
    (dired-rainbow-define shell "#f6993f" ("awk" "bash" "bat" "sed" "sh" "zsh" "vim"))
    (dired-rainbow-define interpreted "#38c172" ("py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js"))
    (dired-rainbow-define compiled "#4dc0b5" ("asm" "cl" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "m" "cc" "cs" "cp" "cpp" "go" "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" ".java"))
    (dired-rainbow-define executable "#8cc4ff" ("exe" "msi"))
    (dired-rainbow-define compressed "#51d88a" ("7z" "zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
    (dired-rainbow-define packaged "#faad63" ("deb" "rpm" "apk" "jad" "jar" "cab" "pak" "pk3" "vdf" "vpk" "bsp"))
    (dired-rainbow-define encrypted "#ffed4a" ("gpg" "pgp" "asc" "bfe" "enc" "signature" "sig" "p12" "pem"))
    (dired-rainbow-define fonts "#6cb2eb" ("afm" "fon" "fnt" "pfb" "pfm" "ttf" "otf"))
    (dired-rainbow-define partition "#e3342f" ("dmg" "iso" "bin" "nrg" "qcow" "toast" "vcd" "vmdk" "bak"))
    (dired-rainbow-define vc "#0074d9" ("git" "gitignore" "gitattributes" "gitmodules"))
    (dired-rainbow-define-chmod executable-unix "#38c172" "-.*x.*")))

(use-package dired-rainbow
  :ensure t
  :defer t
  :after dired
  :hook (dired-mode . init-misc/dired-rainbow-setup))

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
