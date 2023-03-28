;;; init-clojure.el --- Clojure

;;; Commentary:
;; 

;;; Code:

(use-package clojure-mode
  :ensure t)

(use-package cljsbuild-mode)
(use-package elein)

(use-package cider
  :ensure t)

(message "loading init-clojure done.")

(provide 'init-clojure)

;;; init-clojure.el ends here
