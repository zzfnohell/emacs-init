;;; init-tabbar.el --- Tabbar


;;; Commentary:
;; Tabbar

;;; Code:
(require-package 'tabbar)
(require 'tabbar)

;; (defun tabbar-buffer-groups ()
;;    "Return the list of group names the current buffer belongs to.
;;      Return a list of one element based on major mode."
;;    (list
;;     (cond
;;      ((or (get-buffer-process (current-buffer))
;;           ;; Check if the major mode derives from `comint-mode' or
;;           ;; `compilation-mode'.
;;           (tabbar-buffer-mode-derived-p
;;            major-mode 
;; 		   '(comint-mode compilation-mode)))
;;       "Process")
;; 	 ((string-match-p "\\*.*" (buffer-name))
;; 	  (cond ((string-match-p "\\*helm.*\\*" (buffer-name)) "Helm")
;; 			(t "Background")))
;; 	 (t "Main"))))

;; (setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

(tabbar-mode t)

(provide 'init-tabbar)

;;; init-tabbar.el ends here
