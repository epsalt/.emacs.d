(defun journal-datestamp () (interactive)
       (insert (format-time-string "%A %B %d %Y %H:%M")))

(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text.
   https://www.emacswiki.org/emacs/UnfillParagraph"
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))
