;;; init-sql.el --- sql mode
;;; Commentary:
;;
;;; Code:
(use-package sql-indent
  :ensure t
  :hook
  (sql-mode . sql-indent))

(use-package sql
  :ensure t
  :defer t
  :config
  (when (eq system-type 'windows-nt)
    (setq sql-mysql-options '("-C" "-t" "-f" "-n"))))

(message "loading init-sql done.")

(provide 'init-sql)

;;; init-sql.el ends here
