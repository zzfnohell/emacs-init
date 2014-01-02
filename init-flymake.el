;;; init-flymake.el --- Flymake

;;; Commentary:
;; Flymake

;;; Code:
(require 'flymake)
(push '(".+\\.xsl$" flymake-xml-init) flymake-allowed-file-name-masks)

(add-hook 'xsl-mode-hook
          (lambda () (flymake-mode t)))

(require-package 'flycheck)

(require-package 'flymake-checkers)

(require-package 'flymake-jslint)
(require 'flymake-jslint)
(add-hook 'js-mode-hook 'flymake-jslint-load)

(require-package 'flymake-jslint)
(require 'flymake-jslint)
(add-hook 'js-mode-hook 'flymake-jslint-load)

(require-package 'flymake-json)
(require 'flymake-json)
;;Then, if you're using `json-mode':
(add-hook 'json-mode 'flymake-json-load)
;; or, if you use `js-mode' for json:
;;  (add-hook 'js-mode-hook 'flymake-json-maybe-load)
;; otherwise:
;;  (add-hook 'find-file-hook 'flymake-json-maybe-load)

(require-package 'flymake-coffee)
(require 'flymake-coffee)
(add-hook 'coffee-mode-hook 'flymake-coffee-load)

(require-package 'flymake-yaml)
(require 'flymake-yaml) ;; Not necessary if using ELPA package
(add-hook 'yaml-mode-hook 'flymake-yaml-load)

(require-package 'flymake-python-pyflakes)
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "flake8")
(setq flymake-python-pyflakes-extra-arguments '("--ignore=W806"))

(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))

(provide 'init-flymake)

;;; init-flymake.el ends here
