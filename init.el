;;; -*- lexical-binding: t; -*-

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
            (setq gc-cons-threshold (* 64 1024 1024)
                  gc-cons-percentage 0.1
                  file-name-handler-alist
                  (delete-dups
                   (append file-name-handler-alist
                           init/--file-name-handler-alist)))
            (garbage-collect))
          t)

;;; Debug

(setq debug-on-error t)
;; (toggle-debug-on-quit)
;; (setq debug-on-message ".*ad-handle-definition.*")
;; (setq debug-on-message ".*error.*")
;; (debug-on-entry 'yas-load-directory)

;;; Load path

(add-to-list
 'load-path
 (directory-file-name
  (expand-file-name "init" user-emacs-directory)))

(let ((site-lisp-dir
       (expand-file-name "site-lisp" user-emacs-directory)))
  (when (file-directory-p site-lisp-dir)
    (dolist (subdir (directory-files site-lisp-dir t))
      (when (and (file-directory-p subdir)
                 (not (member (file-name-nondirectory subdir)
                              '("." ".."))))
        (add-to-list 'load-path
                     (directory-file-name subdir))))))

;;; Environment

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))

(let ((envs-file
       (expand-file-name "envs.el" user-emacs-directory)))
  (when (file-exists-p envs-file)
    (load envs-file)))

;;; Package / main configuration

(require 'init-elpa)
(require 'init-main)

;;; init.el ends here