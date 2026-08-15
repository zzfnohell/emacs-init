
;;; init-elpa.el --- ELPA

;;; Commentary:
;; elpa

;;; Code:

(require 'package)
;; (setq package-enable-at-startup nil)
(setq package-native-compile t)
(setq package-gnupghome-dir (concat user-emacs-directory "elpa/gnupg"))

;; https://www.github.com/purcell/emacs.d/blob/master/lisp/init-elpa.el
;; Install into separate package dirs for each Emacs version,
;; to prevent bytecode incompatibility
(setq package-user-dir
      (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                        user-emacs-directory))

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Combine package autoloads into one file for faster startup.  After
;; installing/removing packages, run `M-x package-quickstart-refresh'.
(setq package-quickstart t)
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure nil)
(setq use-package-always-demand (daemonp))

(use-package auto-package-update
  :defer t
  :commands (auto-package-update-now auto-package-update-maybe)
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (setq auto-package-update-interval 14))

;; (auto-package-update-maybe)
;; (auto-package-update-now)

(require 'bind-key)

(message "[init] init-elpa loaded")

(provide 'init-elpa)

;;; init-elpa.el ends here
