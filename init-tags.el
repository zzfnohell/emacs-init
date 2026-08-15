;;; init-tags.el --- TAGS -*- lexical-binding: t; -*-

;;; Commentary:
;; Tag-based code navigation:
;; - Citre (universal-ctags + optional GNU Global) — primary for prog-mode
;; - ggtags — GNU Global UX in C-family buffers when `global' is installed
;; - xcscope — on-demand cscope commands
;;
;; Note: colorful-mode also uses the `C-x c' prefix (`C-x c x/c/r'); Citre
;; reference commands therefore use `C-x c R/P/U' instead of `C-x c r'.
;;
;; Windows + Scoop: see `misc/gtags.conf' and `misc/windows-gtags-env.ps1'.
;; `init-tags/maybe-setup-windows-global' points Citre/gtags at Scoop tools
;; and sets GTAGSCONF / GTAGSLABEL when unset.

;;; Code:

(require 'cl-lib)

(defun init-tags/scoop-roots ()
  "Candidate Scoop root directories on Windows."
  (delq nil
        (list (let ((home (getenv "USERPROFILE")))
                (and home (expand-file-name "scoop" home)))
              "c:/Scoop"
              "d:/Scoop")))

(defun init-tags/scoop-file (&rest parts)
  "Return the first existing Scoop path built from PARTS, or nil."
  (cl-loop for root in (init-tags/scoop-roots)
           for path = (apply #'expand-file-name (append parts (list root)))
           when (file-exists-p path) return path))

(defun init-tags/gtags-conf-file ()
  "Path to this repo's Windows-oriented gtags.conf, if present."
  (let* ((here (file-name-directory (or load-file-name
                                        (locate-library "init-tags")
                                        "")))
         (conf (expand-file-name "misc/gtags.conf" here)))
    (when (file-readable-p conf) conf)))

(defvar citre-ctags-program)
(defvar citre-readtags-program)
(defvar citre-gtags-program)
(defvar citre-global-program)

(defun init-tags/maybe-setup-windows-global ()
  "Configure GNU Global / Citre paths for Windows Scoop installs.
No-op on non-Windows.  Does not override variables or env vars the user
already set (e.g. in custom.el / system env)."
  (when (eq system-type 'windows-nt)
    (when-let ((ctags (init-tags/scoop-file
                       "apps/universal-ctags/current/ctags.exe")))
      (unless (and (boundp 'citre-ctags-program) citre-ctags-program)
        (setq citre-ctags-program ctags))
      (unless (and (boundp 'citre-readtags-program) citre-readtags-program)
        (let ((readtags (expand-file-name
                         "readtags.exe" (file-name-directory ctags))))
          (when (file-exists-p readtags)
            (setq citre-readtags-program readtags)))))
    (when-let ((gtags (or (init-tags/scoop-file "apps/global/current/bin/gtags.exe")
                          (init-tags/scoop-file "apps/global/current/gtags.exe"))))
      (unless (and (boundp 'citre-gtags-program) citre-gtags-program)
        (setq citre-gtags-program gtags))
      (let ((global (expand-file-name "global.exe" (file-name-directory gtags))))
        (when (and (file-exists-p global)
                   (not (and (boundp 'citre-global-program) citre-global-program)))
          (setq citre-global-program global))))
    (when-let ((conf (init-tags/gtags-conf-file)))
      (unless (getenv "GTAGSCONF")
        (setenv "GTAGSCONF" conf))
      (unless (getenv "GTAGSLABEL")
        (setenv "GTAGSLABEL" "new-ctags")))
    (unless (getenv "GTAGSOBJDIRPREFIX")
      (let ((cache "c:/cache/gtagsdb"))
        (make-directory cache t)
        (setenv "GTAGSOBJDIRPREFIX" cache)))))

(init-tags/maybe-setup-windows-global)

(defun init-tags/enable-ggtags ()
  "Enable ggtags when GNU Global is available.
`ggtags-mode' already wires xref, eldoc and CAPF; keep only the
classic imenu / hippie-expand extras from the ggtags recipe."
  (when (executable-find "global")
    (require 'ggtags)
    (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
    (setq-local hippie-expand-try-functions-list
                (cons #'ggtags-try-complete-tag
                      hippie-expand-try-functions-list))
    (ggtags-mode 1)))

(use-package ggtags
  :ensure t
  :defer t
  :custom
  (ggtags-use-idutils t)
  :hook
  ((c-mode c-ts-mode
    c++-mode c++-ts-mode
    c-or-c++-mode c-or-c++-ts-mode
    csharp-mode csharp-ts-mode
    java-mode java-ts-mode)
   . init-tags/enable-ggtags))

(use-package citre
  :ensure t
  :defer t

  :bind (("C-x c j" . citre-jump)
         ("C-x c J" . citre-jump-back)
         ("C-x c p" . citre-ace-peek)
         ("C-x c u" . citre-update-this-tags-file)
         ;; Global backend (C-x c r is colorful-convert-and-change-color).
         ("C-x c R" . citre-jump-to-reference)
         ("C-x c P" . citre-ace-peek-reference)
         ("C-x c U" . citre-global-update-database))
  :config
  (setq
   ;; Set this if you use project management plugin like projectile.  It's
   ;; used for things like displaying paths relatively, see its docstring.
   citre-project-root-function #'projectile-project-root
   ;; Set this if you want to always use one location to create a tags file.
   citre-default-create-tags-file-location 'global-cache
   ;; Set this if you'd like to use ctags options generated by Citre
   ;; directly, rather than further editing them.
   citre-edit-ctags-options-manually nil
   ;; If you only want the auto enabling citre-mode behavior to work for
   ;; certain modes (like `prog-mode'), set it like this.
   citre-auto-enable-citre-mode-modes '(prog-mode))
   
   
   ;; If Citre makes opening remote files slow, set this to nil.
   citre-auto-enable-citre-mode-backends-for-remote nil)
 


(use-package xcscope
  :ensure t
  :defer t
  :commands (cscope-find-this-symbol
             cscope-find-global-definition
             cscope-find-called-functions
             cscope-find-functions-calling-this-function
             cscope-find-this-text-string
             cscope-setup)
  :config
  (cscope-setup))

(message "[init] init-tags loaded")

(provide 'init-tags)
;;; init-tags.el ends here
