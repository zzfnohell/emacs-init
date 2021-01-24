;;; init-polymode.el --- POLYMODE

;;; Commentary:
;; 

(use-package polymode
  :ensure t
  :after (:all org-brain)
  :config
  ;; Allows you to edit entries directly from org-brain-visualize
  (add-hook 'org-brain-visualize-mode-hook #'org-brain-polymode)

  ;; MARKDOWN
  (add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
  
  ;; R modes
  (add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
  (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode)))

(message "loading init-polymode done.")

(provide 'init-polymode)

;;; init-polymode.el ends here
