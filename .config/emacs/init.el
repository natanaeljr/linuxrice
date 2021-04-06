(setq user-emacs-directory (file-truename "~/.local/share/emacs/"))

(require 'package)
 
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'evil)
(evil-set-undo-system 'undo-tree)
(evil-mode t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package markdown-mode
  :ensure t)

(setq org-log-done t)
(global-set-key (kbd "C-c a") 'org-agenda)

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(blink-cursor-mode 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; THEME
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; https://github.com/bbatsov/solarized-emacs
(require 'solarized-theme)
;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)
;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch nil)
;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)
;; Use less bolding
(setq solarized-use-less-bold t)
;; Use more italics
(setq solarized-use-more-italic t)
;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)
;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)
;; Avoid all font-size changes
(setq solarized-height-minus-1 1.0)
(setq solarized-height-plus-1 1.0)
(setq solarized-height-plus-2 1.0)
(setq solarized-height-plus-3 1.0)
(setq solarized-height-plus-4 1.0)
;; Load the theme
(load-theme 'solarized-dark t)

; (add-to-list 'default-frame-alist '(font . "JetBrains Mono" ))
; (set-face-attribute 'default nil :font "JetBrains Mono-11" )
(add-to-list 'default-frame-alist '(font . "SF Mono" ))
(set-face-attribute 'default nil :font "SF Mono-11" )

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq backup-directory-alist `(("." . "~/.cache/emacs")))

(desktop-save-mode 1)

(setq org-todo-keywords '((sequence "TODO" "WIP" "|" "DONE")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" default))
 '(org-agenda-files '("~/notes/FERIAS.org"))
 '(package-selected-packages
   '(one-themes undo-tree linum-relative use-package solarized-theme org-bullets markdown-mode helm evil-visual-mark-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
