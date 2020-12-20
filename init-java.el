;;; init-java.el --- JAVA


;;; Commentary:
;;

;;; Code:
(use-package java-snippets
  :ensure t)

(use-package flycheck-gradle
  :commands (flycheck-gradle-setup)
  :init
  (mapc
   (lambda (x)
     (add-hook x #'flycheck-gradle-setup))
   '(java-mode-hook kotlin-mode-hook)))

(use-package ant :ensure t)
(use-package mvn :ensure t)

;; mvn -Dmaven.test.skip=true package
(use-package lsp-java
  :ensure t
  :after lsp-mode)

(use-package groovy-mode
  :ensure t)

(provide 'init-java)
(message "init-java loaded.")
;;; init-java.el ends here
