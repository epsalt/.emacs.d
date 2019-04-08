(use-package markdown-mode
  :ensure t
  :commands (markdown-mode)
  :mode
  ("\\.md\\'" . markdown-mode)
  ("\\.markdown\\'" . markdown-mode)
  :hook (markdown-mode-hook . turn-on-auto-fill))
