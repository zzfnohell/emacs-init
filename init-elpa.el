
;;; init-elpa.el --- ELPA

;;; Commentary:
;; 

;;; Code:

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/"))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'use-package-ensure-system-package))

(eval-when-compile (require 'use-package))

(setq use-package-always-ensure t)
(use-package use-package-ensure-system-package)

;; (use-package auto-package-update
;;   :config
;;   (setq auto-package-update-delete-old-versions t)
;;   (setq auto-package-update-hide-results t)
;;   (auto-package-update-maybe))

(require 'bind-key)

(provide 'init-elpa)

;;; init-elpa.el ends here
