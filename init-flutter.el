;;; init-flutter.el --- Flutter/Dart
;; Assuming usage with dart-mode

;;; Commentary:
;; 

;; A sample .dir-locals.el to go in your project root:
;; ((dart-mode
;;   (flutter-l10n-classname . "AppLocalizations")
;;   (flutter-l10n-file . "lib/app_l10n.dart")))

;; The propline for your L10N file:
;; // -*- flycheck-checker: intl_translation; -*-

;;; Code:

(use-package dart-mode
  :ensure t
  :defer t
  :mode "\\.dart\\'"
  :custom
  (dart-format-on-save t))

(use-package flutter
  :ensure t
  :defer t
  :after dart-mode
  :hook (dart-mode . flutter-mode)
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload)))

;; Optional
(use-package flutter-l10n-flycheck
  :ensure t
  :requires flutter
  :hook (dart-mode . flutter-l10n-flycheck-setup))

(provide 'init-flutter)

;;; init-flutter.el ends here
