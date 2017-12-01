;;; coding-settings --- Coding settings
;;; Commentary:
;;; Code:

;; Flycheck - check code on the fly
(require-install-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(require-install-package 'flycheck-tip)

;; GUI-ify the flycheck tool-tip
(require-install-package 'flycheck-pos-tip)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;; Highlight literals
(require-install-package 'highlight-numbers)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)


;; Fixup some c++-mode settings for C++11 and C++11
(require-install-package 'modern-cpp-font-lock)
(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)


(provide 'coding-settings)
;;; coding-settings.el ends here
