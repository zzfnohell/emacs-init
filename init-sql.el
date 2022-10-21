;;; init-sql.el --- sql mode
;;; Commentary:
;;
;;; Code:

(use-package sql
  :ensure t
  :hook ((sql . sql-indent))
  :config
  (when (eq system-type 'windows-nt)
    (setq sql-mysql-options '("-C" "-t" "-f" "-n"))))

(use-package sql-indent
  :ensure t
  :defer t
  :config
  (eval-after-load "sql"
    '(load-library "sql-indent")))
	
(message "loading init-sql done.")

(provide 'init-sql)

;;; init-sql.el ends here
