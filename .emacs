(add-to-list 'load-path "~/.emacs.d")


(global-set-key (kbd "C-c g") 'goto-line)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
;;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 ;;'(default ((t (:inherit nil :stipple nil :background "#3f3f3f" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;;(defun word-count nil "Count words in buffer" (interactive)
;;(shell-command-on-region (point-min) (point-max) "wc -w"))

;;(defun char-count nil "Count characters in buffer" (interactive)
;;(shell-command-on-region (point-min) (point-max) "wc -m"))



;;(add-to-list ‘load-path “~/.emacs.d/”)


(require 'auto-complete)
(global-auto-complete-mode t)


;;(require 'yasnippet)
;;(yas/initialize)
;;(yas/load-directory "~/.emacs.d/snippets")

;;(load-library “init_python”)

;;THIS ONE WORKS
(require 'init_python)


;;(require 'python-mode)
;;(require 'python)

;;(setq org-export-html-style-include-default f)
(setq org-export-html-use-infojs t)

(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)

(setq multi-term-program "/bin/bash")   ;; use bash
;; (setq multi-term-program "/bin/zsh") ;; or use zsh...

;; only needed if you use autopair
(add-hook 'term-mode-hook
  #'(lambda () (setq autopair-dont-activate t)))


(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one

(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode 1)
(add-hook 'python-mode-hook (quote (eldoc-mode (lambda nil (define-key python-mode-map (kbd "<tab>") (quote yas/expand))) imenu-add-menubar-index ropemacs-mode (lambda nil (hs-minor-mode 1)) (lambda nil (define-key python-mode-map "
" (quote newline-and-indent))) wisent-python-default-setup my-python-hook)))



(put 'downcase-region 'disabled nil)
;; (global-linum-mode 1)


;;(require 'zenburn)
;;(zenburn)
;;(load-theme 'zenburn)
(load-theme 'tango)
(color-theme-tango)
(tool-bar-mode -1)