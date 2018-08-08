;;; init-edit.el --- Edit Config

;;; Commentary:
;;

;;; Code:

;; Access via Web
;; (use-package take-off )

(use-package auto-indent-mode
  :ensure t
  :init
  ;; If you want auto-indent on for files
  (setq auto-indent-on-visit-file t)
  )

(use-package hl-line :ensure nil)

(use-package hl-anything :ensure t)

(use-package hl-indent :ensure t)

(use-package highlight-parentheses :ensure t)

(use-package highlight-thing :ensure t)


(use-package auto-highlight-symbol
  :ensure t
  :config (global-auto-highlight-symbol-mode t))

(setq-default indent-tabs-mode nil)

(require 'linum)
(defvar *linum-disable-major-mode-list*
  '(rfcview-mode
    text-mode
    vlf-mode
    image-mode))

;;; linum-mode
(defun turn-linum-on ()
  "Turn linum mode on."
  (unless
      (or (minibufferp)
          ;;linum should turn off in non-editor buffer
          (equal (string-match "\\*.*\\*"
                               (buffer-name (current-buffer))) 0)
          ;;linum should turn off in non-editor buffer
          (equal (string-match "\\#.*"
                               (buffer-name (current-buffer))) 0)
          ;; linum should turn off in *.pdf buffer.
          (equal (string-match ".*\\.pdf$"
                               (buffer-name (current-buffer))) 0)
          (member major-mode *linum-disable-major-mode-list*))
    (linum-mode 1)))

(setq linum-format
      (lambda (line)
        (propertize
         (format
          (let ((w (length (number-to-string
                            (count-lines (point-min) (point-max))))))
            (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))

(define-globalized-minor-mode global-linum-mode linum-mode turn-linum-on)

(global-linum-mode 1)

(use-package hlinum
  :ensure t
  :config (hlinum-activate))

(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode))

(use-package regex-tool :ensure t)

(use-package vline  :ensure t)

(use-package visible-mark
  :ensure t
  :init
  (defface visible-mark-active
    ;; put this before (require 'visible-mark)
    '((((type tty) (class mono)))
      (t (:background "magenta"))) "")
  (setq visible-mark-max 2)
  (setq visible-mark-faces `(visible-mark-face1 visible-mark-face2))
  :config
  (global-visible-mark-mode 1)
  )


(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))

;; CSV file
(use-package csv-mode
  :ensure t
  :config
  (progn
    (add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")
    (setq csv-separators '("," ";" "|" " "))))

(use-package anyins :ensure t)

(use-package popup-kill-ring :ensure t)

(use-package kill-ring-search
  :ensure t
  :config
  (progn
    (autoload 'kill-ring-search "kill-ring-search"
      "Search the kill ring in the minibuffer."
      (interactive))))

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq-default abbrev-mode t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))
(setq save-abbrevs t)
(xterm-mouse-mode 1)

(use-package httpd :ensure t)

(use-package httprepl :ensure t)

(use-package speedbar)

(provide 'init-edit)

;;; init-edit.el ends here
