;;; init-ml.el --- Markup Language

;;; Commentary:
;;

(use-package nxml-mode
  :ensure nil
  :mode (("\\.xml\\'" . nxml-mode)
         ("\\.xsd\\'" . nxml-mode)
         ("\\.sch\\'" . nxml-mode)
         ("\\.rng\\'" . nxml-mode)
         ("\\.xslt\\'" . nxml-mode)
         ("\\.svg\\'" . nxml-mode)
         ("\\.rss\\'" . nxml-mode))
  )

;; See: http://sinewalker.wordpress.com/2008/06/26/pretty-printing-xml-with-emacs-nxml-mode/
(defun pp-xml-region (begin end)
  "Pretty format XML markup in region. The function inserts
linebreaks to separate tags that have nothing but whitespace
between them.  It then indents the markup by using nxml's
indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n"))
    (indent-region begin end)))

(use-package markdown-mode :ensure t)

(use-package auto-complete-nxml :ensure t)

(use-package haml-mode
  :after markdown-mode
  :ensure t
  )

;;; YAML
(use-package yaml-mode
  :ensure t
  :mode ("\\.yml$" . yaml-mode)
  )

(provide 'init-ml)

;;; init-ml.el ends here
