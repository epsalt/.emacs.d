;; No bell
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; Fringe
(fringe-mode 30)
(defun my-tone-down-fringes ()
  (set-face-attribute 'fringe nil
                      :foreground (face-foreground 'default)
                      :background (face-background 'default)))

;; Load theme
(defun my-load-theme ()
  (load-theme 'base16-tomorrow-night t)
  (my-tone-down-fringes))

(my-load-theme)

;; Make sure theme is loaded and fringes are hidden on daemon frames
(defun my-load-theme-frame (frame)
  (select-frame frame)
  (my-load-theme))
(if (daemonp)
    (add-hook 'after-make-frame-functions #'my-load-theme-frame))

(provide 'appearance)
