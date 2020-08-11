(use-package org
  :mode (("\\.org\\'" . org-mode))
  :custom
  (org-reverse-note-order t)
  (org-tags-column 70)
  (org-cycle-separator-lines 1)
  (org-agenda-files '("~/Dropbox/ttd.org"))
  :config
  (setq my/colors base16-materia-colors)
  (set-face-attribute 'org-document-title nil :weight 'normal :height 1.0)
  ;; (set-face-attribute 'org-todo nil :height 1.0 :foreground (plist-get my/colors :base03))
  (set-face-attribute 'org-level-1 nil :foreground (plist-get my/colors :base0D))
  (set-face-attribute 'org-level-2 nil :foreground (plist-get my/colors :base03))

  )
