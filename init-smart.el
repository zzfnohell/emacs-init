;;; init-smart.el --- smart

;;; Commentary:
;; 


;;; Code:
(require-package 'smart-compile)
(require 'smart-compile)

(require-package 'smart-cursor-color)
(require 'smart-cursor-color)
(smart-cursor-color-mode 1)

(require-package 'smart-forward)

(require-package 'smart-indent-rigidly)

(require-package 'smart-mark)

(require-package 'smart-mode-line)
(require 'smart-mode-line)
;; (setq sml/theme 'dark)
;; (setq sml/theme 'light)
;; (setq sml/theme 'respectful)
(sml/setup)

(require-package 'smart-mode-line-powerline-theme)

(require-package 'smart-newline)

(require-package 'smart-region)
(require 'expand-region)
(require 'multiple-cursors)
(require 'cl-lib)

(require-package 'smart-shift)

(require-package 'smart-tab)
(require 'smart-tab)
(global-smart-tab-mode 1)

(require-package 'smart-tabs-mode)
(autoload 'smart-tabs-mode "smart-tabs-mode"
   "Intelligently indent with tabs, align with spaces!")
(autoload 'smart-tabs-mode-enable "smart-tabs-mode")
(autoload 'smart-tabs-advice "smart-tabs-mode")
(autoload 'smart-tabs-insinuate "smart-tabs-mode")
(smart-tabs-insinuate 'c
                      'c++
                      'java
                      'javascript
                      'cperl
                      'python
                      'ruby
                      'nxml)

;; C
(add-hook 'c-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset)

;; JavaScript
(add-hook 'js2-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice js2-indent-line js2-basic-offset)

;; Perl (cperl-mode)
(add-hook 'cperl-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice cperl-indent-line cperl-indent-level)

;; Python
(add-hook 'python-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice python-indent-line-1 python-indent)


(provide 'init-smart)

;;; init-smart.el ends here
