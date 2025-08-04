;;; init-ai.el --- AI

;;; Commentary:
;; 

(use-package gptai
  :ensure t
  :defer t
  :bind (("C-c o" . gptai-send-query))
  :config
  ;; set configurations
  (setq gptai-model "qwen3-coder-plus")
  (setq gptai-api-key (getenv "DASHSCOPE_API_KEY"))
  ;; if required, specify an alternative base url
  (setq gptai-base-url "https://dashscope.aliyuncs.com/compatible-mode/v1"))


(provide 'init-ai)

;;; init-ai.el ends here
