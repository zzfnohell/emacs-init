;;; init-edit.el --- Edit Config

;;; Commentary:
;; 

;;; Code:

;; Access via Web
;; (use-package take-off :defer t)

(req-package auto-indent-mode
  :defer t
  :init
  ;; If you want auto-indent on for files
  (setq auto-indent-on-visit-file t) )

(req-package hl-anything :defer t)
(req-package hl-indent :defer t)

(req-package highlight-parentheses :defer t)
(req-package highlight-thing :defer t)


(req-package auto-highlight-symbol
  :defer t
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
  :defer t
  :config (hlinum-activate))

(use-package undo-tree
  :defer t
  :config (global-undo-tree-mode))

(use-package regex-tool :defer t)
(use-package vline :defer t)
(use-package visible-mark
  :defer t
  :init
  (defface visible-mark-active
    ;; put this before (require 'visible-mark)
    '((((type tty) (class mono)))
      (t (:background "magenta"))) "")
  :config
  (progn
    ;; or add (visible-mark-mode) to specific hooks
    (global-visible-mark-mode 1)
    (setq visible-mark-max 2)
    (setq visible-mark-faces `(visible-mark-face1 visible-mark-face2))))


(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))

;; CSV file
(use-package csv-mode
  :defer t
  :config
  (progn
    (add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")
    (setq csv-separators '("," ";" "|" " "))))

;; irfc
(req-package irfc
  :defer t
  :config
  (progn
    (setq irfc-directory *rfc-directory*)
    (setq irfc-assoc-mode t)))

(req-package anyins :defer t)

(req-package popup-kill-ring :defer t)
(req-package kill-ring-search
  :defer t
  :config
  (progn
    (autoload 'kill-ring-search "kill-ring-search"
      "Search the kill ring in the minibuffer."
      (interactive))))

(req-package vkill
  :config
  (progn
    (autoload 'vkill "vkill" nil t)
    (autoload 'list-unix-processes "vkill" nil t)))

(setq abbrev-file-name "~/.emacs.d/abbrev_defs")  
(setq-default abbrev-mode t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))
(setq save-abbrevs t)

(custom-set-variables
 '(custom-enabled-themes (quote (light-blue)))
 '(httpd-host "0.0.0.0")
 '(httpd-port 8088)
 '(minimap-window-location (quote right))
 '(size-indication-mode t)
 '(speedbar-show-unknown-files t)
 '(visual-line-mode nil t))

(provide 'init-edit)

;;; init-edit.el ends here
