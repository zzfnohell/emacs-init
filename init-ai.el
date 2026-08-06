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
  ;; :straight (:host github :repo "tninja/ai-code-interface.el") ;; if you want to use straight to install, no need to have MELPA setting above
  ;; Deferred: loading ai-code eagerly pulls in magit, org and eshell and cost
  ;; ~1.7s of startup. It now loads on first use via the C-c a entry point.
  :defer t
  :bind ("C-c a" . ai-code-menu)
  :init
  ;; Auto-revert is a general editing preference, so keep it enabled at startup
  ;; (it does not require ai-code to be loaded).
  (setq auto-revert-interval 1) ;; set to 1 second for faster update
  (global-auto-revert-mode 1)
  :config
  ;; use codex as backend, other options are 'claude-code, 'gemini, 'github-copilot-cli, 'opencode, 'grok, 'cursor, 'kiro, 'codebuddy, 'aider, 'agent-shell, 'claude-code-ide, 'claude-code-el
  ;; (ai-code-set-backend 'codex)
  (ai-code-set-backend 'gemini)
  ;; Optional: Use eat if you prefer, by default it is vterm
  ;; (setq ai-code-backends-infra-terminal-backend 'eat) ;; config for native CLI backends. for external backends such as agent-shell, claude-code-ide.el and claude-code.el, please check their own config
  ;; Optional: Enable @ file completion in comments and AI sessions
  (ai-code-prompt-filepath-completion-mode 1)
  ;; Optional: Ask AI to run test after code changes, for a tighter build-test loop
  (setq ai-code-auto-test-type 'ask-me)
  ;; Optional: In AI session buffers, SPC in Evil normal state triggers the prompt-enter UI
  (with-eval-after-load 'evil (ai-code-backends-infra-evil-setup))
  ;; Optional: Set up Magit integration for AI commands in Magit popups
  (with-eval-after-load 'magit
    (ai-code-magit-setup-transients)))

(provide 'init-ai)

;;; init-ai.el ends here
