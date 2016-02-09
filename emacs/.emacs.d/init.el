; (set-default-font "DejaVu Sans Mono-10")

(setq user-full-name "Lucas Silva Simões")
(setq user-mail-address "simoes.lucas.silva@gmail.com")

;; bootstrap quelpa
(package-initialize)
(if (require 'quelpa nil t)
    (quelpa-self-upgrade)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))

; upgrade packages at startup, disable if you don't like
;(setq quelpa-upgrade-p t)

;; load use-package
(quelpa 'use-package)
(require 'use-package)

;; configuration options
(setq use-package-verbose t)

;; julia
(quelpa 'julia-mode)
(use-package julia-mode)
(quelpa 'julia-shell)
(use-package julia-shell)
(quelpa 'ess)
(use-package ess)
(quelpa '(ob-julia :fetcher url :url "http://orgmode.org/w/?p=org-mode.git;a=blob_plain;f=contrib/lisp/ob-julia.el"))
(use-package ob-julia)

;; ansi-color
(quelpa 'ansi-color)
(use-package ansi-color
    :config
    (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
    (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on))

;; theme
(quelpa 'base16-theme)
(use-package base16-theme
    :init
    (load-theme 'base16-monokai-dark t))

;; nyan-mode
(quelpa 'nyan-mode)
(use-package nyan-mode
	:init
	(nyan-mode t))

;; ido-mode: interactiverly do things
;;           fuzzy-like search for lists
(ido-mode t)
(ido-everywhere t)
(quelpa 'ido-ubiquitous)
(use-package ido-ubiquitous
    :init
    (ido-ubiquitous-mode t))

(quelpa 'idomenu)
(use-package idomenu ; ido for list which shows definitions in lisp code
    :bind (("C-c i" . idomenu))
    :config (setq imenu-auto-rescan t))

;; smex: ido for M-x
(quelpa 'smex)
(use-package smex
    :bind ("M-x" . smex)
          ("C-x C-m" . smex) ; M-x is too hard
          ("C-c C-m" . smex-major-mode-commands) ; to reach
          ("C-c C-c M-x" . execute-extended-command) ; old M-x command
    :config (setq smex-save-file "~/.emacs.d/.smex-items"))

;; save recent files
(require 'recentf)
(setq recentf-max-saved-items 60
      recentf-max-menu-items 15)
(recentf-mode t)

;; recentf open with ido
;; from www.emacswiki.org/emacs/RecentFiles
(defun recentf-ido-find-file ()
    "Find a recent file using ido."
    (interactive)
    (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
        (when file
            (find-file file))))

(bind-key "C-c f" 'recentf-ido-find-file)

(quelpa 'bind-key)
(use-package bind-key
  :ensure t
  :bind ("C-h B" . describe-personal-keybindings))

;; default file encoding
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(setq locale-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(setq backup-directory-alist `((".*" . ,temporary-file-directory)))

;; set backup folder
(setq backup-directory-alist `((".*" . ,"~/.emacs.d/.backups")))

;; disable backups for .gpg files
(setq auto-mode-alist
    (append '(("\\.gpg$" . sensitive-mode))
            auto-mode-alist))

;; disable auto-save
(setq auto-save-default nil)

;; better backup defaults
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9)              ; newest versions to keep when a new numbered backup is made (default: 2))

;; avoid outdated byte-compiled files
(setq load-prefer-newer t)

;; Don't show the splash screen
(setq inhibit-startup-screen t
    ;; Show *scratch* on startup
    initial-buffer-choice t)

;; More smooth scrolling
(setq mouse-wheel-scroll-amount '(0.01))

;; yes-or-no prompt is now y-or-n
;(defalias 'yes-or-no-p 'y-or-n-p)

;; c defaults
(setq-default c-basic-offset 4
              c-default-style "linux")
(add-hook 'c-mode-common-hook (lambda ()
    (c-toggle-auto-state 1)
    (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)))


;; indentation
(setq-default tab-width 4
              indent-tabs-mode nil)

;; strip emacs down
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(global-hl-line-mode t); hightlight current line
(show-paren-mode t)    ; hightlight corresponding parenthesis
(global-linum-mode t)  ; show lines numbering on the left
(line-number-mode t)   ; show line numbering in mode line
(column-number-mode t) ; show column number in mode line

;; loading languages
 (org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . nil)
        (R . t)
        (ruby . t)
        (julia .t)
        (python . t))
 )

; add systemd highlights
(add-to-list 'auto-mode-alist '("\\.service\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.timer\\'" . conf-unix-mode))
