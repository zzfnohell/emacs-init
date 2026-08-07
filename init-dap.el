;;; init-dap.el --- Debug Adapter Protocol -*- lexical-binding: t; -*-

;;; Commentary:
;; Debugging layer. Prefer `dap-mode' (works with Eglot for editing;
;; dap still needs the lsp-mode *library*). `realgud' and built-in GUD
;; remain available for classic debuggers.
;;
;; Language adapters (`dap-python', `dap-go', …) only register templates
;; when required — see dap-mode docs. Python is the auto-enabled host
;; mode; other languages load adapters with the package and use
;; `M-x dap-debug'.

;;; Code:

(defun init-dap/hydra-on-stop (&rest _)
  "Show `dap-hydra' when a debug session stops.
`dap-stopped-hook' runs with the session as an argument; `dap-hydra'
takes none."
  (call-interactively #'dap-hydra))

(use-package dap-mode
  :ensure t
  :defer t
  :commands (dap-debug dap-debug-last dap-breakpoint-toggle dap-hydra)
  :hook
  (((python-mode python-ts-mode) . dap-mode)
   ((python-mode python-ts-mode) . dap-ui-mode)
   (dap-stopped . init-dap/hydra-on-stop))
  :custom
  ;; Match dap-mode docs: sessions / locals / breakpoints / …
  (dap-auto-configure-features
   '(sessions locals breakpoints expressions controls tooltip))
  (dap-python-debugger 'debugpy)
  :config
  (dap-auto-configure-mode)
  ;; Adapters register debug templates. Soft-require so a missing
  ;; optional file does not abort the whole dap config.
  (dolist (feat '(dap-python dap-gdb dap-go dap-chrome dap-node dap-pwsh))
    (when (locate-library (symbol-name feat))
      (require feat)))
  ;; Prefer PATH python via the stock finder. Do not override
  ;; `dap-python--pyenv-executable-find' — that broke uv / non-pyenv
  ;; envs and ignored the COMMAND argument.
  )

(use-package realgud
  :ensure t
  :defer t
  :commands (realgud:gdb realgud:pdb realgud:pdb-remote))

;; Built-in GUD/gdb-mi (not realgud). Prefer many-windows when gdb starts.
(use-package gdb-mi
  :ensure nil
  :defer t
  :init
  (setq gdb-many-windows t))

(message "[init] init-dap loaded")

(provide 'init-dap)

;;; init-dap.el ends here
