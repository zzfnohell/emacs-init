(load "~/.emacs.d/config/config.el")
(load-config "cedet")

;;require eassist.
(defun python-mode-method-hook ()
  (define-key python-mode-map (kbd "M-m") 'eassist-list-methods))
(add-hook 'python-mode-hook 'python-mode-method-hook)
(define-key lisp-mode-shared-map (kbd "M-m") 'eassist-list-methods)
