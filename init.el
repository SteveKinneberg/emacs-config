;; start package.el with Emacs
(require 'package)
;; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; initialize package.el
(package-initialize)

(or (require 'use-package "use-package" t)
    (progn
      (package-refresh-contents)
      (package-install 'use-package)
      (delete-other-windows-internal)
      (kill-buffer "*Compile-Log*")
      (require 'use-package)))
;;(use-package use-package-ensure
;;  :ensure t
;;  :config
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))


;; Emacs controlled variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style
   '((java-mode . "java")
     (awk-mode . "awk")
     (other . "kberg")))
 '(c-offsets-alist nil)
 '(c-report-syntactic-errors t)
 '(column-number-mode t)
 '(default-frame-alist '((left-fringe) (right-fringe) (width . 111) (height . 56)))
 '(develock-max-column-plist
   '(emacs-lisp-mode 100 lisp-interaction-mode w change-log-mode t texinfo-mode t c-mode 120 c++-mode 120 java-mode 120 caml-mode 120 tuareg-mode 120 coq-mode 120 latex-mode 120 jde-mode 120 html-mode 120 html-helper-mode 120 cperl-mode 120 perl-mode 120 mail-mode t message-mode t cmail-mail-mode t tcl-mode 120 ruby-mode 120))
 '(diff-switches "-u")
 '(fill-column 100)
 '(flycheck-clang-language-standard "c++20")
 '(flycheck-gcc-language-standard "c++20")
 '(focus-follow-mouse t)
 '(font-lock-global-modes '(not speedbar-mode))
 '(global-linum-mode t)
 '(home-end-enable t)
 '(hscroll-margin 10)
 '(hscroll-step 1)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(mouse-autoselect-window t)
 '(mouse-avoidance-mode 'animate nil (avoid))
 '(package-selected-packages
   '(json-mode howdoyou delight diminish home-end which-key auto-package-update use-package lsp-treemacs ccls gerrit gerrit-download helm helm-describe-modes helm-directory helm-flycheck helm-git helm-git-files helm-git-grep helm-gitignore helm-tramp helm-unicode imenu-anywhere lsp-cfn lsp-docker lsp-mode lsp-ui nyan-mode rmsbolt sideline sideline-blame sideline-flycheck sideline-lsp flycheck-status-emoji flycheck-checkbashisms company-irony-c-headers company-irony company copy-as-format dired-filetype-face dired-git dired-git-info find-file-in-repository flycheck-color-mode-line flycheck-cstyle flycheck-indicator flycheck-inline flyspell-correct flyspell-correct-popup flyspell-popup git-commit gitconfig-mode gitignore-mode gitlab gitlab-ci-mode gitlab-ci-mode-flycheck magit magit-annex magit-diff-flycheck magit-filenotify magit-find-file magit-gerrit magit-gh-pulls auto-complete-c-headers call-graph cpp-auto-include flycheck-irony flymake-cppcheck flymake-google-cpplint irony irony-eldoc ac-clang auto-complete-clang auto-complete-clang-async clang-format clang-format+ cpp-capf cpputils-cmake flycheck-clang-analyzer flycheck-clang-tidy flycheck-clangcheck cmake-font-lock cmake-ide cmake-mode cmake-project flycheck graphviz-dot-mode async modern-cpp-font-lock yasnippet volatile-highlights org-download org-bullets markdown-mode highlight-numbers google-c-style flyspell-lazy flycheck-tip flycheck-pos-tip clean-aindent-mode auto-complete))
 '(require-final-newline t)
 '(scroll-conservatively 10000)
 '(scroll-preserve-screen-position t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(split-height-threshold 0)
 '(split-width-threshold nil)
 '(text-mode-hook
   '(turn-on-flyspell turn-on-auto-fill text-mode-hook-identify))
 '(tool-bar-mode nil)
 '(tool-bar-style nil)
 '(truncate-lines t)
 '(x-stretch-cursor t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#fffbf0" :foreground "#000000" :height 75 :family "Hack"))))
 '(Info-quoted ((t (:foreground "dark blue" :family "Hack"))))
 '(develock-long-line-1 ((t (:foreground "#b01010"))))
 '(develock-long-line-2 ((t (:background "#ffffb0" :foreground "#b01010"))))
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

(use-package diminish)
(use-package delight)
(delight '((abbrev-mode nil abbrev)
           (eldoc-mode nil "eldoc")
           (auto-revert-mode nil "autorevert")
           (modern-c++-font-lock-mode nil "modern-cpp-font-lock")
           (flycheck-mode nil "flycheck")
           (flyspell-mode nil "flyspell")
           (subword-mode nil "subword")))
(use-package treemacs)
(use-package which-key
  :delight
  :config (which-key-mode))
(use-package company
	     :delight
	     :hook ((prog-mode text-mode) . company-mode))
(use-package lsp-mode
	     :delight
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((c++-mode . lsp)
         (c-mode . lsp)
         (objc-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-treemacs)
(use-package markdown-mode)
(use-package org
  :hook ((org-mode . my-word-wrap-mode)
         (org-mode . (lambda () (progn
                                  (org-bullets-mode 1)
                                  (auto-fill-mode -1)))))
  :custom ((org-support-shift-select t)
           (org-startup-with-inline-images t)
           (org-startup-indented t)))
(use-package org-bullets)
(use-package org-download)
(use-package async)
(use-package flyspell-lazy
  :hook ((prog-mode org-mode text-mode) . flyspell-prog-mode))
(use-package volatile-highlights
  :delight
  :config (volatile-highlights-mode t))
;; (use-package clean-aindent-mode
;;   :hook (prog-mode))
(use-package graphviz-dot-mode)
(use-package flycheck
  :hook (after-init . global-flycheck-mode))
(use-package flycheck-tip)
(use-package flycheck-pos-tip
  :config (with-eval-after-load 'flycheck
            (flycheck-pos-tip-mode)))
(use-package flycheck-checkbashisms)
(use-package flycheck-status-emoji)
(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode))
(use-package cc-mode)
(use-package modern-cpp-font-lock
  :delight
  :hook (c++-mode . modern-c++-font-lock-mode))
;; (use-package rmsbolt)
(use-package clang-format
  :init
  (fset 'c-indent-region 'clang-format-region)
  (fset 'c-indent-line-or-region 'clang-format-region))
(use-package magit
  :delight)
;; (use-package home-end)
(use-package howdoyou)
(use-package json-mode)
;; (use-package nyan-mode)

(use-package cmake-mode)
(use-package cmake-font-lock)

;; My custom packages
(add-to-list 'load-path (directory-file-name "~/.emacs.d/custom/"))

(require 'my-keys)
(require 'my-styles)
(require 'my-modes)
(require 'edit-settings)


;; Interactively Do Things
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Subword mode everywhere
(global-subword-mode 1)

;; Start Magit
;(magit)

;; Start server mode to allow emacsclient to connect
(server-start)
