;;; init-clojure.el --- Clojure

;;; Commentary:
;; 

;;; Code:

(require-package 'clojure-mode)
(require-package 'cljsbuild-mode)
(require-package 'elein)
(require-package 'cider)
(require-package 'ac-cider)
(require-package 'clojure-snippets)

(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

(after-load 'clojure-mode
  (add-hook 'clojure-mode-hook 'sanityinc/lisp-setup)
  (add-hook 'clojure-mode-hook 'subword-mode))


;; Use clojure-mode for clojurescript, since clojurescript-mode
;; pulls in Slime
(add-auto-mode 'clojure-mode "\\.cljs\\'")


(provide 'init-clojure)

;;; init-clojure.el ends here
