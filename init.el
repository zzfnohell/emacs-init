;;; init.el --- init

;;; Commentary:
;; 

;;; Code:

;; (setq debug-on-error t)

;; (setq debug-on-message ".*ad-handle-definition.*")
;; (setq debug-on-message ".*error.*")

(setq custom-file "~/.emacs.d/custom.el")

(load "~/.emacs.d/init/init-main.el")

(when (file-exists-p custom-file)
  (load custom-file))

(ede-cpp-root-project "MINGW64"
                      :file "~/.emacs.d/init.el"
                      :include-path '("/include" "../include")
                      :system-include-path '( "d:/msys64/mingw64/include/" ))

;;; init.el ends here
