;;; init-skeletor.el --- Skeletor

;;; Commentary:
;; 

(use-package skeletor
  :ensure t
  :custom
  (skeletor-user-directory "~/.emacs.d/init/init-skeletor-projects")
	:config
	(skeletor-define-template "conan-app"
		:title "Conan App"
		:default-license (rx bol "gpl")
		:substitutions
		'(("__TITLE__" . (lambda () (read-string "Description: ")))))
	(skeletor-define-template "conan-lib"
		:title "Conan App"
		:default-license (rx bol "gpl")
		:substitutions
		'(("__TITLE__" . (lambda () (read-string "Description: ")))))
	(skeletor-define-template "cmake-project"
		:title "CMake Project"
		:default-license (rx bol "gpl")
		:substitutions
		'(("__TITLE__" . (lambda () (read-string "Description: ")))))
	(skeletor-define-template "cmake-project-swig"
		:title "CMake Project (SWIG)"
		:default-license (rx bol "gpl")
		:substitutions
		'(("__TITLE__" . (lambda () (read-string "Description: ")))))
	(skeletor-define-template "skewer-index-html-package"
		:title "Skewer Index Html"
		:no-license? t
		:no-git? t
		:substitutions
		'(("__TITLE__" . (lambda () (read-string "Description: ")))))
	)

(provide 'init-skeletor)

;;; init-skeletor.el ends here
