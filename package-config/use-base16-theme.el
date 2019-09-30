(use-package base16-theme
  :ensure t
  :init
  (setq-default base16-distinct-fringe-background nil)
  :config
  (if (not (display-graphic-p))
      (setq base16-theme-256-color-source "base16-shell"))

  (load-theme 'base16-tomorrow-night t)
  )
