;; Andres emacs config
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

;; Disable startup screen and GUI elements
(setq inhibit-startup-screen t)
(tool-bar-mode 1)
(menu-bar-mode 1)
(scroll-bar-mode -1)
(column-number-mode 1)
(global-prettify-symbols-mode 1)
(setq ring-bell-function 'ignore)


;; Font
;; (set-frame-font "FiraCode Nerd Font 11" nil t)
(set-frame-font "Iosevka Nerd Font 14" nil t)

;; Themes
;; (use-package modus-themes
;;   :ensure t
;;   :config
;;   (load-theme 'modus-vivendi-tinted t)) ;; or 'modus-vivendi

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-hard t))

;; Keymaps

;; Desabilita os prefixos C-x n e C-x p
(define-key ctl-x-map "n" nil)
(define-key ctl-x-map "p" nil)

;; Mapeia C-x n para 'next-buffer' e C-x p para 'previous-buffer'
(global-set-key (kbd "C-x n") 'next-buffer)
(global-set-key (kbd "C-x p") 'previous-buffer)


;; Line numbers and UTF-8
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Indentation settings
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(electric-indent-mode 1)
(setq-default standard-indent 4)
(setq c-basic-offset 4) 

;; Enable y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight matching parentheses
(show-paren-mode 1)

;; Higlight curent line
(global-hl-line-mode 1)

;; Save backups and auto-saves to a specific directory
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-save-list/" t)))

;; Sintax
(turn-on-font-lock)

;; Packages
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(unless (package-installed-p 'quelpa)  (package-refresh-contents)  (package-install 'quelpa))(require 'quelpa)
(unless package-archive-contents (package-refresh-contents))
(setq package-enable-at-startup nil)

;; Use-Package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Ido
(ido-mode 1)
(ido-everywhere 1)
(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode 1))

;; Smex
(use-package smex
  :ensure t
  :bind (("M-x" . smex)
         ("C-c C-c M-x" . execute-extended-command)))

;; Company Mode (completion)
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  (global-company-mode 1))

;; Yasnippet (snippets)
(use-package yasnippet
  :ensure t
  :hook (prog-mode . yas-minor-mode))

(use-package yasnippet-snippets
  :ensure t)

;; Move Text
(use-package move-text
  :bind (("M-p" . move-text-up)
         ("M-n" . move-text-down)))

;; Parentheses
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))


;; Multiple Cursors
(global-unset-key (kbd "M-<down-mouse-1>"))
(use-package multiple-cursors
  :ensure t
  :bind(("C-S-c C-S-c" . mc/edit-lines)
        ("C->" . 'mc/mark-next-like-this)
        ("C-<" . 'mc/mark-previous-like-this)
        ("C-c C-<" . 'mc/mark-all-like-this)
        ("M-<mouse-1>" . mc/add-cursor-on-click)))

(use-package octave
  :mode ("\\.m\\'" . octave-mode)
  :hook ((octave-mode . (lambda ()
                          (abbrev-mode 1)
                          (auto-fill-mode 1)
                          (setq font-lock-maximum-decoration t)
                          (when (eq window-system 'x)
                            (font-lock-mode 1))
                          (set (make-local-variable 'company-backends)
                               '((company-dabbrev-code company-keywords)))
                          (company-mode 1)
                          (local-set-key (kbd "C-<return>") #'octave-send-line)
                          (local-set-key (kbd "M-<return>") #'octave-send-buffer)))
         (inferior-octave-mode . (lambda ()
                                   (local-set-key (kbd "M-p") #'comint-previous-input)
                                   (local-set-key (kbd "M-n") #'comint-next-input)))))

;; Associações entre extensões de arquivo e modos principais
(add-to-list 'auto-mode-alist '("\\.el\\'"   . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'"    . c-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'"  . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'"    . c++-mode))
(add-to-list 'auto-mode-alist '("\\.sh\\'"   . sh-mode))
(add-to-list 'auto-mode-alist '("\\.org\\'"  . org-mode))
(add-to-list 'auto-mode-alist '("\\.tex\\'"  . latex-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'"  . css-mode))
(add-to-list 'auto-mode-alist '("\\.java\\'"  . java-mode))
(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))

(add-hook 'c-mode-hook (lambda () (c-toggle-comment-style -1)))

(use-package python-mode
  :ensure t
  :mode ("\\.py\\'" . python-mode))

(use-package js
  :mode ("\\.js\\'" . js-mode))

(use-package typescript-mode
  :ensure t
  :mode ("\\.ts\\'" . typescript-mode))

(use-package json-mode
  :ensure t
  :mode ("\\.json\\'" . json-mode))

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode))

(use-package lua-mode
  :ensure t
  :mode ("\\.lua\\'" . lua-mode))


(use-package flymake
  :ensure t)

(use-package flyspell
  :ensure t)


(use-package tree-sitter
  :ensure t
  :hook ((prog-mode . turn-on-tree-sitter-mode)
         (c-mode . turn-on-tree-sitter-mode)
         (c++-mode . turn-on-tree-sitter-mode)
         (python-mode . turn-on-tree-sitter-mode)
         (js-mode . turn-on-tree-sitter-mode)
         (typescript-mode . turn-on-tree-sitter-mode)
         (lua-mode . turn-on-tree-sitter-mode)
         (json-mode . turn-on-tree-sitter-mode)
         (tree-sitter-after-on . tree-sitter-hl-mode)))

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter)

;; which-key (recomendado)
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; LSP Client
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; atalho para o lsp-command-map
  :hook ((c-mode . lsp)
         (c++-mode . lsp)
         (js-mode . lsp)
         (typescript-mode . lsp)
         (lua-mode . lsp)
         (json-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)



;; UI opcional para o LSP
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))  ; or lsp-deferred


(use-package magit
  :ensure t)

;; Auctex
(use-package auctex
  :ensure t
  :hook ((LaTeX-mode . (lambda () (setq-local TeX-electric-math (cons "\\(" "\\)"))))
         (plain-TeX-mode . (lambda () (setq-local TeX-electric-math (cons "$" "$"))))
         (LaTeX-mode . LaTeX-math-mode)
         (LaTeX-mode . turn-on-reftex))
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  (setq LaTeX-section-hook
        '(LaTeX-section-heading
          LaTeX-section-title
          LaTeX-section-toc
          LaTeX-section-section
          LaTeX-section-label))

  (setq reftex-plug-into-AUCTeX t)

  (setq LaTeX-indent-level 4)
  (setq LaTeX-item-indent 0)

  ;; Suporte ao SyncTeX
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-start-server t)
  (setq TeX-command-extra-options "-shell-escape -synctex=1")
  ;; Visualizador de PDF: PDF Tools
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
        TeX-after-compilation-finished-functions
        '(TeX-revert-document-buffer)))


;; PDF Tools
(use-package pdf-tools
  :ensure t
  :after quelpa
  :config
  (pdf-tools-install t)
  (setq pdf-sync-backward-display-action t))


(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))


(server-start)
