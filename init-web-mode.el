;;; init-web-mode.el --- web-mode

;;; Commentary:
;; Web mode

;;; Code:

(require-package 'web-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.htm?\\'" . web-mode))

;; A specific engine can be forced with web-mode-engines-alist.
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\."))
)


(defun web-mode-hook ()
  "Hooks for Web mode."
  ;; Indentation
  ;;HTML offset indentation
  (setq web-mode-markup-indent-offset 2)
  ;;CSS offset indentation
  (setq web-mode-css-indent-offset 2)
  ;;Script offset indentation (for JavaScript, Java, PHP, etc.)
  (setq web-mode-code-indent-offset 2)
  ;; HTML content is not indented by default
  ;; (indeed, indenting the content of a TEXTAREA
  ;; for example can have nasty side effects
  ;; You can change this behaviour with
  (setq web-mode-indent-style 2)
  ;; Padding
  ;;For <style> parts
  (setq web-mode-style-padding 1)
  ;; For <script> parts
  (setq web-mode-script-padding 1)
  ;; For multi-line blocks
  (setq web-mode-block-padding 0)
  ;; Comments
  ;; You can choose to comment with server comment instead of client (HTML/CSS/Js) comment with
  (setq web-mode-comment-style 2)
  ;;Enable / disable features
  ;;Auto-pairing
  (setq web-mode-disable-auto-pairing t)
  ;;CSS colorization
  (setq web-mode-disable-css-colorization t)
  ;;Block face: can be used to set blocks background (see web-mode-block-face)
  (setq web-mode-enable-block-face t)
  ;;Part face: can be used to set parts background (see web-mode-part-face)
  (setq web-mode-enable-part-face t)
  ;;Comment keywords (see web-mode-comment-keyword-face)
  (setq web-mode-enable-comment-keywords t)
  ;;Highlight current HTML element (see web-mode-current-element-highlight-face)
  (setq web-mode-enable-current-element-highlight t)
  ;;Heredoc (cf. PHP strings) fontification (when the identifier is <<<EOTHTML or <<<EOTJAVASCRIPT)
  (setq web-mode-enable-heredoc-fontification t)
  ;;The customisations below should not be put in the hook. Declare them before loading web-mode.el
  ;;Keywords
  ;;Add PHP constants
  (setq web-mode-extra-php-constants '("constant1" "constant2"))
)


(add-hook 'web-mode-hook  'web-mode-hook)

(provide 'init-web-mode)

;;; init-web-mode.el ends here
