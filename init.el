;;; init.el --- init

;;; Commentary:
;; 

;;; Code:

;;; Startup performance
;; Suppress garbage collection and the file-name-handler machinery for the
;; duration of startup, then restore sane steady-state values afterwards.
;; This is the single cheapest, behaviour-preserving way to speed up init.
(defvar init/--file-name-handler-alist file-name-handler-alist)
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6
      file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 64 1024 1024) ; steady-state (see init-system.el)
                  gc-cons-percentage 0.1
                  file-name-handler-alist
                  (delete-dups (append file-name-handler-alist
                                        init/--file-name-handler-alist)))
            (garbage-collect))
          t)

;;; Debug flags
(setq debug-on-error t)
;; (toggle-debug-on-quit)
;; (setq debug-on-message ".*ad-handle-definition.*")
;; (setq debug-on-message ".*error.*")
;; (debug-on-entry 'yas-load-directory)


(add-to-list 'load-path (directory-file-name (expand-file-name "~/.emacs.d/init")))

(let* ((site-lisp-dir (directory-file-name (expand-file-name "~/.emacs.d/site-lisp")))
       (dirlist (directory-files site-lisp-dir t)))
  (dolist (subdir dirlist)
    (let ((name (file-name-base subdir)))
      (unless (or (not (file-directory-p subdir))
                  (equal name ".")
                  (equal name ".."))
        (add-to-list 'load-path (directory-file-name subdir))))))


(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))

(let ((envs-file (expand-file-name "~/.emacs.d/envs.el")))
	(when (file-exists-p envs-file)
		(load envs-file)))

(let ((main-file (expand-file-name "~/.emacs.d/init/init-main.el")))
	(load main-file))

;;; init.el ends here


