;;; init-java.el --- JAVA


;;; Commentary:
;;

;;; Code:

(require 'cedet)
(require 'semantic)
(use-package java-snippets)
(use-package javadoc-lookup
  :config
  (progn (require 'javadoc-lookup)
		 (setq open-jdk-doc-path "/usr/share/doc/openjdk-7-jdk/api")
		 (if (file-exists-p open-jdk-doc-path)
		(javadoc-add-roots open-jdk-doc-path))
	)

  )

(use-package groovy-mode :ensure t)

(use-package flycheck-gradle
  :ensure t
  :commands (flycheck-gradle-setup)
  :init
  (mapc
   (lambda (x)
     (add-hook x #'flycheck-gradle-setup))
   '(java-mode-hook kotlin-mode-hook)))

(use-package ant :ensure t)
(use-package mvn :ensure t)

;; ** JDEE
(use-package jdee
	:ensure t
	:custom
	(jdee-server-dir (expand-file-name "~/.emacs.d/init/jdee-server/target")))

;; mvn -Dmaven.test.skip=true package
;;

;; ***


(provide 'init-java)
;;; init-java.el ends here
