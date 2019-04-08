(use-package dired
  :ensure nil
  :commands dired
  :hook (dired-mode . dired-hide-details-mode))
