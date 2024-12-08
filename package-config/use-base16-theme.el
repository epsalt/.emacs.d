(use-package base16-theme
  :ensure t
  :init
  (setq-default base16-theme-distinct-fringe-background nil)
  :config
  (setq base16-theme-256-color-source "base16-shell")
  (load-theme 'base16-tomorrow-night)

  (setq my/colors base16-tomorrow-night-theme-colors)
  (set-face-attribute 'font-lock-property-use-face nil :foreground (plist-get my/colors :base09) :italic t)
  (set-face-attribute 'font-lock-function-call-face nil :foreground (plist-get my/colors :base0D) :italic t)
  (set-face-attribute 'font-lock-type-face nil :foreground (plist-get my/colors :base0A))
  (set-face-attribute 'font-lock-variable-use-face nil :foreground (plist-get my/colors :base05))
  (set-face-attribute 'font-lock-misc-punctuation-face nil :foreground (plist-get my/colors :base0E))
  (set-face-attribute 'font-lock-number-face nil :foreground (plist-get my/colors :base09))
  (set-face-attribute 'font-lock-constant-face nil :foreground (plist-get my/colors :base0C)))
