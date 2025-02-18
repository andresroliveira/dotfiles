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
(set-frame-font "FiraCode Nerd Font 12" nil t)

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
        ("M-x" . smex))
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
  ;;(global-company-mode)  ;; Ativa o company-mode globalmente
  :config
  (global-company-mode)
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
(autoload 'maxima "maxima" "Maxima interaction" t)
(setq auto-mode-alist (cons '("\\.max\\'" . maxima-mode) auto-mode-alist))
(autoload 'maxima-mode "maxima" "Maxima mode" t)


(load-file custom-file)

(windmove-default-keybindings 'meta)

(setq doc-view-continuous t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode))
  :init (setq markdown-command "/usr/bin/pandoc"))


(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1))



;; LaTeX

(use-package tex
  :ensure auctex
  :hook ((LaTeX-mode . TeX-source-correlate-mode)
         (LaTeX-mode . visual-line-mode)
         (LaTeX-mode . flyspell-mode)
         (LaTeX-mode . company-mode)
         (LaTeX-mode . reftex-mode))
  :config
  ;; Configuração geral do AUCTeX
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil) ;; Pergunta o arquivo principal ao abrir um .tex

  ;; Visualização de PDFs com pdf-tools
  (setq TeX-view-program-selection '((output-pdf "PDF Tools")))
  (setq TeX-source-correlate-start-server t) ;; Habilita SyncTeX para navegação
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)

  ;; Compilação em modo não interativo
  (setq TeX-command-extra-options "-shell-escape") ;; Se precisar de TikZ ou outras ferramentas
  (setq TeX-show-compilation t)) ;; Mostra a saída da compilação

;; Configuração do company-mode para LaTeX
(use-package company-auctex
  :ensure t
  :after (company tex)
  :config
  (company-auctex-init))

;; RefTeX para gerenciamento de referências e citações
(use-package reftex
  :ensure t
  :hook (LaTeX-mode . reftex-mode)
  :config
  (setq reftex-plug-into-AUCTeX t)
  (setq reftex-cite-format 'natbib))

;; PDF-Tools para visualizar PDFs diretamente no Emacs
(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install)
  (setq-default TeX-PDF-mode t))

;; Path
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))


