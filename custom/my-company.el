(provide 'my-company)

;; Company mode everywhere
(require-install-package 'company)
(add-hook 'after-init-hook 'global-company-mode)


;; Yasnippet
(require-install-package 'yasnippet)
(yas-global-mode 1)

