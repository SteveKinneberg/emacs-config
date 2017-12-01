;;; my-modes --- Local mode settings
;;; Commentary:
;;; Code:

;; Function to override truncate lines mode and enable word wrap mode
(defun my-word-wrap-mode ()
  "Setup window for preferred word wrap display.

Enable `word-wrap' mode, disable `truncate-lines' mode, and
disable display of fringe bitmaps by setting the left and right
widths to 0."
  (progn
    (setq word-wrap t)              ; word wrap
    (setq truncate-lines nil)       ; don't truncate lines
    (setq left-fringe-width 0)      ; disable the left fringe characters
    (setq right-fringe-width 0)     ; disable the right fringe characters
    ))

;; Setup doxymacs if we have it.
(if (fboundp 'doxymacs-mode)
    (progn
      (add-hook 'c-mode-common-hook 'doxymacs-mode)

      (defun my-doxymacs-font-lock-hook ()
        (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
            (doxymacs-font-lock)))
      (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
      ))

;; whenever you create useless whitespace, the whitespace is highlighted
(add-hook 'prog-mode-hook (lambda () (setq show-trailing-whitespace 1)))

;; Use word-wrap mode for text and org modes
(add-hook 'text-mode-hook 'my-word-wrap-mode)

;; Setup markdown mode
(require-install-package 'markdown-mode)

;; Setup the all powerful org-mode
(require-install-package 'org)
(set-variable 'org-support-shift-select t)
(set-variable 'org-startup-with-inline-images t)
(set-variable 'org-startup-indented t)
(require-install-package 'org-bullets)
(add-hook 'org-mode-hook 'my-word-wrap-mode)
(add-hook 'org-mode-hook (lambda () (progn
                                      (org-bullets-mode 1)
                                      (auto-fill-mode -1))))
(require-install-package 'async) ;; may need to install version 1.6 manually
(require-install-package 'org-download)


;; Graphviz Dot mode
(require-install-package 'graphviz-dot-mode)


;; Override and teach emacs preferred modes for certain file types.
(setq auto-mode-alist (append
                       '(("\\.h\\'" . c++-mode)
                         ("\\.md\\'" . markdown-mode)
                         ("README" . text-mode)
                         ("SConscript" . python-mode)
                         ("SConstruct" . python-mode))
                       auto-mode-alist))

(provide 'my-modes)
;;; my-modes.el ends here
