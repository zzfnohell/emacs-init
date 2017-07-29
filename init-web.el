;;; init-web-mode.el --- Web Mode

;;; Commentary:
;; 

;;; Code:

(use-package web-mode
  :config
  (progn
    (setq web-mode-enable-current-element-highlight nil)
    (setq web-mode-enable-current-column-highlight nil)

    (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

    (setq web-mode-engines-alist
          '(("php"    . "\\.phtml\\'")
            ("blade"  . "\\.blade\\.")))

    (add-to-list 'auto-mode-alist '("\\.api\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("/some/react/path/*\\.js[x]?\\'" . web-mode))

    (defun init-web/custom-web-mode-hook ()
      "Hooks for Web mode."
      (setq web-mode-markup-indent-offset 2)
      (setq web-mode-css-indent-offset 2)
      (setq web-mode-code-indent-offset 2)
      (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
      (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
      (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
      (setq web-mode-style-padding 1)
      (setq web-mode-script-padding 1)
      (setq web-mode-block-padding 0)
      (setq web-mode-comment-style 2)
      (setq web-mode-extra-auto-pairs
            '(("erb"  . (("beg" "end")))
              ("php"  . (("beg" "end")
                         ("beg" "end")))))
      (setq web-mode-enable-auto-pairing t)
      (setq web-mode-enable-css-colorization t)
      (setq web-mode-enable-block-face t)
      (setq web-mode-enable-part-face t)
      (setq web-mode-enable-comment-keywords t)
      (setq web-mode-enable-heredoc-fontification t))

    (add-hook 'web-mode-hook  'init-web/custom-web-mode-hook)
    (add-hook 'web-mode-before-auto-complete-hooks
              '(lambda ()
                 (let ((web-mode-cur-language
                        (web-mode-language-at-pos)))
                   (if (string= web-mode-cur-language "php")
                       (yas-activate-extra-mode 'php-mode)
                     (yas-deactivate-extra-mode 'php-mode))
                   (if (string= web-mode-cur-language "css")
                       (setq emmet-use-css-transform t)
                     (setq emmet-use-css-transform nil)))))

    
    )
  )


(use-package ac-html
  :config
  (progn
    (defun setup-ac-for-haml ()
      ;; Require ac-haml since we are setup haml auto completion
      (require 'ac-haml)
      ;; Require default data provider if you want to use
      (require 'ac-html-default-data-provider)
      ;; Enable data providers,
      ;; currently only default data provider available
      (ac-html-enable-data-provider 'ac-html-default-data-provider)
      ;; Let ac-haml do some setup
      (ac-haml-setup)
      ;; Set your ac-source
      (setq ac-sources '(ac-source-haml-tag
                         ac-source-haml-attr
                         ac-source-haml-attrv))
      ;; Enable auto complete mode
      (auto-complete-mode))

    (add-hook 'haml-mode-hook 'setup-ac-for-haml)

    (add-to-list 'web-mode-ac-sources-alist
                 '("html" . (ac-source-html-tag
                             ac-source-html-attr
                             ac-source-html-attrv)))

    (add-to-list  'web-mode-ac-sources-alist
                  '("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets)))

    (add-to-list 'web-mode-ac-sources-alist
                 '("css" . (ac-source-css-property
                            ac-source-emmet-css-snippets)))

    ;; (add-to-list 'web-mode-ac-sources-alist
    ;;              '("html" . (
    ;;                          ;; attribute-value better to be first
    ;; 			 ;; ac-source-words-in-buffer
    ;; 			 ;; ac-source-abbrev
    ;; 			 ;; ac-source-emmet-html-aliases
    ;; 			 ;; ac-source-emmet-html-snippets
    ;;                          ;;ac-source-html-attribute-value
    ;;                          ;;ac-source-html-tag
    ;;                          ;;ac-source-html-attribute
    ;; 			 )))


    )
  )

(use-package ac-html-bootstrap)
(use-package ac-html-csswatcher :config (ac-html-csswatcher-setup))
(use-package web-beautify)
(use-package kite)
(use-package impatient-mode)
(use-package react-snippets)

;; CSS 
;;; Colourise CSS colour literals
(use-package rainbow-mode
  :config
  (progn
    (dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
      (add-hook hook 'rainbow-mode))
    )
  )


;;; SASS and SCSS
(use-package sass-mode)
(use-package scss-mode :config (setq-default scss-compile-at-save nil))


;;; LESS
(use-package less-css-mode)
(use-package skewer-less)

;;; Auto-complete CSS keywords
(after-load 'auto-complete
  (dolist (hook '(css-mode-hook sass-mode-hook scss-mode-hook))
    (add-hook hook 'ac-css-mode-setup)))

;;; Use eldoc for syntax hints
(use-package css-eldoc
  :config
  (progn
    (autoload 'turn-on-css-eldoc "css-eldoc")
    (add-hook 'css-mode-hook 'turn-on-css-eldoc)
    )
  )

;; Javascript
(use-package json-mode)

(use-package js2-mode
  :config
  (progn
    
    (defcustom preferred-javascript-mode
      (first (remove-if-not #'fboundp '(js2-mode js-mode)))
      "Javascript mode to use for .js files."
      :type 'symbol
      :group 'programming
      :options '(js2-mode js-mode))

    (defvar preferred-javascript-indent-level 2)
    (setq js2-use-font-lock-faces t
          js2-mode-must-byte-compile nil
          js2-basic-offset preferred-javascript-indent-level
          js2-indent-on-enter-key t
          js2-auto-indent-p t
          js2-bounce-indent-p t
          js2-basic-offset 2)
    ))

(use-package ac-js2
  :config
  (progn
    ;;(setq ac-js2-evaluate-calls t)
    ;;(setq ac-js2-external-libraries '(/full/path/to/a/library.js))
    (add-hook 'js2-mode-hook 'ac-js2-mode)

    )
  )

(use-package js2-refactor)
(use-package closure-lint-mode)

(use-package tern
  :config
  (progn
    (setq tern-command '("tern" "--no-port-file" "--persistent"))
    )
  )

(use-package tern-auto-complete
  :config
  (progn
    (add-hook 'js2-mode-hook
              '(lambda ()
                 (define-key js2-mode-map (kbd "TAB") 'indent-for-tab-command)
                 (setq mode-name "JS2")
                 (js2-imenu-extras-setup)
                 (tern-mode t)
                 (tern-ac-setup)))))



;; Need to first remove from list if present,
;; since elpa adds entries too, which may be in an arbitrary order
(eval-when-compile (require 'cl))
(setq auto-mode-alist
      (cons `("\\.js\\(\\.erb\\)?\\'" . ,preferred-javascript-mode)
            (loop for entry in auto-mode-alist
                  unless (eq preferred-javascript-mode (cdr entry))
                  collect entry)))


;; js-mode
(setq js-indent-level preferred-javascript-indent-level)
(add-to-list 'interpreter-mode-alist (cons "node" preferred-javascript-mode))

(use-package js-comint)
(setq inferior-js-program-command "js")


(use-package rainbow-delimiters)
(use-package coffee-mode
  :config
  (progn
    ;; Coffeescript
    (after-load 'coffee-mode
      (setq coffee-js-mode preferred-javascript-mode
            coffee-tab-width preferred-javascript-indent-level))
    
    (add-to-list 'auto-mode-alist '("\\.coffee\\.erb\\'" . coffee-mode))
    ))


(use-package skewer-mode :config (skewer-setup))

;; Node.js
(use-package nodejs-repl)
(use-package sws-mode
  :config (add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode)))
(use-package jade-mode
  :config (add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode)))


(provide 'init-web)

;;; init-web.el ends here
