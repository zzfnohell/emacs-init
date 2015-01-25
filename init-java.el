;;; init-java.el --- JAVA


;;; Commentary:
;; 

;;; Code:

(require 'cedet)
(require 'semantic)
(require-package 'groovy-mode)
;;(require-package 'malabar-mode)
;;(require 'malabar-mode)
;;(setq malabar-groovy-lib-dir "/path/to/malabar/lib")
;;(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

(require-package 'java-snippets)
(require-package 'javadoc-lookup)
(require 'javadoc-lookup)

(setq open-jdk-doc-path "/usr/share/doc/openjdk-7-jdk/api")
(if (file-exists-p open-jdk-doc-path)
    (javadoc-add-roots open-jdk-doc-path))

(require-package 'ant)
(require 'ant)
(require-package 'mvn)
(require 'mvn)

(provide 'init-java)
;;; init-java.el ends here
