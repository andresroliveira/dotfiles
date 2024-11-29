(setq custom-file "~/.emacs.custom.el")

(require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Always ensure packages are installed
(require 'use-package)
(setq use-package-always-ensure t)

;; Set utf-8 encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Enable line numbers globally
(global-display-line-numbers-mode 1)

;; Enable relative line numbers 
(setq display-line-numbers-type 'relative)

;; Ativar auto-indentação
(electric-indent-mode 1)

;; Definir a largura da tabulação
(setq-default tab-width 4)

;; Usar espaços em vez de tabulações
(setq-default indent-tabs-mode nil)

;; Configurar o número de espaços para indentação
(setq-default standard-indent 4)
(setq c-basic-offset 4) 

;; Ativar a linha do cursor
(global-hl-line-mode 1)

;; Font
(set-frame-font "FiraCode Nerd Font 10" nil t)

;; Bar and Column
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(setq inhibit-startup-screen t)


;; Ido 

(ido-mode 1)
(ido-everywhere 1)
(use-package ido-completing-read+
             :config
             (ido-ubiquitous-mode 1))
;; (global-set-key (kbd "M-x") 'smex)

;; Smex

(use-package smex
  :ensure t
  :config (smex-initialize)
  :bind(
        ("M-x" . smex)
        )
  )

;; Which-key

(use-package which-key
:config (which-key-mode))



;; Multiple Cursors
(global-unset-key (kbd "M-<down-mouse-1>"))


(use-package multiple-cursors
             :ensure t
             :bind(("C-S-c C-S-c" . mc/edit-lines)
                   ("C->" . 'mc/mark-next-like-this)
                   ("C-<" . 'mc/mark-previous-like-this)
                   ("C-c C-<" . 'mc/mark-all-like-this)
                   ("M-<mouse-1>" . mc/add-cursor-on-click)
                   ))

;; Sintax
(turn-on-font-lock)

;; Configura o company-mode com use-package
(use-package company
  :ensure t
  :init
  (global-company-mode)  ;; Ativa o company-mode globalmente
  :config
  (setq company-idle-delay 0.2)  ;; Tempo de espera antes de mostrar as sugestões
  (setq company-minimum-prefix-length 1))  ;; Mínimo de caracteres para mostrar sugestões

;; Magit
(use-package magit
  :ensure t)

;; Theme

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-hard t))



(use-package julia-mode
  :ensure t)

(use-package maxima
  :ensure t)


(load-file custom-file)
