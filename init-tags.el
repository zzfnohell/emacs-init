;;; init-tags.el --- TAGS -*- lexical-binding: t; -*-

;;; Commentary:
;; Tag-based code navigation:
;; - Citre (universal-ctags + optional GNU Global) — primary for prog-mode
;; - ggtags — GNU Global UX in C-family buffers when `global' is installed
;; - xcscope — on-demand cscope commands
;;
;; Note: colorful-mode also uses the `C-x c' prefix (`C-x c x/c/r'); Citre
;; reference commands therefore use `C-x c R/P/U' instead of `C-x c r'.

;;; Code:

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

(defun init-tags/project-root ()
  "Project root for Citre; prefer Projectile when loaded."
  (or (and (fboundp 'projectile-project-root)
           (projectile-project-root))
      (when-let ((proj (project-current)))
        (project-root proj))
      default-directory))

(use-package citre
  :ensure t
  :defer t
  :init
  ;; Required in :init so update/create commands autoload correctly
  ;; (see citre-config.el / Citre README).
  (require 'citre-config)
  ;; citre-config only pulls lang support after cc-mode; treesit C/C++
  ;; modes do not load cc-mode.
  (with-eval-after-load 'c-ts-mode (require 'citre-lang-c))
  (with-eval-after-load 'c++-ts-mode (require 'citre-lang-c))
  :bind (("C-x c j" . citre-jump)
         ("C-x c J" . citre-jump-back)
         ("C-x c p" . citre-ace-peek)
         ("C-x c u" . citre-update-this-tags-file)
         ;; Global backend (C-x c r is colorful-convert-and-change-color).
         ("C-x c R" . citre-jump-to-reference)
         ("C-x c P" . citre-ace-peek-reference)
         ("C-x c U" . citre-global-update-database))
  :custom
  (citre-project-root-function #'init-tags/project-root)
  (citre-default-create-tags-file-location 'global-cache)
  (citre-edit-ctags-options-manually nil)
  (citre-auto-enable-citre-mode-modes '(prog-mode)))

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
