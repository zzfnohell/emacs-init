;;; init-java.el --- JAVA


;;; Commentary:
;; 

;;; Code:

(require 'cedet)
(require 'semantic)
(use-package java-snippets)
(use-package javadoc-lookup
  :config
  (progn
    (require 'javadoc-lookup)

    (setq open-jdk-doc-path "/usr/share/doc/openjdk-7-jdk/api")
    (if (file-exists-p open-jdk-doc-path)
        (javadoc-add-roots open-jdk-doc-path))
    )

  )

(use-package ant)
(use-package mvn)
(use-package jdee)

(provide 'init-java)
;;; init-java.el ends here
