(use-package base16-theme
  :ensure t
  :config
  (defun my-load-theme ()
    (load-theme 'base16-tomorrow-night t)
    (my-tone-down-fringes))

  (defun my-load-theme-frame (frame)
    (select-frame frame)
    (my-load-theme))

  (defun my-tone-down-fringes ()
  (set-face-attribute 'fringe nil
                      :foreground (face-foreground 'default)
                      :background (face-background 'default)))

  ;; Make sure theme is loaded and fringes are hidden on daemon frames
  (if (daemonp)
      (add-hook 'after-make-frame-functions #'my-load-theme-frame))

  (my-load-theme))
