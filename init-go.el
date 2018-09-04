;;; init-go.el --- GO

;;; Commentary:
;; 

;; 
;;; Code:


;; go get golang.org/x/tools/cmd/guru
;; go get golang.org/x/tools/cmd/gorename
;; go build golang.org/x/tools/cmd/gorename
;; go get github.com/rogpeppe/godef

(use-package go-guru
  
  :config
  (progn
    (go-guru-hl-identifier-mode)
    (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)
	)
  )

(use-package go-rename )
(use-package flycheck-gometalinter )

;;; company-go - company backend for Golang
;;; https://github.com/nsf/gocode/blob/master/emacs-company/company-go.el
(use-package company-go
  
  :after (go-mode)
  :config
  (progn
    (after-load 'go-mode
      (defun setup-company-go ()
        "Hook for running on company-go"
        ;; we only want to use company-go - it's so accurate we won't need any other
        ;; completion engines
        (set (make-local-variable 'company-backends) '(company-go)))
      (after-load 'company-go
        (defadvice company-go (around fix-company-go-prefix activate)
          "Clobber company-go to use company-grab-word instead of the
flakey regular expression. This allows us to complete standard
variables etc. as well as methods and properties."
          ad-do-it
          (when (eql (ad-get-arg 0) 'prefix)
            (setq ad-return-value (company-grab-word))))
        (add-hook 'go-mode-hook 'setup-company-go)))))


(provide 'init-go)

;;; init-go.el ends here
