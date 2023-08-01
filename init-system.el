;;; init-system.el ---

;;; Commentary:
;; 

;;; Code:

(setq gc-cons-threshold (* 64 1024 1024))
(setq read-process-output-max (* 4 1024 1024))

(defun sys-recompile-packages ()
  "recompile user packages."
  (interactive)
  (byte-recompile-directory package-user-dir nil 'force))



(provide 'init-system)

;;; init-system.el ends here
