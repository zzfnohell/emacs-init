
;;; init-elpa.el --- ELPA

;;; Commentary:
;; 

;;; Code:

(require 'package)
;; (setq package-enable-at-startup nil)
(setq package-native-compile t)

;; https://www.github.com/purcell/emacs.d/blob/master/lisp/init-elpa.el
;; Install into separate package dirs for each Emacs version,
;; to prevent bytecode incompatibility
(setq package-user-dir
      (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
       user-emacs-directory))

;; (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;                           ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'use-package-ensure-system-package))

(eval-when-compile (require 'use-package))

(setq use-package-always-ensure t)
(use-package use-package-ensure-system-package)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (setq auto-package-update-interval 14))
  
;; (auto-package-update-maybe)
;; (auto-package-update-now)

(require 'bind-key)

(message "loading init-elpa done.")

(provide 'init-elpa)

;;; init-elpa.el ends here
