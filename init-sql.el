;;; init-sql.el --- sql mode

;;; Commentary:
;; 

;;; Code:

(require 'sql)

(use-package sql-indent
  :defer t
  :config
  (eval-after-load "sql"
    '(load-library "sql-indent")))


(provide 'init-sql)

;;; init-sql.el ends here
