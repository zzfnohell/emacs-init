;;; init-java.el --- JAVA


;;; Commentary:
;;

;;; Code:



(use-package flycheck-gradle
  :ensure t
  :after flycheck
  ;; Package docs: call setup once after flycheck loads (not per major-mode).
  ;; Upstream checkers only list java-mode / kotlin-mode; extend to treesit
  ;; remaps from init-prog.el.
  :config
  (dolist (mode '(java-ts-mode kotlin-ts-mode))
    (add-to-list 'flycheck-gradle-modes mode))
  (flycheck-add-mode 'gradle-java 'java-ts-mode)
  (flycheck-add-mode 'gradle-kotlin 'kotlin-ts-mode)
  (flycheck-gradle-setup))

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



(message "[init] init-java loaded")

(provide 'init-java)
;;; init-java.el ends here
