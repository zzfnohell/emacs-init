;;; init-edit.el --- edit -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

;; coding system

(set-charset-priority 'unicode)
(define-coding-system-alias 'cp65001 'utf-8)
(prefer-coding-system 'utf-8)

(when (eq system-type 'windows-nt)
  (setq system-time-locale "C")
  (set-language-environment "UTF-8")) 

;; (set-default-coding-systems 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; (set-buffer-file-coding-system 'utf-8)
;; (set-file-name-coding-system 'utf-8)
;; (modify-coding-system-alist 'process "*" 'utf-8)
;; (set-buffer-process-coding-system 'utf-8 'utf-8)

;; (set-default-coding-systems 'gbk)
;; (set-terminal-coding-system 'gbk)
;; (set-terminal-coding-system 'gbk)
;; (set-keyboard-coding-system 'gbk)
;; (set-selection-coding-system 'gbk)
;; (set-buffer-file-coding-system 'gbk)
;; (set-file-name-coding-system 'gbk)
;; (modify-coding-system-alist 'process "*" 'gbk)
;; (set-buffer-process-coding-system 'gbk 'gbk)


;; Access via Web
;; (use-package take-off )

;; close startup slash
;; (setq inhibit-startup-message t)

;; close close-bell
(setq visible-bell t)

;; do not create backup files
(defconst backup-dir
  (expand-file-name "backups/" user-emacs-directory))

(defconst autosave-dir
  (expand-file-name "auto-saves/" user-emacs-directory))

(dolist (dir (list backup-dir autosave-dir))
  (unless (file-directory-p dir)
    (make-directory dir t)))

(setq
 backup-directory-alist `(("." . ,backup-dir))
 auto-save-file-name-transforms `((".*" ,autosave-dir t))
 backup-by-copying t
 version-control t
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 auto-save-default nil
 create-lockfiles nil)

(when (eq system-type 'windows-nt)
  ;; 避免网络文件锁
  (setq create-lockfiles nil))

;; semantic highlight
(global-font-lock-mode 1)

;; open picture display.
(auto-image-file-mode t)

;; use y/n replace yes/no (Emacs 28+: prefer use-short-answers over fset)
(setopt use-short-answers t)

;; display column number
(column-number-mode t)

(blink-cursor-mode -1)

(size-indication-mode 1)

(use-package ultra-scroll
  :ensure t
  :init
  (setq scroll-conservatively 3 ; or whatever value you prefer, since v0.4
        scroll-margin 0) ; important: scroll-margin>0 not yet supported
  :config
  (ultra-scroll-mode 1))

(add-to-list 'default-frame-alist '(scroll-bar-width . 8))

;;; Indent & Spacing & Tabs
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)

(setq c-basic-offset 4)
(setq js-indent-level 2)
(setq css-indent-offset 2)
(setq sh-basic-offset 2)

(setq frame-title-format
      `((buffer-file-name "%f" "%b")
        ,(format " - GNU Emacs %s" emacs-version)))

;; Count 1 space after a period as the end of a sentence, instead of 2
(setq sentence-end-double-space nil)

;; http://xahlee.info/emacs/emacs/emacs_tabs_space_indentation_setup.html
;; make tab key always call a indent command.
;; (setq-default tab-always-indent t)

;; make tab key call indent command or insert tab character, depending on cursor position
;; (setq-default tab-always-indent nil)

;; make tab key do indent first then completion.
(setq-default tab-always-indent 'complete)


;; Line
(setq-default truncate-lines nil)
(global-visual-line-mode 1)
(global-display-line-numbers-mode 1)

(use-package hl-line
;;  :custom-face
;;  (hl-line ((t (:background "#aaaaaa"))))
  :config
  (global-hl-line-mode 1))

;; Built-in undo/redo (Emacs 28+)
(global-set-key (kbd "C-/") #'undo-only)
(global-set-key (kbd "C-?") #'undo-redo)

(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))

(use-package anyins
  :ensure t)

(use-package popup-kill-ring
  :ensure t
  :defer t
  :commands (popup-kill-ring))

(use-package kill-ring-search
  :ensure t
  :defer t
  :commands (kill-ring-search kill-ring-search-prev))

(use-package backward-forward
  :config
  (backward-forward-mode t)
  :bind
  (:map backward-forward-mode-map
        ("<C-left>" . nil)
        ("<C-right>" . nil)
        ("<M-left>" . backward-forward-previous-location)
        ("<M-right>" . backward-forward-next-location)))

;;; UI transparency
(defun ui-set-transparency (alpha-level)
  "Set frame transparency."
  (interactive "p")
  (setq alpha-level
        (if (< alpha-level 2)
            (read-number "Opacity: " 85)
          alpha-level))
  (set-frame-parameter nil 'alpha alpha-level)
  (message "Opacity: %d%%" alpha-level))

;;(set-frame-parameter (selected-frame) 'alpha '(85 50))
;;(add-to-list 'default-frame-alist '(alpha 85 50))

(use-package multiple-cursors
  :ensure t
  :defer t
  :bind
  (("C-S-c C-S-c" . mc/edit-lines)
   ("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("C-c C-<" . mc/mark-all-like-this)
   ("C-S-<mouse-1>" . mc/add-cursor-on-click)))

(use-package so-long
  :ensure nil
  :config
  (global-so-long-mode 1))

(use-package regex-tool
  :ensure t
  :defer t
  :commands regex-tool)

(use-package visual-regexp
  :ensure t
  :defer t
  :commands (vr/replace vr/mc-mark vr/query-replace))

;; (use-package hl-anything  :ensure t)

(use-package highlight-parentheses
  :ensure t)

(use-package highlight-doxygen
  :ensure t
  :defer t
  :hook
  ((c-mode c++-mode c-ts-mode c++-ts-mode c-or-c++-ts-mode) . highlight-doxygen-mode))

(use-package symbol-overlay
  :ensure t
  :defer t
  :hook (prog-mode . symbol-overlay-mode)
  :bind (([f3] . symbol-overlay-jump-next)
         ([C-f3] . symbol-overlay-put)
         ([M-f3] . symbol-overlay-rename)
         ([S-f3] . symbol-overlay-jump-prev)))

(use-package highlight-indent-guides
  :ensure t
  :defer t)

(use-package sudo-edit
  :ensure t
  :commands sudo-edit)

(use-package ace-window
  :config
  ;; Show the window designators in the modeline.
  (ace-window-display-mode)

  :bind* (("C-<" . other-window) ("C-," . ace-window))
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l) "Designate windows by home row keys, not numbers.")
  (aw-background nil))

(use-package iedit
  :ensure t
  :defer t
  :commands iedit-mode)

(minibuffer-depth-indicate-mode)

(electric-pair-mode 1)
(global-highlight-parentheses-mode t)

(setq xterm-extra-capabilities
      '(getSelection setSelection modifyOtherKeys))

(setq select-enable-clipboard t)

(defun copy-word-under-cursor ()
  "Copy the word at point."
  (interactive)
  (when-let ((word (thing-at-point 'word t)))
    (kill-new word)
    (message "Copied: %s" word)))

(defun paste-replace-word-under-cursor ()
  "Replace the word at point with the latest kill."
  (interactive)
  (when-let ((bounds (bounds-of-thing-at-point 'word)))
    (delete-region (car bounds) (cdr bounds))
    (goto-char (car bounds))
    (yank)))



(global-set-key (kbd "C-c r") 'paste-replace-word-under-cursor)
(global-set-key (kbd "C-c W") 'copy-word-under-cursor)

(message "[init] init-edit loaded")

(provide 'init-edit)
;;; init-edit.el ends here
