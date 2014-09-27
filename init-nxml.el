;;; init-nxml.el --- nXML


;;; Commentary:
;; nXMLn

;;; Code:
(require 'nxml-mode)
(fset 'xml-mode 'nxml-mode)
(require-package 'auto-complete-nxml)

(add-to-list 'auto-mode-alist
			 (cons 
			  (concat "\\." 
					  (regexp-opt '("xml" 
									"xsd"
									"sch"
									"rng" 
									"xslt" 
									"svg"
									"rss") t)
					  "\\'")
			  'nxml-mode))

;;; Use nxml-mode instead of sgml, xml or html mode.
(mapc (lambda (pair)
		(if (or (eq (cdr pair) 'xml-mode)
				(eq (cdr pair) 'sgml-mode))
			(setcdr pair 'nxml-mode)))
	  magic-mode-alist)

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

(provide 'init-nxml)

;;; init-nxml.el ends here
