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
  :ensure t
  :hook
  (go-mode . go-guru-hl-identifier-mode)
  :config
	(go-guru-hl-identifier-mode))


(use-package go-rename
  :ensure t
  :defer t
  :commands go-rename)

(use-package go-playground
  :ensure t
  :defer t
  :commands go-playground)

(message "loading init-go done.")

(provide 'init-go)

;;; init-go.el ends here
