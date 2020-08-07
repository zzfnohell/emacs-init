;;; init-sql.el --- sql mode

;;; Commentary:
;; 

;;; Code:

(use-package sql
  :config
  (when (eq system-type 'windows-nt)
    (setq sql-mysql-options '("-C" "-t" "-f" "-n"))))

(use-package sql-indent
  :config
  (eval-after-load "sql"
    '(load-library "sql-indent")))




(provide 'init-sql)

;;; init-sql.el ends here
