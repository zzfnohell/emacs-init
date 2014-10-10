;;; init-csv.el --- CSV

;;; Commentary:
;; 

;;; Code:

(require-package 'csv-mode)
(require-package 'csv-nav)
(add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")

(setq csv-separators '("," ";" "|" " "))

(provide 'init-csv)

;;; init-csv.el ends here
