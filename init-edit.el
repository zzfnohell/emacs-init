;;; init-edit.el --- Edit Config

;;; Commentary:
;; 

;;; Code:

(require-package 'auto-indent-mode)
;; If you want auto-indent on for files
(setq auto-indent-on-visit-file t) 
(require 'auto-indent-mode)

(require-package 'auto-highlight-symbol)
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

(require 'whitespace)
(setq-default indent-tabs-mode nil)

(require 'linum)
(defvar *linum-disable-major-mode-list*
  '(rfcview-mode
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

(require-package 'undo-tree)
(require 'undo-tree)
(global-undo-tree-mode)

(require-package 'regex-tool)

(require-package 'vline)
(require 'vline)

(require-package 'visible-mark)
(require 'visible-mark)
(global-visible-mark-mode 1) ;; or add (visible-mark-mode) to specific hooks

(defface visible-mark-active ;; put this before (require 'visible-mark)
  '((((type tty) (class mono)))
    (t (:background "magenta"))) "")
(setq visible-mark-max 2)
(setq visible-mark-faces `(visible-mark-face1 visible-mark-face2))

(provide 'init-edit)

;;; init-edit.el ends here
