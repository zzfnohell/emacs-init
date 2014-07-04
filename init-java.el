;;; init-java.el --- JAVA


;;; Commentary:
;; 

;;; Code:

(require 'cedet)
(require-package 'malabar-mode)
(require 'malabar-mode)
;;(setq malabar-groovy-lib-dir "/path/to/malabar/lib")
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

(require-package 'java-snippets)
(require-package 'javadoc-lookup)
(require 'javadoc-lookup)
(javadoc-add-roots "/usr/share/doc/openjdk-7-jdk/api")

(require-package 'ant)
(require 'ant)
(require-package 'mvn)
(require 'mvn)

(provide 'init-java)
;;; init-java.el ends here
