;;; init-system.el ---

;;; Commentary:
;; 

;;; Code:

;; NOTE: `gc-cons-threshold' is intentionally NOT lowered here.  init.el keeps
;; GC suppressed for the whole of startup and restores the 64MB steady-state
;; from `emacs-startup-hook'.  Setting it mid-init would trigger GC during the
;; remaining (heaviest) part of startup.
(setq read-process-output-max (* 4 1024 1024))

(defun sys-recompile-packages ()
  "recompile user packages."
  (interactive)
  (byte-recompile-directory package-user-dir nil 'force))



(provide 'init-system)

;;; init-system.el ends here
