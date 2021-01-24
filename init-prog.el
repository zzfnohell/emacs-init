;;; init-prog.el --- Prog Mode



;;; Commentary:
;; 

;;; Code:

(use-package rainbow-delimiters
	:config
	(add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; (use-package hideshow
;;   :ensure t
;;   :config
;;   (add-to-list 'hs-special-modes-alist
;;                '(nxml-mode
;;                  "<!--\\|<[^/>]*[^/]>"
;;                  "-->\\|</[^/>]*[^/]>"
                 
;;                "<!--"
;;                sgml-skip-tag-forward
;;                nil))
  
;;   (add-hook 'nxml-mode-hook 'hs-minor-mode))

(require 'compile)
(setq compilation-disable-input nil)
(setq compilation-scroll-output t)
(setq mode-compile-always-save-buffer-p t)

(use-package origami
  :ensure t)

(use-package lsp-origami
  :after (:all origami lsp)
  :ensure t
  :config
  (add-hook 'lsp-after-open-hook #'lsp-origami-try-enable))

(provide 'init-prog)

;;; init-prog.el ends here
