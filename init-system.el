;;; init-system.el ---

;;; Commentary:
;; 

;;; Code:

(setq gc-cons-threshold (* 100 1000 1000))
(setq read-process-output-max (* 32 1024 1024))

(defun sys-recompile-packages ()
  "recompile user packages."
  (interactive)
  (byte-recompile-directory package-user-dir nil 'force))


(setq debug-on-error t)
(toggle-debug-on-quit)
;; (setq debug-on-message ".*ad-handle-definition.*")
;; (setq debug-on-message ".*error.*")
;; (debug-on-entry 'yas-load-directory)


(provide 'init-system)

;;; init-system.el ends here
