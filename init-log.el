;;; init-log.el --- Log -*- lexical-binding: t -*-

;;; Commentary:
;; 

(use-package logview
  :ensure t)

(use-package vlf
  :ensure t
  :config
  (require 'vlf-setup))

(use-package syslog-mode
	:ensure t)

(provide 'init-log)

;;; init-log.el ends here
