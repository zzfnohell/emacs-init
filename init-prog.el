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

(provide 'init-prog)

;;; init-prog.el ends here
