(use-package web-mode
  :ensure t
  :mode ("\\.html?\\'" . web-mode)
  :config
  (setq web-mode-engines-alist '(("django" . "\\.html\\'")))
  (setq web-mode-enable-current-element-highlight t)
  )
