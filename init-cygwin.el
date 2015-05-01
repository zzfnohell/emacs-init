;;; init-cygwin.el --- Setup Cygwin Emacs

;;; Commentary:
;; 

;;; Code:

(if (windows-p)
    (progn
      (require-package 'cygwin-mount)
      (require 'cygwin-mount)
      (cygwin-mount-activate)))
(cond
 ((cygwin-p)
  ;;; shell on win95 to bash
  ;;; shell on windows to bash
  (make-local-variable 'cygwin)
  (make-local-variable 'cygwin-bin)
  (make-local-variable 'cygwin-bash)
  (setq cygwin (concat "/cygdrive/d/local/" "cygwin64"))
  (setq cygwin-bin (concat cygwin "/bin"))
  (setq cygwin-bash (concat cygwin-bin "/bash.exe"))
  (setenv "COMSPEC" cygwin-bash)
  (setenv "SHELL" cygwin-bash)
  (setq shell-file-name cygwin-bash)
  (setenv "CVS_RSH" (concat cygwin-bin "/ssh.exe"))
  (setenv "CYGWIN" "nodosfilewarning"))
 (t t))

(provide 'init-cygwin)

;;; init-cygwin.el ends here
