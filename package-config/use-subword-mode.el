(defvar subword)

(use-package subword
  :hook ((js-mode typescript-mode web-mode) . subword-mode)
  :diminish subword-mode
  )
