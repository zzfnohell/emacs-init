(require 'flymake)
(push '(".+\\.xsl$" flymake-xml-init) flymake-allowed-file-name-masks)

(add-hook 'xsl-mode-hook
          (lambda () (flymake-mode t)))

(require 'flymake-jslint)
(add-hook 'js-mode-hook 'flymake-jslint-load)

(require 'flymake-json)
;;Then, if you're using `json-mode':
(add-hook 'json-mode 'flymake-json-load)
;; or, if you use `js-mode' for json:
;;  (add-hook 'js-mode-hook 'flymake-json-maybe-load)
;; otherwise:
;;  (add-hook 'find-file-hook 'flymake-json-maybe-load)

(require 'flymake-coffee)
(add-hook 'coffee-mode-hook 'flymake-coffee-load)

(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))
