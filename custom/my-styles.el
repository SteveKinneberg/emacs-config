;;; my-styles --- My own coding styles
;;; Commentary:
;;; Code:

;; Pull in the Google C++ coding style
(require-install-package 'google-c-style)
(c-add-style "Google" google-c-style)

(c-add-style "kberg"
             '("Google"
               (c-basic-offset . 4)
               (c-offsets-alist
                (case-label . 0)
                (label . [0])
                (inher-intro . +)
                (member-init-intro . +)
                (inextern-lang . 0)
                (statement-case-open . 0)
                )
               ))

(c-add-style "klinux"
             '("linux"
               (indent-tabs-mode .t)))

(provide 'my-styles)
;;; my-styles.el ends here
