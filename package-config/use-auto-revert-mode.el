(defvar autorevert)

(use-package autorevert
  :demand
  :diminish auto-revert-mode
  :commands auto-revert-mode
  :config
  (global-auto-revert-mode t)
  )
