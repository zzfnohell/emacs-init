;;; init-benchmarking.el --- Measure startup and require times -*- lexical-binding: t -*-
;;; Commentary:
;;

;;; Code:

(use-package esup
  :ensure t
  :defer t
  :commands esup
  ;; To use MELPA Stable use ":pin melpa-stable",
  :pin melpa
  :bind ("C-c B e" . esup))

(use-package benchmark-init
  :ensure t
  ;; Must load (and activate) eagerly so it can measure the rest of init;
  ;; `:demand t' keeps it from being deferred by the `:bind' keys below.
  :demand t
  ;; `C-c B' is the benchmark prefix: t = require-time tree, T = tabulated
  ;; list, e = esup startup profiler (see the esup binding above).
  :bind (("C-c B t" . benchmark-init/show-durations-tree)
         ("C-c B T" . benchmark-init/show-durations-tabulated))
  :config
  (benchmark-init/activate)

  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

;; Always print init duration; useful for CLI batch benchmarks and *Messages*.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "[init] Emacs ready in %s (gc: %d)"
                     (emacs-init-time)
                     gcs-done))
          t)


(message "[init] init-benchmarking loaded")

(provide 'init-benchmarking)

;;; init-benchmarking.el ends here
