(use-package org
  :mode (("\\.org\\'" . org-mode))
  :bind (("C-c a" . org-agenda)
         ("C-c l" . org-store-link))
  :bind (:map org-mode-map
              ("C-c M-," . org-insert-structure-template))
  :custom
  (org-reverse-note-order t)
  (org-tags-column 70)
  (org-cycle-separator-lines 1)
  (org-agenda-files '("~/Dropbox/ttd.org"))
  :config
  (setq my/colors base16-materia-colors)
  (set-face-attribute 'org-document-title nil :weight 'normal :height 1.0)
  (set-face-attribute 'org-level-1 nil :foreground (plist-get my/colors :base0D))
  (set-face-attribute 'org-level-2 nil :foreground (plist-get my/colors :base03))

  (add-hook 'org-mode-hook
            (lambda () (electric-indent-local-mode -1)))
  )
