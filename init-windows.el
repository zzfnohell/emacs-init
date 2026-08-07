;;; init-windows.el --- Windows -*- lexical-binding: t -*-

;;; Commentary:
;; 

;;; Code:
(use-package speedbar
  :ensure t
  :commands speedbar)

(use-package sr-speedbar
  :ensure t
  :defer t
  :commands (sr-speedbar-open sr-speedbar-toggle) )

(use-package minimap
  :ensure t
  :defer t
  :commands minimap)


(use-package perspective
  :ensure t
  :defer t
  :commands (persp-mode persp-list-buffers)
  :bind
  ("C-x C-b" . persp-list-buffers) ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p")) ; pick your own prefix key here
  :init
  (add-hook 'emacs-startup-hook
            (lambda ()
              (run-with-idle-timer 0 nil #'persp-mode))))

(provide 'init-windows)

;;; init-windows.el ends here
