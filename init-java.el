;;; init-java.el --- JAVA


;;; Commentary:
;;

;;; Code:

(require 'cedet)
(require 'semantic)
(use-package java-snippets)

(use-package groovy-mode)

(use-package flycheck-gradle
  :commands (flycheck-gradle-setup)
  :init
  (mapc
   (lambda (x)
     (add-hook x #'flycheck-gradle-setup))
   '(java-mode-hook kotlin-mode-hook)))

(use-package ant)
(use-package mvn)

;; ** JDEE
(use-package jdee
	:custom
	(jdee-server-dir (expand-file-name "~/.emacs.d/init/jdee-server/target")))

;; mvn -Dmaven.test.skip=true package
;;

;; ***
(use-package lsp-java
  :after lsp-mode)

(provide 'init-java)
;;; init-java.el ends here
