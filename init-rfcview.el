(add-to-list 'auto-mode-alist
             '("/\\(rfc\\|std\\)[0-9]+\\.txt\\'" . rfcview-mode))
(autoload 'rfcview-mode "rfcview" nil t)
\n(provide \'init-rfcview.el)
