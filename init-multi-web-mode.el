;;; init-multi-web-mode.el --- MULTI WEB MODE


;;; Commentary:
;; 


;;; Code:
(require-package 'multi-web-mode)
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)

(setq mweb-tags 
	  '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
		(js2-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
		(css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))

(setq mweb-filename-extensions 
	  '("php" 
		"htm" 
		"html"
		"ctp"
		"phtml"
		"php4"
		"php5"))

(multi-web-global-mode 1)

(provide 'init-multi-web-mode)

;;; init-multi-web-mode.el ends here
