;;; my-styles --- My own coding styles
;;; Commentary:
;;; Code:


(c-add-style "kberg"
             '("stroustrup"
               (c-offsets-alist
                (innamespace . 0)
                (inline-open . 0)
                (inextern-lang . 0)
                (label . [0])
                (access-label . /)
                )))


;; The Linux kernel project requires the use of tabs for indention.  Why doesn't the built-in linux
;; style default to using tabs???
(c-add-style "klinux"
             '("linux"
               (indent-tabs-mode .t)))

(provide 'my-styles)
;;; my-styles.el ends here
