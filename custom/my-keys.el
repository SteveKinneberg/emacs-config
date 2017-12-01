;;; my-keys --- Keyboard Mappings and power functions.
;;; Commentary:

;;; Code:

(defun delete-line (n)
  "Delete N lines of text and place into the kill ring."
  (interactive "*p")
  (if (region-active-p)
      (kill-region (point) (mark))
    (beginning-of-line)
    (kill-line n)))

(defun insert-line (n)
  "Insert N blank lines before the current line.
Like `open-line' but does not break the current line."
  (interactive "*p")
  (beginning-of-line)
  (open-line n))

;; Not entirely compatible with org-indent-mode
(defun control-up (&optional arg)
  "Wrapper of Control-UP key.
One line, or ARG number of lines specified by prefix arg are scrolled
toward the bottom of the window while the point moves up in the document."
  (interactive "^p")
  (scroll-down-line arg))

;; Not entirely compatible with org-indent-mode
(defun control-down (&optional arg)
  "Wrapper of Control-UP key.
One line, or ARG number of lines specified by prefix arg are scrolled
toward the top of the window while the point moves down in the document."
  (interactive "^p")
  (scroll-up-line arg))

(defadvice scroll-up (after next-line-on-scroll-up activate)
  "Keep the point in the same visual position when scrolling up."
  (interactive "^P")
  (let ((amt (ad-get-arg 0)))
    (if amt
        (line-move amt))))

(defadvice scroll-down (after previous-line-on-scroll-down activate)
  "Keep the point in the same visual position when scrolling down."
  (interactive "^P")
  (let ((amt (ad-get-arg 0)))
    (if amt
        (line-move (- 0 amt)))))


(global-set-key [(control delete)] 'delete-line)

(global-set-key [(insert)] 'insert-line)
(global-set-key [(control insert)] 'yank)
(global-set-key [(control shift insert)] 'yank-pop)

(global-set-key [(f11)] 'undo)
(global-set-key [(control f11)] 'repeat-complex-command)

(global-set-key [(control down)] 'control-down)
(global-set-key [(control up)] 'control-up)
(global-set-key [(control left)] 'backward-word)
(global-set-key [(control right)] 'forward-word)

(global-set-key [(f12)] 'call-last-kbd-macro)
(global-set-key [(control f12)] 'start-kbd-macro)
(global-set-key [(meta f12)] 'end-kbd-macro)

(global-set-key [(meta insert)] 'overwrite-mode)

(global-set-key [(control mouse-4)] 'text-scale-increase)
(global-set-key [(control mouse-5)] 'text-scale-decrease)

(global-set-key [(meta right)] 'forward-sexp)
(global-set-key [(meta left)] 'backward-sexp)
(global-set-key [(meta up)] 'backward-paragraph)
(global-set-key [(meta down)] 'forward-paragraph)

(eval-after-load 'org
  '(progn (define-key org-mode-map [(control c)(control .)] 'org-time-stamp-inactive)
          (define-key org-mode-map [(control c)(control .)] 'org-time-stamp-inactive)))



(provide 'my-keys)
;;; my-keys.el ends here
