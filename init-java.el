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
  :after lsp-mode
	:config
	(require 'lsp-java-boot)

	;; to enable the lenses
	(add-hook 'lsp-mode-hook #'lsp-lens-mode)
	(add-hook 'java-mode-hook #'lsp-java-lens-mode)
	)

(use-package groovy-mode
  :ensure t)



(message "loading init-java done.")

(provide 'init-java)
;;; init-java.el ends here
