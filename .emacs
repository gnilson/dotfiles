(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/calfw")


(defun vi-open-line-below ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))


(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one
(global-set-key (kbd "C-c l") 'org-store-link)
;; (global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-o") 'vi-open-line-below)

(setq column-number-mode t)
;; (global-set-key (kbd "C-/") 'undo)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))

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


(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode 1)
(add-hook 'python-mode-hook (quote (eldoc-mode (lambda nil (define-key python-mode-map (kbd "<tab>") (quote yas/expand))) imenu-add-menubar-index ropemacs-mode (lambda nil (hs-minor-mode 1)) (lambda nil (define-key python-mode-map "
" (quote newline-and-indent))) wisent-python-default-setup my-python-hook)))



(put 'downcase-region 'disabled nil)
;; (global-linum-mode 1)

(blink-cursor-mode nil)


;; (add-to-list 'load-path "~/.emacs.d/emacs-jabber")
;; (require 'jabber)
;; (setq jabber-account-list
;;       '(("gnilson@gmail.com" 
;;	 (:network-server . "talk.google.com")
;;	 (:connection-type . ssl))))

;;(require 'zenburn)
;;(zenburn)
;;(load-theme 'zenburn)

(when (display-graphic-p)
    (load-theme 'tango)
    (color-theme-tango)
    (tool-bar-mode -1))

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq org-icalendar-include-todo t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(require 'calfw-org)

; WANDERLUST STUFF

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; IMAP
(setq elmo-imap4-default-server "imap.gmail.com")
(setq elmo-imap4-default-user "gnilson@gmail.com") 
(setq elmo-imap4-default-authenticate-type 'clear) 
(setq elmo-imap4-default-port '993)
(setq elmo-imap4-default-stream-type 'ssl)

(setq elmo-imap4-use-modified-utf7 t) 

;; SMTP
(setq wl-smtp-connection-type 'starttls)
(setq wl-smtp-posting-port 587)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user "gnilson")
(setq wl-smtp-posting-server "smtp.gmail.com")
(setq wl-local-domain "gmail.com")

(setq wl-from "Gary Nilson <gnilson@gmail.com>")
(setq wl-default-folder "%inbox")
(setq wl-default-spec "%")
(setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAP
(setq wl-trash-folder "%[Gmail]/Trash")
(setq wl-trash-folder "%[Gmail]/Sent")
(setq wl-forward-subject-prefix "Fwd: ")


(setq wl-folder-check-async t) 

(setq elmo-imap4-use-modified-utf7 t)

(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

(setq wl-draft-reply-without-argument-list
  '(("Reply-To" ("Reply-To") nil nil)
     ("Mail-Reply-To" ("Mail-Reply-To") nil nil)
     ("From" ("From") nil nil)))


;; bombard the world
(setq wl-draft-reply-with-argument-list
  '(("Followup-To" nil nil ("Followup-To"))
     ("Mail-Followup-To" ("Mail-Followup-To") nil ("Newsgroups"))
     ("Reply-To" ("Reply-To") ("To" "Cc" "From") ("Newsgroups"))
     ("From" ("From") ("To" "Cc") ("Newsgroups"))))


;; hide many fields from message buffers
(setq wl-message-ignored-field-list '("^.*:"))
(setq wl-message-visible-field-list
  '("^\\(To\\|Cc\\):"
    "^Subject:"
    "^\\(From\\|Reply-To\\):"
    "^Organization:"
    "^Message-Id:"
    "^\\(Posted\\|Date\\):"
    ))
(setq wl-message-sort-field-list
  '("^From"
    "^Organization:"
    "^X-Attribution:"
     "^Subject"
     "^Date"
     "^To"
     "^Cc"))