(provide 'my-company)

;; Company mode everywhere
(require-install-package 'company)
(require-install-package 'company-irony)
(require-install-package 'company-irony-c-headers)
(add-hook 'after-init-hook 'global-company-mode)


;; Yasnippet
;; (require-install-package 'yasnippet)
;; (yas-global-mode 1)

