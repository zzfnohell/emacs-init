;;; init-ai.el --- AI

;;; Commentary:
;; 

(use-package gptel-agent
  :vc ( :url "https://github.com/karthink/gptel-agent"
        :rev :newest)
  :config
  (gptel-agent-update))

(use-package agent-shell
  :ensure t
  :ensure-system-package
  ;; Add agent installation configs here
  ((claude . "brew install claude-code")
   (qwen . "npm install -g @qwen-code/qwen-code@latest")
   (claude-code-acp . "npm install -g @zed-industries/claude-code-acp")))


(provide 'init-ai)

;;; init-ai.el ends here
