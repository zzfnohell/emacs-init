;;; init-font.el --- Font Config
;;; base on https://gist.github.com/coldnew/7398835

;;; Commentary:
;;

;;; Code:

(defvar emacs-english-font "Fira Code"
  "The font name of English.")

(defvar emacs-cjk-font "等距更纱黑体 SC"
  "The font name for CJK.")

(defvar emacs-font-size-pair '(13 . 16)
  "Default font size pair for (english . chinese).")

(defvar emacs-font-size-pair-list
  '((5 . 6)
    (10 . 12) 
    (13 . 16) 
    (15 . 18) 
    (17 . 20)
    (19 . 22)
	(20 . 24) 
	(21 . 26) 
	(24 . 28)
    (26 . 32) 
	(28 . 34) 
	(30 . 36) 
	(34 . 40) 
	(36 . 44))
  "Font size pairs for scaling (english . chinese).")

(defun font-exist-p (fontname)
  "Return t if FONTNAME exists."
  (and fontname (x-list-fonts fontname)))

(defun set-font (english chinese size-pair)
  "Setup English and Chinese fonts for the current frame."
  (when (font-exist-p english)
    (set-frame-font (format "%s:pixelsize=%d" english (car size-pair)) t))
  (when (font-exist-p chinese)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font t charset
                        (font-spec :family chinese :size (cdr size-pair))))))

(defun emacs-step-font-size (step)
  "Increase/Decrease Emacs font size according to list."
  (let ((scale-steps (if (< step 0)
                         (reverse emacs-font-size-pair-list)
                       emacs-font-size-pair-list)))
    (setq emacs-font-size-pair
          (or (cadr (member emacs-font-size-pair scale-steps))
              emacs-font-size-pair))
    (when emacs-font-size-pair
      (message "Emacs font size set to %.1f" (car emacs-font-size-pair))
      (set-font emacs-english-font emacs-cjk-font emacs-font-size-pair))))

(defun increase-emacs-font-size ()
  "Increase font size."
  (interactive)
  (emacs-step-font-size 1))

(defun decrease-emacs-font-size ()
  "Decrease font size."
  (interactive)
  (emacs-step-font-size -1))

(defun init-font/setup-font (&optional frame)
  "Apply font setup for FRAME (or current frame)."
  (with-selected-frame (or frame (selected-frame))
    (set-font emacs-english-font emacs-cjk-font emacs-font-size-pair)))

;; === Font setup hooks ===
(if (daemonp)
    ;; Daemon 模式：等待 frame 创建
    (add-hook 'after-make-frame-functions #'init-font/setup-font)
  ;; 普通 GUI 启动
  (when (display-graphic-p)
    (init-font/setup-font)))

(when (and (>= emacs-major-version 28) window-system)
  (use-package ligature
    :if (and (>= emacs-major-version 28) window-system)
    :ensure t
    :config
    ;; Enable the www ligature in every possible major mode
    (ligature-set-ligatures 't '("www"))
    ;; Enable ligatures in programming modes
    (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                         ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                         "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                         "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                         "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                         "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                         "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                         "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                         "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                         "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

    (global-ligature-mode 't)))

(provide 'init-font)

;;; init-font.el ends here
