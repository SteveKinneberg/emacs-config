;;; edit-settings --- Editor settings
;;; Commentary:
;;; Code:

;; Auto completion
(require-install-package 'auto-complete)
(require-install-package 'auto-complete-config)
(ac-config-default)
(ac-flyspell-workaround)
;;(ac-linenum-workaround)
;;(ac-set-trigger-key "TAB")
;;(ac-set-trigger-key "<tab>")
;;(setq ac-quick-help-delay 0.1)
;;(delq 'ac-source-yasnippet ac-sources)

;; Yasnippet
(require-install-package 'yasnippet)
(yas-global-mode 1)

(provide 'my-autocomplete)
;;; my-autocomplete.el ends here
