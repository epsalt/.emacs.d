(use-package recentf
:ensure t
:bind ("C-x C-r" . 'ido-recentf-open)
:custom (recentf-max-saved-items 150)
:config
(defun ido-recentf-open ()
  "Use `ido-completing-read' to find a recent file."
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))
)
