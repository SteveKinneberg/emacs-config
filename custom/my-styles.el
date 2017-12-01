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
                )
               ))

(c-add-style "alljoyn"
             '((c-basic-offset . 4)
               (c-offsets-alist
                (block-open . -)
                (brace-list-open . -)
                (substatement-open . 0)
                (innamespace . 0)
                (inextern-lang . 0)
                (inline-open . 0)
                (access-label . /)
                (label . -))
               (c-hanging-braces-alist . nil)
               (indent-tabs-mode . nil)))


(c-add-style "klinux"
             '("linux"
               (indent-tabs-mode .t)))

(provide 'my-styles)
;;; my-styles.el ends here
