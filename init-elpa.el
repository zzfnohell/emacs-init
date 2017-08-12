;;; init-elpa.el --- ELPA

;;; Commentary:
;; 

;;; Code:

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)

(unless (package-installed-p 'req-package)
  (package-refresh-contents)
  (package-install 'req-package))

(eval-when-compile
  (require 'use-package)
	(require 'req-package))

(setq use-package-always-ensure t)
(require 'diminish)
(require 'bind-key)

(provide 'init-elpa)

;;; init-elpa.el ends here
