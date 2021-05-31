;; (use-package recentf
;;   :ensure t
;;   :demand t
;;   :bind ("C-x C-r" . 'ido-recentf-open)
;;   :custom
;;   (recentf-max-saved-items 150)
;;   (recentf-max-menu-items 50)
;;   :config
;;   (recentf-mode 1)

;;   (defun ido-recentf-open ()
;;     "Use `ido-completing-read' to find a recent file."
;;     (interactive)
;;     (if (find-file (ido-completing-read "Find recent file: " recentf-list))
;;         (message "Opening file...")
;;       (message "Aborting")))
;;   )
