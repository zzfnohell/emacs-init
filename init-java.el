;;; init-java.el --- JAVA


;;; Commentary:
;;

;;; Code:



(use-package flycheck-gradle
  :commands (flycheck-gradle-setup)
  :init
  (mapc
   (lambda (x)
     (add-hook x #'flycheck-gradle-setup))
   '(java-mode-hook kotlin-mode-hook)))

(use-package ant
  :ensure t
  :defer t
  :commands
  (ant ant-clean ant-compile))
(use-package mvn
  :ensure t
  :defer t
  :commands
  (mvn mvn-clean mvn-compile))

;; mvn -Dmaven.test.skip=true package

(use-package groovy-mode
  :ensure t)



(message "loading init-java done.")

(provide 'init-java)
;;; init-java.el ends here
