;;; init-skeletor.el --- Skeletor

;;; Commentary:
;; 

;;; Code:
;;
(defconst init-skeletor/projects-dir
	"~/.emacs.d/init/misc/init-skeletor-projects")

(use-package skeletor
  :ensure t
  :defer t
  :custom
  (skeletor-user-directory init-skeletor/projects-dir)
	:config
  (skeletor-define-template "conan-app"
		:title "CMake Project & Conan Package Manager"
		:default-license (rx bol "gpl")
		:substitutions
		'(("__PROJECT-NAME__" . (lambda () (read-string "Project Name: ")))))
  (skeletor-define-template "conan-lib"
		:title "CMake Project & Conan Package Manager"
		:default-license (rx bol "gpl")
		:substitutions
		'(("__PROJECT-NAME__" . (lambda () (read-string "Project Name: ")))))
	(skeletor-define-template "conan-swig-app"
		:title "CMake Project & Conan Package Manager & Swig"
		:default-license (rx bol "gpl")
		:substitutions
		'(("__PROJECT-NAME__" . (lambda () (read-string "Project Name: ")))))
	(skeletor-define-template "conan-swig-lib"
		:title "CMake Project & Conan Package Manager & Swig"
		:default-license (rx bol "gpl")
		:substitutions
		'(("__PROJECT-NAME__" . (lambda () (read-string "Project Name: ")))))
	(skeletor-define-template "makefile-project"
		:title "Makefile Project"
		:default-license (rx bol "gpl")
		:substitutions
		'(("__PROJECT-NAME__" . (lambda () (read-string "Project Name: ")))))
	(skeletor-define-template "skewer-index-html-package"
		:title "Skewer Index Html"
		:no-license? t
		:no-git? t
		:substitutions
		'(("__PROJECT-NAME__" . (lambda () (read-string "Project Name: "))))))

(provide 'init-skeletor)

;;; init-skeletor.el ends here
