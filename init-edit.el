;;; init-edit.el --- edit -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

;; coding system

(set-charset-priority 'unicode)
(define-coding-system-alias 'cp65001 'utf-8)
(prefer-coding-system 'utf-8)

(when (eq system-type 'windows-nt)
  (setenv "LC_TIME" "zh_CN.UTF-8")
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

;; emacs shell font confusion
(defvar ansi-color-for-comint-mode t)

;; close startup slash
;; (setq inhibit-startup-message t)

;; close close-bell
(setq visible-bell t)

;; do not create backup files
(defconst *backup-dir* "~/.emacs.d/.backups/")
(defconst *autosave-dir* "~/.emacs.d/.auto-saves/")
(unless (file-directory-p  *backup-dir*)
  (make-directory *backup-dir* t))

(unless (file-directory-p  *autosave-dir*)
  (make-directory *autosave-dir* t))

(setq
 backup-by-copying t                    ; don't clobber symlinks
 backup-directory-alist
 `(("." . ,*backup-dir*))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 ;; use versioned backups
 version-control t
 auto-save-file-name-transforms
 `((".*" ,*autosave-dir* t)))

;; semantic highlight
(global-font-lock-mode t)

;; open picture display.
(auto-image-file-mode t)

;; use y/n replace yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; display column number
(column-number-mode t)

;; match parentheses.
(show-paren-mode t)

(blink-cursor-mode t)

(size-indication-mode 1)

(when (window-system)
  (setq-default mouse-wheel-scroll-amount '(1 ((shift) . 1)))
  (setq-default mouse-wheel-progressive-speed nil)
  (setq-default scroll-step 1)
  (setq-default scroll-margin 0)
  (setq-default scroll-conservatively 100000))

;; display buffer name on the caption.
(setq frame-title-format
      (list
       '(:eval (buffer-name (current-buffer)))))

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
(setq-default global-visual-line-mode t)
(global-display-line-numbers-mode 1)

(use-package hl-line
;;  :custom-face
;;  (hl-line ((t (:background "#aaaaaa"))))
  :config
  (global-hl-line-mode 1))

;;
(use-package undo-tree
  :ensure t
  :diminish
  :config
  (global-undo-tree-mode 1)
  (setq undo-tree-visualizer-diff t)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-auto-save-history nil)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

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
  "Set transparency as ALPHA-LEVEL."
  (interactive "p")
  (message (format "Alpha level passed in: %s" alpha-level))
  (let ((alpha-level
         (if (< alpha-level 2)
             (read-number "Opacity percentage: " 85)
           alpha-level))
        (myalpha (frame-parameter nil 'alpha)))
    (set-frame-parameter nil 'alpha alpha-level))
  (message (format "Alpha level is %d" (frame-parameter nil 'alpha))))

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
  :ensure t
  :config
  (global-so-long-mode 1))

(use-package su
  :ensure t
  :defer t
  :commands su
  :config
  (su-mode +1))

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

(use-package highlight-thing
  :ensure t)

(use-package highlight-doxygen
  :ensure t
  :defer t
  :hook
  ((c-mode c++-mode) . highlight-doxygen-mode)
  :config
  (highlight-doxygen-global-mode 1))

(use-package auto-highlight-symbol
  :ensure t
  :config
  (global-auto-highlight-symbol-mode t))

(use-package highlight-symbol
  :ensure t
  :defer t
  :bind (([f3] . highlight-symbol-next)
         ([C-f3] . highlight-symbol)
         ([M-f3] . highlight-symbol-query-replace)
         ([S-f3] . highlight-symbol-prev)))

(use-package highlight-indentation
	:ensure t
  :config
	(set-face-background 'highlight-indentation-face "#e3e3d3")
  (set-face-background 'highlight-indentation-current-column-face "#c3b3b3"))

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
(show-paren-mode 1)
(global-highlight-parentheses-mode t)


(defun copy-word-under-cursor ()
  "Copy the word under the cursor."
  (interactive)
  (save-excursion
    (backward-word)
    (mark-word)
    (kill-ring-save (region-beginning) (region-end))))

(defun paste-replace-word-under-cursor ()
  "Replace the word under the cursor with the latest yanked (pasted) text."
  (interactive)
  (save-excursion
    (let (beg end)
      (backward-word)
      (setq beg (point))
      (forward-word)
      (setq end (point))
      (delete-region beg end)
      (yank))))

(global-set-key (kbd "C-c r") 'paste-replace-word-under-cursor)
(global-set-key (kbd "C-c w") 'copy-word-under-cursor)

(message "loading init-edit done.")

(provide 'init-edit)
;;; init-edit.el ends here
