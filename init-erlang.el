;;; init-erlang.el --- Erlang


;;; Commentary:
;;

;;; Code:

(use-package erlang
	:ensure t
  :defer t
	:config
	(require 'erlang-start))

(message "[init] init-erlang loaded")

(provide 'init-erlang)

;;; init-erlang.el ends here
