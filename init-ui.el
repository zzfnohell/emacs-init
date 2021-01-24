;;; init-ui.el --- UI

;;; Commentary:
;; 

;;; Code:
;;

(use-package sr-speedbar
  :ensure t)

(use-package minimap
  :ensure t
  :demand t)

(use-package all-the-icons
  :ensure t
  :demand t)

;; Slow Rendering
;; If you experience a slow down in performance when rendering multiple
;; icons simultaneously, you can try setting the following variable
(setq inhibit-compacting-font-caches t)

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

(require 'display-fill-column-indicator)
(setq display-fill-column-indicator-column 120)
(defun init-ui/enable-display-fill-column ()
	(display-fill-column-indicator-mode))

(add-hook 'prog-mode-hook #'init-ui/enable-display-fill-column)

(provide 'init-ui)

;;; init-ui.el ends here
