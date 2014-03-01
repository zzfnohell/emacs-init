(require-package 'json-mode)

(require-package 'js2-mode)
(require-package 'ac-js2)
(require-package 'js2-refactor)
(require 'js2-refactor)

(require-package 'tern)
(require-package 'tern-auto-complete)
(require 'tern)
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

(after-load 'js2-mode
  (define-key js2-mode-map (kbd "TAB") 'indent-for-tab-command)
  (add-hook 'js2-mode-hook
            '(lambda ()
               (setq mode-name "JS2")
               (tern-mode t)))
  (js2-imenu-extras-setup))

(defcustom preferred-javascript-mode
  (first (remove-if-not #'fboundp '(js2-mode js-mode)))
  "Javascript mode to use for .js files."
  :type 'symbol
  :group 'programming
  :options '(js2-mode js-mode))
(defvar preferred-javascript-indent-level 2)

;; Need to first remove from list if present,
;; since elpa adds entries too, which may be in an arbitrary order
(eval-when-compile (require 'cl))
(setq auto-mode-alist
      (cons `("\\.js\\(\\.erb\\)?\\'" . ,preferred-javascript-mode)
            (loop for entry in auto-mode-alist
                  unless (eq preferred-javascript-mode (cdr entry))
                  collect entry)))

(setq js2-use-font-lock-faces t
      js2-mode-must-byte-compile nil
      js2-basic-offset preferred-javascript-indent-level
      js2-indent-on-enter-key t
      js2-auto-indent-p t
      js2-bounce-indent-p t
      js2-basic-offset 2)

;; js-mode
(setq js-indent-level preferred-javascript-indent-level)
(add-to-list 'interpreter-mode-alist (cons "node" preferred-javascript-mode))

(require-package 'js-comint)
(require 'js-comint)
(setq inferior-js-program-command "js")


(require-package 'rainbow-delimiters)

(require-package 'coffee-mode)

;;; Coffeescript
(after-load 'coffee-mode
  (setq coffee-js-mode preferred-javascript-mode
        coffee-tab-width preferred-javascript-indent-level))

(add-to-list 'auto-mode-alist '("\\.coffee\\.erb\\'" . coffee-mode))

(require-package 'skewer-mode)
(require 'skewer-mode)
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(provide 'init-javascript)
