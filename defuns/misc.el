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

(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (if (y-or-n-p (concat "Do you really want to delete file " filename " ?"))
            (progn
              (delete-file filename)
              (message "Deleted file %s." filename)
              (kill-buffer)))
      (message "Not a file visiting buffer!"))))

(defun sort-lines-nocase ()
  (interactive)
  (let ((sort-fold-case t))
    (call-interactively 'sort-lines)))

(defun reverse-region-characters (beg end)
  "Reverse characters between BEG and END.
   https://emacs.stackexchange.com/a/38159"
 (interactive "r")
 (let ((region (buffer-substring beg end)))
   (delete-region beg end)
   (insert (nreverse region))))
