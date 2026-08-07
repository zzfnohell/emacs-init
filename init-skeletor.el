;;; init-skeletor.el --- Skeletor

;;; Commentary:
;;

;;; Code:

(defconst init-skeletor/projects-dir
  "~/.emacs.d/init/misc/skeletor-projects")

(defconst init-skeletor/project-name-substitutions
  '(("__PROJECT-NAME__" . (lambda () (read-string "Project Name: "))))
  "Shared Skeletor substitutions prompting for the project name.")

(use-package skeletor
  :ensure t
  :defer t
  :commands
  (skeletor-create-project skeletor-create-project-at)
  :custom
  (skeletor-user-directory init-skeletor/projects-dir))

(defun init-skeletor/define-templates ()
  "Register custom Skeletor project templates.
`skeletor-define-template' is an autoloaded macro; wrapping the
calls in `eval' of a backquoted form avoids macroexpanding (and
thus eagerly loading skeletor + compile/comint) while this file
loads."
  (eval
   `(progn
      (skeletor-define-template "conan-app"
        :title "App CMake Project & Conan Package Manager"
        :default-license (rx bol "gpl")
        :substitutions ,init-skeletor/project-name-substitutions)
      (skeletor-define-template "conan-lib"
        :title "Lib CMake Project & Conan Package Manager"
        :default-license (rx bol "gpl")
        :substitutions ,init-skeletor/project-name-substitutions)
      (skeletor-define-template "conan-meson-app"
        :title "App Meson Project & Conan Package Manager"
        :default-license (rx bol "gpl")
        :substitutions ,init-skeletor/project-name-substitutions)
      (skeletor-define-template "conan-meson-lib"
        :title "Lib Meson Project & Conan Package Manager"
        :default-license (rx bol "gpl")
        :substitutions ,init-skeletor/project-name-substitutions)
      (skeletor-define-template "conan-swig-app"
        :title "App CMake Project & Conan Package Manager & Swig"
        :default-license (rx bol "gpl")
        :substitutions ,init-skeletor/project-name-substitutions)
      (skeletor-define-template "conan-swig-lib"
        :title "Lib CMake Project & Conan Package Manager & Swig"
        :default-license (rx bol "gpl")
        :substitutions ,init-skeletor/project-name-substitutions)
      (skeletor-define-template "makefile-project"
        :title "Makefile Project"
        :default-license (rx bol "gpl")
        :substitutions ,init-skeletor/project-name-substitutions)
      (skeletor-define-template "vcpkg-app"
        :title "CMake Vcpkg App"
        :no-license? t
        :no-git? t
        :substitutions ,init-skeletor/project-name-substitutions)
      (skeletor-define-template "skewer-index-html-package"
        :title "Skewer Index Html"
        :no-license? t
        :no-git? t
        :substitutions ,init-skeletor/project-name-substitutions)
      (skeletor-define-template "cpp-starter"
        :title "Cpp Starter Project"
        :no-license? t
        :no-git? t
        :substitutions ,init-skeletor/project-name-substitutions)
      (skeletor-define-template "cpp-doctest-starter"
        :title "Cpp Doctest Starter Project"
        :no-license? t
        :no-git? t
        :substitutions ,init-skeletor/project-name-substitutions))))

(eval-after-load 'skeletor #'init-skeletor/define-templates)

(provide 'init-skeletor)

;;; init-skeletor.el ends here
