(load (expand-file-name "site-lisp/nxhtml/autostart.el" user-emacs-directory))
(setq auto-mode-alist (cons '("\\.html" . nxhtml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.htm" . nxhtml-mode) auto-mode-alist))

(provide 'init-nxhtml)
