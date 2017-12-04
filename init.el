;;; package --- init.el
;;; Commentary:
;;; Code:

;; start package.el with Emacs
(require 'package)
;; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; initialize package.el
(package-initialize)

;; Auto-magically install required packages to the local .emacs.d/elpa directory
(defvar package-contents-refreshed nil "Indicates if the package contents have been refreshed.")
(defun require-install-package (pn &optional file)
  "Require a package.  If package is not found try installing it."
  (or (require pn file t)
      (progn
        (if (not package-contents-refreshed)
            (progn
              (package-refresh-contents)
              (setq package-contents-refreshed t)))
        (package-install pn)
        (delete-other-windows-internal)
        (kill-buffer "*Compile-Log*")
	(require pn file))))

;; Need the highlight-current-line package before setting custom variables
;;(require-install-package 'highlight-current-line)

;; Emacs controlled variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style
   (quote
    ((java-mode . "java")
     (awk-mode . "awk")
     (other . "kberg"))))
 '(c-offsets-alist nil)
 '(c-report-syntactic-errors t)
 '(column-number-mode t)
 '(default-frame-alist
    (quote
     ((left-fringe)
      (right-fringe)
      (width . 101)
      (height . 61))))
 '(develock-max-column-plist
   (quote
    (emacs-lisp-mode 100 lisp-interaction-mode w change-log-mode t texinfo-mode t c-mode 120 c++-mode 120 java-mode 120 caml-mode 120 tuareg-mode 120 coq-mode 120 latex-mode 120 jde-mode 120 html-mode 120 html-helper-mode 120 cperl-mode 120 perl-mode 120 mail-mode t message-mode t cmail-mail-mode t tcl-mode 120 ruby-mode 120)))
 '(diff-switches "-u")
 '(fill-column 80)
 '(flycheck-clang-language-standard "c++17")
 '(flycheck-gcc-language-standard "c++17")
 '(focus-follow-mouse t)
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(global-linum-mode t)
 '(home-end-enable t)
 '(hscroll-margin 10)
 '(hscroll-step 1)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(mouse-autoselect-window t)
 '(mouse-avoidance-mode (quote animate) nil (avoid))
 '(package-selected-packages
   (quote
    (flycheck graphviz-dot-mode async modern-cpp-font-lock yasnippet volatile-highlights org-download org-bullets markdown-mode highlight-numbers highlight-current-line google-c-style flyspell-lazy flycheck-tip flycheck-pos-tip clean-aindent-mode auto-complete aggressive-indent)))
 '(require-final-newline t)
 '(scroll-conservatively 10000)
 '(scroll-preserve-screen-position t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(split-height-threshold 0)
 '(split-width-threshold nil)
 '(text-mode-hook
   (quote
    (turn-on-flyspell turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(tool-bar-style nil)
 '(truncate-lines t)
 '(x-stretch-cursor t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fffbf0" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 79 :width normal :foundry "simp" :family "Hack"))))
 '(develock-long-line-1 ((t (:foreground "#b01010"))))
 '(develock-long-line-2 ((t (:background "#ffffb0" :foreground "#b01010"))))
 '(fixed-pitch ((t (:family "Hack"))))
 '(font-lock-comment-face ((t (:foreground "#4080ff"))))
 '(font-lock-constant-face ((t (:foreground "#b000b0"))))
 '(font-lock-function-name-face ((t (:foreground "#1020a8"))))
 '(font-lock-keyword-face ((t (:foreground "#5010a0"))))
 '(font-lock-string-face ((t (:foreground "#007000"))))
 '(font-lock-type-face ((t (:foreground "#087070"))))
 '(fringe ((t (:background "#fffbf0"))))
 '(isearch ((t (:background "#604000" :foreground "#f0f060"))))
 '(mode-line ((t (:background "#dbd0a2" :foreground "#000000" :box (:line-width -1 :style released-button)))))
 '(mode-line-highlight ((t (:box (:line-width 3 :color "#dbd0a2" :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#d0c8c0" :foreground "grey40" :box (:line-width -1 :color "grey75") :weight light))))
 '(region ((t (:background "#203850" :foreground "#ffffff"))))
 '(tooltip ((t (:inherit variable-pitch :background "lightyellow" :foreground "black"))))
 '(warning ((t (:foreground "#e05000" :weight bold)))))


;; My custom packages
(add-to-list 'load-path "~/.emacs.d/custom")

(require 'my-keys)
(require 'my-styles)
(require 'my-modes)
(require 'edit-settings)
(require 'my-autocomplete)
(require 'coding-settings)

;;(require 'my-company)
;;(require 'my-cedet)

;; Interactively Do Things
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Subword mode everywhere
(global-subword-mode 1)

;; Start server mode to allow emacsclient to connect
;(server-start)
