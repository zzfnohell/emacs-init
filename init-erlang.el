;;; init-erlang.el --- Erlang


;;; Commentary:
;;

;;; Code:

(use-package erlang
	:ensure t
  :defer t
	:config
	(require 'erlang-start))

(message "loading init-erlang done.")

(provide 'init-erlang)

;;; init-erlang.el ends here
