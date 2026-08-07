;;; init-java.el --- JAVA


;;; Commentary:
;;

;;; Code:



(use-package flycheck-gradle
  :commands (flycheck-gradle-setup)
  :hook ((java-mode . flycheck-gradle-setup)
         (java-ts-mode . flycheck-gradle-setup)
         (kotlin-mode . flycheck-gradle-setup)
         (kotlin-ts-mode . flycheck-gradle-setup)))

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
  :ensure t
  :defer t
  :mode ("\\.groovy\\'" "\\.gradle\\'"))



(message "[init] init-java loaded")

(provide 'init-java)
;;; init-java.el ends here
