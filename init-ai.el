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
   gptel-model 'qwen-max
   gptel-backend (gptel-make-openai "QWen-Max"
                   :host "dashscope.aliyuncs.com"
                   :endpoint "/compatible-mode/v1/chat/completions"
                   :key (getenv "QWEN_API_KEY")
                   :models
                   '((qwen-max
                      :capabilities (media tool json url)
                      :mime-types
                      ("image/jpeg" "image/png" "image/gif" "image/webp"))
                     (qwen-plus
                      :capabilities (media tool json url)
                      :mime-types
                      ("image/jpeg" "image/png" "image/gif" "image/webp")))
                   :stream t)))

(use-package agent-shell
  :ensure t
  :ensure-system-package
  ;; Add agent installation configs here
  ((qwen . "npm install -g @qwen-code/qwen-code@latest")
   (claude-code-acp . "npm install -g @zed-industries/claude-code-acp")))

(use-package ai-code
  ;; :straight (:host github :repo "tninja/ai-code-interface.el") ;; if you want to use straight to install, no need to have MELPA setting above
  :config
  ;; use codex as backend, other options are 'claude-code, 'gemini, 'github-copilot-cli, 'opencode, 'grok, 'cursor, 'kiro, 'codebuddy, 'aider, 'agent-shell, 'claude-code-ide, 'claude-code-el
  ;; (ai-code-set-backend 'codex)
  (ai-code-set-backend 'gemini)
  ;; Enable global keybinding for the main menu
  (global-set-key (kbd "C-c a") #'ai-code-menu)
  ;; Optional: Use eat if you prefer, by default it is vterm
  ;; (setq ai-code-backends-infra-terminal-backend 'eat) ;; config for native CLI backends. for external backends such as agent-shell, claude-code-ide.el and claude-code.el, please check their own config
  ;; Optional: Enable @ file completion in comments and AI sessions
  (ai-code-prompt-filepath-completion-mode 1)
  ;; Optional: Ask AI to run test after code changes, for a tighter build-test loop
  (setq ai-code-auto-test-type 'ask-me)
  ;; Optional: In AI session buffers, SPC in Evil normal state triggers the prompt-enter UI
  (with-eval-after-load 'evil (ai-code-backends-infra-evil-setup))
  ;; Optional: Turn on auto-revert buffer, so that the AI code change automatically appears in the buffer
  (global-auto-revert-mode 1)
  (setq auto-revert-interval 1) ;; set to 1 second for faster update
  ;; Optional: Set up Magit integration for AI commands in Magit popups
  (with-eval-after-load 'magit
    (ai-code-magit-setup-transients)))

(provide 'init-ai)

;;; init-ai.el ends here
