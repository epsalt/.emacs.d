;; No bell
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

(defun my/load-theme (frame)
  (select-frame frame)
  (load-theme 'base16-tomorrow-night t))
(if (daemonp)
    (add-hook 'after-make-frame-functions #'my/load-theme)
  (load-theme 'base16-tomorrow-night t))

;; Fringe
(fringe-mode 30)
(set-face-attribute 'fringe nil :background nil)

(provide 'appearance)
