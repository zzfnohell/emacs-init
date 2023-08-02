;;; init-sql.el --- sql mode
;;; Commentary:
;;
;;; Code:
(use-package sql-indent
  :ensure t
  :config
  (eval-after-load "sql"
    '(load-library "sql-indent")))

(use-package sql
  :ensure t
  :config
  (add-hook 'sql-mode-hook #'sql-indent)
  (when (eq system-type 'windows-nt)
    (setq sql-mysql-options '("-C" "-t" "-f" "-n"))))

(message "loading init-sql done.")

(provide 'init-sql)

;;; init-sql.el ends here
