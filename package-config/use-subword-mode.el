(defvar subword)

(use-package subword
  :hook (js-mode . subword-mode)
  :diminish subword-mode
  )
