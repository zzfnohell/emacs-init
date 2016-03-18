;;; init-edit.el --- Edit Config

;;; Commentary:
;; 

;;; Code:

;; Access via Web
;; (require-package 'take-off)
;; (require 'take-off)

(require-package 'auto-indent-mode)
;; If you want auto-indent on for files
(setq auto-indent-on-visit-file t) 
(require 'auto-indent-mode)

(require-package 'hl-anything)
(require-package 'hl-indent)
(require 'hl-indent)

(require-package 'highlight-parentheses)
(require 'highlight-parentheses)

(require-package 'highlight-chars)
(require 'highlight-chars) 

(require-package 'highlight-thing)
(require 'highlight-thing)

(require-package 'auto-highlight-symbol)
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

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

(require-package 'hlinum)
(require 'hlinum)
(hlinum-activate)


(require-package 'undo-tree)
(require 'undo-tree)
(global-undo-tree-mode)

(require-package 'regex-tool)

(require-package 'vline)
(require 'vline)

(require-package 'visible-mark)
(require 'visible-mark)
(global-visible-mark-mode 1) ;; or add (visible-mark-mode) to specific hooks

(defface visible-mark-active
  ;; put this before (require 'visible-mark)
  '((((type tty) (class mono)))
    (t (:background "magenta"))) "")
(setq visible-mark-max 2)
(setq visible-mark-faces `(visible-mark-face1 visible-mark-face2))

(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))

;; CSV file
(require-package 'csv-mode)
(require-package 'csv-nav)
(add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")
(setq csv-separators '("," ";" "|" " "))

;; irfc
(require-package 'irfc)
(require 'irfc)
(setq irfc-directory *rfc-directory*)
(setq irfc-assoc-mode t)

(require-package 'anyins)
(require 'anyins)

(require-package 'browse-kill-ring+)
(require 'browse-kill-ring+)
(require-package 'popup-kill-ring)
(require-package 'kill-ring-search)

(autoload 'kill-ring-search "kill-ring-search"
  "Search the kill ring in the minibuffer."
  (interactive))

(require-package 'indent-guide)
(require 'indent-guide)
(indent-guide-global-mode)
(setq indent-guide-recursive t)

(provide 'init-edit)

;;; init-edit.el ends here
