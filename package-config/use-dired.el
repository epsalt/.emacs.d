(use-package dired
  :ensure nil
  :commands dired
  :hook (dired-mode . dired-hide-details-mode))

(use-package dired-x
  :ensure nil
  :after dired)
