;;; init-ai.el --- AI

;;; Commentary:
;; 
(use-package gptel
  :ensure t
  :defer t
  :config
  ;; (setq-default
  ;;  gptel-default-mode 'org-mode
  ;;  gptel-post-response-functions #'gptel-end-of-response
  ;;  gptel-model 'gemini-pro-latest
  ;;  gptel-backend (gptel-make-gemini "Gemini"
  ;;                  :key (getenv "GEMINI_API_KEY")
  ;;                  :stream t))

  (setq-default
   gptel-default-mode 'org-mode
   gptel-post-response-functions #'gptel-end-of-response
   gptel-model   'deepseek-reasoner
   gptel-backend (gptel-make-deepseek "DeepSeek"
                   :stream t
                   :key (getenv "DEEPSEEK_API_KEY"))))

(use-package agent-shell
  :ensure t
  :defer t)

(use-package ai-code
  ;; :straight (:host github :repo "tninja/ai-code-interface.el")
  :ensure t
  :defer t
  :commands (ai-code-menu)
  :bind ("C-c a" . ai-code-menu)
  :init
  ;; Keep auto-revert available at startup without loading the full AI stack.
  (global-auto-revert-mode 1)
  (setq auto-revert-interval 1)
  :config
  ;; use gemini as backend; other options: codex, claude-code, aider, ...
  (ai-code-set-backend 'gemini)
  (ai-code-prompt-filepath-completion-mode 1)
  (setq ai-code-auto-test-type 'ask-me)
  (with-eval-after-load 'evil (ai-code-backends-infra-evil-setup))
  (with-eval-after-load 'magit
    (ai-code-magit-setup-transients)))

(provide 'init-ai)

;;; init-ai.el ends here
