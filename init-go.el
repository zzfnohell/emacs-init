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
	(go-guru-hl-identifier-mode)
  (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode))

(use-package go-rename)
(use-package flycheck-gometalinter)

(message "loading init-go done.")

(provide 'init-go)

;;; init-go.el ends here
