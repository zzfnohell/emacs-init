;;; init-sql.el --- sql mode

;;; Commentary:
;; 

;;; Code:
(require 'sql)

(require-package 'sql-indent)

(eval-after-load "sql"
  '(load-library "sql-indent"))

(provide 'init-sql)

;;; init-sql.el ends here
