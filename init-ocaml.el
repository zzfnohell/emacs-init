;;; init-ocaml.el --- OCaml/Reason

;;; Commentary:
;;

;;----------------------------------------------------------------------------
;; Reason setup
;;----------------------------------------------------------------------------

(defun shell-cmd (cmd)
  "Returns the stdout output of a shell command or nil if the command returned an error"
  (car (ignore-errors (apply 'process-lines (split-string cmd)))))

(defun reason-cmd-where (cmd)
  (let ((where (shell-cmd cmd)))
    (if (not (string-equal "unknown flag ----where" where))
        where)))

(let* ((refmt-bin (or (reason-cmd-where "refmt ----where")
                      (shell-cmd "which refmt")))
       (merlin-bin (or (reason-cmd-where "ocamlmerlin ----where")
                       (shell-cmd "which ocamlmerlin")))
       (merlin-base-dir (when merlin-bin
                          (replace-regexp-in-string "bin/ocamlmerlin$" "" merlin-bin))))
  ;; Add merlin.el to the emacs load path and tell emacs where to find ocamlmerlin
  (when merlin-bin
    (add-to-list 'load-path (concat merlin-base-dir "share/emacs/site-lisp/"))
    (setq merlin-command merlin-bin))

  (when refmt-bin
    (setq refmt-command refmt-bin)))

(use-package merlin
  :ensure t
  :hook
  (tuareg-mode . merlin-mode)
  (caml-mode . merlin-mode)
  :config
  (setq merlin-use-auto-complete-mode t)
  (setq merlin-error-after-save nil))

(use-package reason-mode
  :ensure t
  :defer t
  :hook
  (reason-mode . (lambda ()
                   (add-hook 'before-save-hook 'refmt-before-save)
                   (merlin-mode))))

(use-package utop
  :ensure t
  :defer t
  :commands utop
  :config
  (autoload 'utop-setup-ocaml-buffer "utop" "TopLevel for OCaml" t))

(use-package tuareg
  :ensure t
  :mode
  (("\\.ml[ily]?$" . tuareg-mode)
   ("\\.topml$" . tuareg-mode))
  :config
  (add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
  (add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
  (add-hook 'tuareg-mode-hook 'merlin-mode))

(message "loading init-ocaml done.")

(provide 'init-ocaml)

;;; init-ocaml.el ends here
