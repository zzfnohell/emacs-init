;;; init-clojure.el --- Clojure

;;; Commentary:
;; 

;;; Code:

(use-package clojure-mode
  :ensure t
  :defer t)

(use-package cljsbuild-mode)
(use-package elein)

(use-package cider
  :ensure t
  :defer t)

(message "loading init-clojure done.")

(provide 'init-clojure)

;;; init-clojure.el ends here
