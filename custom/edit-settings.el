;;; package --- edit-settings
;;; Commentary:
;;; Code:

(setq x-super-keysym 'meta)

;; Enable sub-word mode
(subword-mode 1)

;; Enable Flyspell spell checker
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(require-install-package 'flyspell-lazy)


;; Highlight the current line
;;(require 'highlight-current-line)
;;(setq highlight-current-line-globally t)
;;(setq highlight-current-line-ignore-regexp "Faces\\|Colors\\| \\*Mini\\|\\*Info\\|\\*Man\\|\\*Customize")


;; Volatile Highlights - shows what yank/undo changed
(require-install-package 'volatile-highlights)
(volatile-highlights-mode t)

;; Clean auto-indent
(require-install-package 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Undo tree  -- too confusing
;;(require 'undo-tree)
;;(global-undo-tree-mode)

;; Aggressive fill -- Completely broken for Makefiles and far too aggressive on comments
;;(require'aggressive-fill-paragraph) (afp-setup-recommended-hooks)

;; Aggressive indent
;; (require-install-package 'aggressive-indent)
;; (global-aggressive-indent-mode 1)
;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;; Prefer UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

;; Delete selection when typing new text
(delete-selection-mode)

;; Nyan Cat!!!  -  Cool but takes too much space on mode-line
;;(cl-case window-system
;;((x w32) (nyan-mode)))

(provide 'edit-settings)
;;; edit-settings.el ends here
