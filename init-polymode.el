;;; init-polymode.el --- POLYMODE

;;; Commentary:
;; 

(use-package polymode
	:ensure t
  :config
  (progn
    ;; MARKDOWN
    (add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

    ;; R modes
    (add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
    (add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
    (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))))



(provide 'init-polymode)

;;; init-polymode.el ends here
