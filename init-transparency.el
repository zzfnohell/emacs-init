;;; init-transparency.el --- Transparency

;;; Commentary:
;; 

;;; Code:

(defun set-transparency (alpha-level)
      (interactive "p")
      (message (format "Alpha level passed in: %s" alpha-level))
      (let ((alpha-level (if (< alpha-level 2)
				(read-number "Opacity percentage: " 85)
				alpha-level))
            (myalpha (frame-parameter nil 'alpha)))
        (set-frame-parameter nil 'alpha alpha-level))
      (message (format "Alpha level is %d" (frame-parameter nil 'alpha))))

(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))

(provide 'init-transparency)

;;; init-transparency.el ends here
